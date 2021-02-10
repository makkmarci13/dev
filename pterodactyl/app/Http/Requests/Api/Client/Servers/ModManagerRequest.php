<?php

namespace Pterodactyl\Http\Requests\Api\Client\Servers;

use Pterodactyl\Http\Requests\Api\Client\ClientApiRequest;

class ModManagerRequest extends ClientApiRequest
{
    /**
     * @return string
     */
    public function permission()
    {
        return 'mods.manage';
    }
}
