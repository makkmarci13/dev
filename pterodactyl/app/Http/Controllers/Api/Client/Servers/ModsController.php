<?php

namespace Pterodactyl\Http\Controllers\Api\Client\Servers;

use Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException;
use Pterodactyl\Models\Server;
use Illuminate\Support\Facades\DB;
use Pterodactyl\Exceptions\DisplayException;
use Pterodactyl\Repositories\Wings\DaemonModsRepository;
use Pterodactyl\Http\Controllers\Api\Client\ClientApiController;
use Pterodactyl\Http\Requests\Api\Client\Servers\ModManagerRequest;

class ModsController extends ClientApiController
{
    /**
     * @var \Pterodactyl\Http\Requests\Api\Client\Servers\ModManagerRequest
     */
    protected $daemonModsRepository;

    /**
     * ModsController constructor.
     * @param DaemonModsRepository $daemonModsRepository
     */
    public function __construct(DaemonModsRepository $daemonModsRepository)
    {
        parent::__construct();

        $this->daemonModsRepository = $daemonModsRepository;
    }

    /**
     * @param ModManagerRequest $request
     * @param Server $server
     * @return array
     */
    public function index(ModManagerRequest $request, Server $server): array
    {
        $mods = DB::table('mods')->get();
        $installedMods = DB::table('installed_mods')->where('server_id', '=', $server->id)->get();

        $categories = [];
        $modsToView = [];

        foreach ($mods as $mod) {
            $egg_ids = explode(',', $mod->egg_id);

            if (in_array($server->egg_id, $egg_ids)) {
                $category = trim(strtolower($mod->category_name));

                foreach ($categories as $item) {
                    if ($item['key'] == $category) {
                        goto checkInstalled;
                    }
                }

                array_push($categories, [
                    'key' => $category,
                    'name' => $mod->category_name,
                ]);

                checkInstalled:
                $mod->installed = false;

                foreach ($installedMods as $installedMod) {
                    if ($mod->id == $installedMod->mod_id) {
                        $mod->installed = true;
                    }
                }

                $modsToView[$category][] = $mod;
            }
        }

        return [
            'success' => true,
            'data' => [
                'mods' => $modsToView,
                'categories' => $categories,
            ],
        ];
    }

    /**
     * @param ModManagerRequest $request
     * @param Server $server
     * @return array
     * @throws DisplayException
     */
    public function install(ModManagerRequest $request, Server $server): array
    {
        $modId = trim(strip_tags($request->input('modId', 0)));

        $mod = DB::table('mods')->where('id', '=', $modId)->get();
        if (count($mod) < 1) {
            throw new DisplayException('Mod not found.');
        }

        $egg_ids = explode(',', $mod[0]->egg_id);
        if (!in_array($server->egg_id, $egg_ids)) {
            throw new DisplayException('Mod not found.');
        }

        $modInstalled = DB::table('installed_mods')->where('server_id', '=', $server->id)->where('mod_id', '=', $modId)->get();
        if (count($modInstalled) > 0) {
            throw new DisplayException('This mod is already installed.');
        }

        try {
            $install = $this->daemonModsRepository->setServer($server)->install($mod[0]->download_url_zip, $mod[0]->decompress_type, $mod[0]->install_folder);
        } catch (DaemonConnectionException $e) {
            throw new DisplayException('Failed to install the mod.');
        }

        if (json_decode($install->getBody())->success != true) {
            throw new DisplayException('Failed to install the mod.');
        }

        DB::table('installed_mods')->insert([
            'server_id' => $server->id,
            'mod_id' => $mod[0]->id,
        ]);

        return [
            'success' => true,
            'data' => [],
        ];
    }

    /**
     * @param ModManagerRequest $request
     * @param Server $server
     * @return array
     * @throws DisplayException
     */
    public function uninstall(ModManagerRequest $request, Server $server): array
    {
        $modId = trim(strip_tags($request->input('modId', 0)));

        $isInstalled = DB::table('installed_mods')->where('server_id', '=', $server->id)->where('mod_id', '=', $modId)->get();
        if (count($isInstalled) < 1) {
            throw new DisplayException('This mod isn\'t installed.');
        }

        $mod = DB::table('mods')->where('id', '=', $isInstalled[0]->mod_id)->get();
        if (count($mod) < 1) {
            throw new DisplayException('Mod not found.');
        }

        try {
            $uninstall = $this->daemonModsRepository->setServer($server)->uninstall($mod[0]->uninstall_base == 1, $mod[0]->install_folder, unserialize($mod[0]->uninstall_name));
        } catch (DaemonConnectionException $e) {
            throw new DisplayException('Failed to uninstall the mod.');
        }

        if (json_decode($uninstall->getBody())->success != true) {
            throw new DisplayException('Failed to uninstall the mod.');
        }

        DB::table('installed_mods')->where('server_id', '=', $server->id)->where('mod_id', '=', $mod[0]->id)->delete();

        return [
            'success' => true,
            'data' => [],
        ];
    }
}
