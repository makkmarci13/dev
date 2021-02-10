<?php

namespace Pterodactyl\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\RedirectResponse;
use Prologue\Alerts\AlertsMessageBag;
use Pterodactyl\Exceptions\DisplayException;
use Pterodactyl\Http\Controllers\Controller;

class ModsController extends Controller
{
    /**
     * @var \Prologue\Alerts\AlertsMessageBag
     */
    protected $alert;

    /**
     * @var array
     */
    private $decompress_methods = ['none', 'unzip'];

    /**
     * ModsController constructor.
     * @param AlertsMessageBag $alert
     */
    public function __construct(AlertsMessageBag $alert)
    {
        $this->alert = $alert;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $mods = DB::table('mods')->get();

        return view('admin.mods.index', [
            'mods' => $mods
        ]);
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function new()
    {
        $eggs = DB::table('eggs')->get();

        return view('admin.mods.new', ['eggs' => $eggs]);
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     * @throws DisplayException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function create(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:1|max:80',
            'version' => 'required',
            'category' => 'required|min:1|max:80',
            'description' => 'required|min:1|max:200',
            'egg_ids' => 'required',
            'download' => 'required|min:1|max:190',
            'decompress_type' => 'required',
            'install' => 'sometimes|max:190',
            'remove_selectors' => 'required',
        ]);

        $name = trim(strip_tags($request->input('name')));
        $version = trim(strip_tags($request->input('version')));
        $category = ucfirst(trim(strip_tags($request->input('category'))));
        $description = trim($request->input('description'));
        $egg_ids = $request->input('egg_ids');
        $download = trim($request->input('download'));
        $decompress_type = trim($request->input('decompress_type'));
        $install = trim($request->input('install'));
        $remove_selectors = trim($request->input('remove_selectors'));
        !empty($request->input('uninstall_base', '')) ? $uninstall_base = 1 : $uninstall_base = 0;

        $remove = [];

        foreach (explode(',', $remove_selectors) as $item) {
            if (!empty($request->input('remove' . $item, ''))) {
                array_push($remove, $request->input('remove' . $item));
            }
        }

        if (!in_array($decompress_type, $this->decompress_methods)) {
            throw new DisplayException('Invalid decompress type.');
        }

        DB::table('mods')->insert([
            'name' => $name,
            'description' => $description,
            'category_name' => $category,
            'version' => $version,
            'egg_id' => implode(',', $egg_ids),
            'download_url_zip' => $download,
            'decompress_type' => $decompress_type,
            'install_folder' => $install,
            'uninstall_name' => serialize($remove),
            'uninstall_base' => $uninstall_base,
        ]);

        $this->alert->success('You have successfully created new mod.')->flash();

        return redirect()->route('admin.mods');
    }

    /**
     * @param $mod_id
     * @return \Illuminate\Contracts\View\Factory|RedirectResponse|\Illuminate\View\View
     * @throws DisplayException
     */
    public function edit($mod_id)
    {
        $mod_id = (int) $mod_id;

        $mod = DB::table('mods')->where('id', '=', $mod_id)->get();
        if (count($mod) < 1) {
            throw new DisplayException('Mod not found.');
        }

        $eggs = DB::table('eggs')->get();

        $key = 0;
        $removes = '';

        foreach (unserialize($mod[0]->uninstall_name) as $item) {
            $key = $key + 1;
            empty($removes) ? $removes = $key : $removes = $removes . ',' . $key;
        }

        return view('admin.mods.edit', ['mod' => $mod[0], 'eggs' => $eggs, 'removes' => $removes]);
    }

    /**
     * @param Request $request
     * @param $mod_id
     * @return RedirectResponse
     * @throws DisplayException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request, $mod_id)
    {
        $mod_id = (int) $mod_id;

        $domain = DB::table('mods')->where('id', '=', $mod_id)->get();
        if (count($domain) < 1) {
            throw new DisplayException('Mod not found.');
        }

        $this->validate($request, [
            'name' => 'required|min:1|max:80',
            'version' => 'required',
            'category' => 'required|min:1|max:80',
            'description' => 'required|min:1|max:200',
            'egg_ids' => 'required',
            'download' => 'required|min:1|max:190',
            'decompress_type' => 'required',
            'install' => 'sometimes|max:190',
            'remove_selectors' => 'sometimes',
        ]);

        $name = trim(strip_tags($request->input('name')));
        $version = trim(strip_tags($request->input('version')));
        $category = ucfirst(trim(strip_tags($request->input('category'))));
        $description = trim($request->input('description'));
        $egg_ids = $request->input('egg_ids');
        $download = trim($request->input('download'));
        $decompress_type = trim($request->input('decompress_type'));
        $install = trim($request->input('install'));
        $remove_selectors = trim($request->input('remove_selectors'));
        !empty($request->input('uninstall_base', '')) ? $uninstall_base = 1 : $uninstall_base = 0;

        $remove = [];

        foreach (explode(',', $remove_selectors) as $item) {
            if (!empty($request->input('remove' . $item, ''))) {
                array_push($remove, $request->input('remove' . $item));
            }
        }

        if (!in_array($decompress_type, $this->decompress_methods)) {
            throw new DisplayException('Invalid decompress type.');
        }

        DB::table('mods')->where('id', '=', $mod_id)->update([
            'name' => $name,
            'description' => $description,
            'category_name' => $category,
            'version' => $version,
            'egg_id' => implode(',', $egg_ids),
            'download_url_zip' => $download,
            'decompress_type' => $decompress_type,
            'install_folder' => $install,
            'uninstall_name' => serialize($remove),
            'uninstall_base' => $uninstall_base,
        ]);

        $this->alert->success('You have successfully edited this mod.')->flash();

        return redirect()->route('admin.mods.edit', $mod_id);
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete(Request $request)
    {
        $mod_id = (int) $request->input('id', '');

        $mod = DB::table('mods')->where('id', '=', $mod_id)->get();
        if (count($mod) < 1) {
            return response()->json(['error' => 'Mod not found.'])->setStatusCode(500);
        }

        DB::table('mods')->where('id', '=', $mod_id)->delete();

        return response()->json(['success' => true]);
    }
}
