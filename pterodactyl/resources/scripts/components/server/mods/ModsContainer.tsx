import React, { useEffect } from 'react';
import { ServerContext } from '@/state/server';
import ServerContentBlock from '@/components/elements/ServerContentBlock';
import tw from 'twin.macro';
import FlashMessageRender from '@/components/FlashMessageRender';
import useSWR from 'swr';
import getMods from '@/api/server/mods/getMods';
import useFlash from '@/plugins/useFlash';
import Spinner from '@/components/elements/Spinner';
import TitledGreyBox from '@/components/elements/TitledGreyBox';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPuzzlePiece } from '@fortawesome/free-solid-svg-icons';
import GreyRowBox from '@/components/elements/GreyRowBox';
import ManageButton from '@/components/server/mods/ManageButton';

export interface ModsResponse {
    mods: any[];
    categories: any[];
}

export default () => {
    const uuid = ServerContext.useStoreState(state => state.server.data!.uuid);

    const { clearFlashes, clearAndAddHttpError } = useFlash();
    const { data, error } = useSWR<ModsResponse>([ uuid, '/mods' ], key => getMods(key));

    useEffect(() => {
        if (!error) {
            clearFlashes('server:mods');
        } else {
            clearAndAddHttpError({ key: 'server:mods', error });
        }
    }, [ error ]);

    return (
        <ServerContentBlock title={'Mod Manager'} css={tw`flex flex-wrap`}>
            <div css={tw`w-full`}>
                <FlashMessageRender byKey={'server:mods'} css={tw`mb-4`} />
            </div>
            {!data ?
                (
                    <div css={tw`w-full`}>
                        <Spinner size={'large'} centered />
                    </div>
                )
                :
                (
                    <div css={tw`w-full`}>
                        {data.categories.length < 1 ?
                            <p css={tw`text-center text-sm text-neutral-400 pt-4 pb-4`}>
                                There are no specified files in this server.
                            </p>
                            :
                            <div css={tw`flex flex-wrap`}>
                                {data.categories.map((category, categoryKey) => (
                                    <div css={tw`lg:w-6/12 lg:pl-4 pt-4`} key={`category_${categoryKey}`}>
                                        <TitledGreyBox title={category.name}>
                                            <div css={tw`px-1 py-2`}>
                                                {data.mods[category.key].map((mod: any, modKey: any) => (
                                                    <GreyRowBox key={`mod_${modKey}`} css={[ tw`bg-neutral-600 flex items-center`, modKey > 0 && tw`mt-2` ]}>
                                                        <FontAwesomeIcon icon={faPuzzlePiece} css={tw`text-neutral-300`} />
                                                        <div css={tw`ml-4 flex-1 overflow-hidden`}>
                                                            <p css={tw`text-sm break-words`}>{mod.name} <small>{mod.version}</small></p>
                                                            <p css={tw`text-2xs text-neutral-300`}>{mod.description}</p>
                                                        </div>
                                                        <ManageButton modId={mod.id} installed={mod.installed}></ManageButton>
                                                    </GreyRowBox>
                                                ))}
                                            </div>
                                        </TitledGreyBox>
                                    </div>
                                ))}
                            </div>
                        }
                    </div>
                )
            }
        </ServerContentBlock>
    );
};
