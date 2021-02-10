<?php

namespace Pterodactyl\Repositories\Wings;

use Webmozart\Assert\Assert;
use Pterodactyl\Models\Server;
use Psr\Http\Message\ResponseInterface;
use GuzzleHttp\Exception\TransferException;
use Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException;

class DaemonModsRepository extends DaemonRepository
{
    /**
     * Install a plugin in the server
     *
     * @param string $downloadUrl
     * @param string $decompressType
     * @param string $folder
     * @return \Psr\Http\Message\ResponseInterface
     *
     * @throws DaemonConnectionException
     */
    public function install(string $downloadUrl, string $decompressType, string $folder): ResponseInterface
    {
        Assert::isInstanceOf($this->server, Server::class);

        try {
            return $this->getHttpClient()->post(
                sprintf('/api/servers/%s/mods/install', $this->server->uuid),
                [
                    'json' => [
                        'download_url' => $downloadUrl,
                        "decompress_type" => $decompressType,
                        'folder' => $folder,
                    ],
					'timeout' => 120,
                ]
            );
        } catch (TransferException $exception) {
            throw new DaemonConnectionException($exception);
        }
    }

    /**
     * Uninstall a plugin in the server
     *
     * @param bool $removeBase
     * @param string $base
     * @param array $removes
     * @return 193716 \Psr\Http\Message\ResponseInterface
     *
     * @throws DaemonConnectionException
     */
    public function uninstall(bool $removeBase, string $base, array $removes): ResponseInterface
    {
        Assert::isInstanceOf($this->server, Server::class);

        try {
            return $this->getHttpClient()->post(
                sprintf('/api/servers/%s/mods/uninstall', $this->server->uuid),
                [
                    'json' => [
                        'remove_base' => $removeBase,
                        'removes' => $removes,
                        'base' => $base,
                    ],
					'timeout' => 120,
                ]
            );
        } catch (TransferException $exception) {
            throw new DaemonConnectionException($exception);
        }
    }
}
