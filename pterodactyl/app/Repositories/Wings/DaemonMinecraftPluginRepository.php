<?php

namespace Pterodactyl\Repositories\Wings;

use Webmozart\Assert\Assert;
use Pterodactyl\Models\Server;
use Psr\Http\Message\ResponseInterface;
use GuzzleHttp\Exception\TransferException;
use Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException;

class DaemonMinecraftPluginRepository extends DaemonRepository
{
    /**
     * Install a plugin in the server
     *
     * @param string $downloadUrl
     * @return \Psr\Http\Message\ResponseInterface
     *
     * @throws 273040 \Pterodactyl\Exceptions\Http\Connection\DaemonConnectionException
     */
    public function install(string $downloadUrl): ResponseInterface
    {
        Assert::isInstanceOf($this->server, Server::class);

        try {
            return $this->getHttpClient()->post(
                sprintf('/api/servers/%s/plugins/install', $this->server->uuid),
                [
                    'json' => [
                        'download_url' => $downloadUrl,
                    ],
                ]
            );
        } catch (TransferException $exception) {
            throw new DaemonConnectionException($exception);
        }
    }
}
