import React, { useState } from 'react';
import Button from '@/components/elements/Button';
import { Actions, useStoreActions } from 'easy-peasy';
import { ApplicationStore } from '@/state';
import { ServerContext } from '@/state/server';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faDownload, faTrash } from '@fortawesome/free-solid-svg-icons';
import uninstallMod from '@/api/server/mods/uninstallMod';
import installMod from '@/api/server/mods/installMod';
import { httpErrorToHuman } from '@/api/http';

interface Props {
    modId: number;
    installed: boolean;
}

export default ({ modId, installed }: Props) => {
    const uuid = ServerContext.useStoreState(state => state.server.data!.uuid);

    const [ disabled, setDisabled ] = useState(false);
    const [ isInstalled, setInstalled ] = useState(installed);

    const { addError, clearFlashes } = useStoreActions((actions: Actions<ApplicationStore>) => actions.flashes);

    const submit = () => {
        setDisabled(true);
        clearFlashes('server:mods');

        if (isInstalled) {
            uninstallMod(uuid, modId)
                .then(() => {
                    setInstalled(false);
                    setDisabled(false);
                })
                .catch(error => {
                    setDisabled(false);
                    addError({ key: 'server:mods', message: httpErrorToHuman(error) });
                });
        } else {
            installMod(uuid, modId)
                .then(() => {
                    setInstalled(true);
                    setDisabled(false);
                })
                .catch(error => {
                    setDisabled(false);
                    addError({ key: 'server:mods', message: httpErrorToHuman(error) });
                });
        }
    };

    return (
        <>
            <Button css={'float: right; margin-top: .8rem;'} isLoading={disabled} disabled={disabled} type={'button'} size={'xsmall'} color={(isInstalled ? 'red' : 'green')} onClick={submit}>
                <FontAwesomeIcon icon={isInstalled ? faTrash : faDownload}/> {isInstalled ? 'Uninstall' : 'Install'}
            </Button>
        </>
    );
};
