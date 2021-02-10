import TransferListener from '@/components/server/TransferListener';
import React, { useEffect, useState } from 'react';
import { NavLink, Route, RouteComponentProps, Switch } from 'react-router-dom';
import NavigationBar from '@/components/NavigationBar';
import ServerConsole from '@/components/server/ServerConsole';
import TransitionRouter from '@/TransitionRouter';
import WebsocketHandler from '@/components/server/WebsocketHandler';
import { ServerContext } from '@/state/server';
import DatabasesContainer from '@/components/server/databases/DatabasesContainer';
import FileManagerContainer from '@/components/server/files/FileManagerContainer';
import { CSSTransition } from 'react-transition-group';
import SuspenseSpinner from '@/components/elements/SuspenseSpinner';
import FileEditContainer from '@/components/server/files/FileEditContainer';
import SettingsContainer from '@/components/server/settings/SettingsContainer';
import ScheduleContainer from '@/components/server/schedules/ScheduleContainer';
import ScheduleEditContainer from '@/components/server/schedules/ScheduleEditContainer';
import UsersContainer from '@/components/server/users/UsersContainer';
import Can from '@/components/elements/Can';
import BackupContainer from '@/components/server/backups/BackupContainer';
import Spinner from '@/components/elements/Spinner';
import ServerError from '@/components/screens/ServerError';
import { httpErrorToHuman } from '@/api/http';
import NotFound from '@/components/screens/NotFound';
import { useStoreState } from 'easy-peasy';
import ScreenBlock from '@/components/screens/ScreenBlock';
import SubNavigation from '@/components/elements/SubNavigation';
import NetworkContainer from '@/components/server/network/NetworkContainer';
import InstallListener from '@/components/server/InstallListener';
import StartupContainer from '@/components/server/startup/StartupContainer';
import ErrorBoundary from '@/components/elements/ErrorBoundary';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faExternalLinkAlt } from '@fortawesome/free-solid-svg-icons';
import RequireServerPermission from '@/hoc/RequireServerPermission';
import SubdomainContainer from '@/components/server/subdomain/SubdomainContainer';
import PluginInstallerContainer from '@/components/server/plugins/PluginInstallerContainer';
import VersionsContainer from '@/components/server/versions/VersionsContainer';
import ModsContainer from '@/components/server/mods/ModsContainer';

const ServerRouter = ({ match, location }: RouteComponentProps<{ id: string }>) => {
    const rootAdmin = useStoreState(state => state.user.data!.rootAdmin);
    const [ error, setError ] = useState('');
    const [ installing, setInstalling ] = useState(false);
    const [ transferring, setTransferring ] = useState(false);

    const id = ServerContext.useStoreState(state => state.server.data?.id);
    const uuid = ServerContext.useStoreState(state => state.server.data?.uuid);
    const isInstalling = ServerContext.useStoreState(state => state.server.data?.isInstalling);
    const isTransferring = ServerContext.useStoreState(state => state.server.data?.isTransferring);
    const serverId = ServerContext.useStoreState(state => state.server.data?.internalId);
    const getServer = ServerContext.useStoreActions(actions => actions.server.getServer);
    const clearServerState = ServerContext.useStoreActions(actions => actions.clearServerState);
    const nestId = ServerContext.useStoreState(state => state.server.data?.nestId);

    useEffect(() => () => {
        clearServerState();
    }, []);

    useEffect(() => {
        setInstalling(!!isInstalling);
    }, [ isInstalling ]);

    useEffect(() => {
        setTransferring(!!isTransferring);
    }, [ isTransferring ]);

    useEffect(() => {
        setError('');
        setInstalling(false);
        setTransferring(false);

        getServer(match.params.id)
            .catch(error => {
                if (error.response?.status === 409) {
                    if (error.response.data?.errors[0]?.code === 'ServerTransferringException') {
                        setTransferring(true);
                    } else {
                        setInstalling(true);
                    }
                } else {
                    console.error(error);
                    setError(httpErrorToHuman(error));
                }
            });

        return () => {
            clearServerState();
        };
    }, [ match.params.id ]);

    return (
        <React.Fragment key={'server-router'}>
            <NavigationBar/>
            {(!uuid || !id) ?
                error ?
                    <ServerError message={error}/>
                    :
                    <Spinner size={'large'} centered/>
                :
                <>
                    <CSSTransition timeout={150} classNames={'fade'} appear in>
                        <SubNavigation>
                            <div>
                                <NavLink to={`${match.url}`} exact>Console</NavLink>
                                <Can action={'file.*'}>
                                    <NavLink to={`${match.url}/files`}>File Manager</NavLink>
                                </Can>
                                <Can action={'database.*'}>
                                    <NavLink to={`${match.url}/databases`}>Databases</NavLink>
                                </Can>
                                <Can action={'schedule.*'}>
                                    <NavLink to={`${match.url}/schedules`}>Schedules</NavLink>
                                </Can>
                                <Can action={'user.*'}>
                                    <NavLink to={`${match.url}/users`}>Users</NavLink>
                                </Can>
                                <Can action={'backup.*'}>
                                    <NavLink to={`${match.url}/backups`}>Backups</NavLink>
                                </Can>
                                <Can action={'allocation.*'}>
                                    <NavLink to={`${match.url}/network`}>Network</NavLink>
                                </Can>
                                <Can action={'startup.*'}>
                                    <NavLink to={`${match.url}/startup`}>Startup</NavLink>
                                </Can>
                                <Can action={'subdomain.*'}>
	<NavLink to={`${match.url}/subdomain`}>Subdomain</NavLink>
</Can>
{nestId === 1 &&
<Can action={'plugins.*'}>
	<NavLink to={`${match.url}/plugins`}>Plugins</NavLink>
</Can>
}                              
<Can action={'versions.*'}>
	<NavLink to={`${match.url}/versions`}>Versions</NavLink>
</Can>                           
<Can action={'mods.*'}>
	<NavLink to={`${match.url}/mods`}>Mods</NavLink>
</Can>                             
                                <Can action={[ 'settings.*', 'file.sftp' ]} matchAny>
                                    <NavLink to={`${match.url}/settings`}>Settings</NavLink>
                                </Can>
                                {rootAdmin &&
                                <a href={'/admin/servers/view/' + serverId} rel="noreferrer" target={'_blank'}>
                                    <FontAwesomeIcon icon={faExternalLinkAlt}/>
                                </a>
                                }
                            </div>
                        </SubNavigation>
                    </CSSTransition>
                    <InstallListener/>
                    <TransferListener/>
                    <WebsocketHandler/>
                    {((installing || transferring) && (!rootAdmin || (rootAdmin && !location.pathname.endsWith(`/server/${id}`)))) ?
                        <ScreenBlock
                            title={installing ? 'Your server is installing.' : 'Your server is currently being transferred.'}
                            image={'/assets/svgs/server_installing.svg'}
                            message={'Please check back in a few minutes.'}
                        />
                        :
                        <ErrorBoundary>
                            <TransitionRouter>
                                <Switch location={location}>
                                    <Route path={`${match.path}`} component={ServerConsole} exact/>
                                    <Route path={`${match.path}/files`} exact>
                                        <RequireServerPermission permissions={'file.*'}>
                                            <FileManagerContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/files/:action(edit|new)`} exact>
                                        <SuspenseSpinner>
                                            <FileEditContainer />
                                        </SuspenseSpinner>
                                    </Route>
                                    <Route path={`${match.path}/databases`} exact>
                                        <RequireServerPermission permissions={'database.*'}>
                                            <DatabasesContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/schedules`} exact>
                                        <RequireServerPermission permissions={'schedule.*'}>
                                            <ScheduleContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/schedules/:id`} exact>
                                        <ScheduleEditContainer/>
                                    </Route>
                                    <Route path={`${match.path}/users`} exact>
                                        <RequireServerPermission permissions={'user.*'}>
                                            <UsersContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/backups`} exact>
                                        <RequireServerPermission permissions={'backup.*'}>
                                            <BackupContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/network`} exact>
                                        <RequireServerPermission permissions={'allocation.*'}>
                                            <NetworkContainer />
                                        </RequireServerPermission>
                                    </Route>
                                    <Route path={`${match.path}/startup`} component={StartupContainer} exact/>
                                    <Route path={`${match.path}/settings`} component={SettingsContainer} exact/>
                                  <Route path={`${match.path}/subdomain`} exact>
	<RequireServerPermission permissions={'subdomain.*'}>
		<SubdomainContainer />
	</RequireServerPermission>
</Route>
{nestId === 1 &&
<Route path={`${match.path}/plugins`} exact>
	<RequireServerPermission permissions={'plugins.*'}>
		<PluginInstallerContainer />
	</RequireServerPermission>
</Route>
}                             
<Route path={`${match.path}/versions`} exact>
	<RequireServerPermission permissions={'versions.*'}>
		<VersionsContainer />
	</RequireServerPermission>
</Route>         
<Route path={`${match.path}/mods`} exact>
	<RequireServerPermission permissions={'mods.*'}>
		<ModsContainer />
	</RequireServerPermission>
</Route>          
                                    <Route path={'*'} component={NotFound}/>
                                </Switch>
                            </TransitionRouter>
                        </ErrorBoundary>
                    }
                </>
            }
        </React.Fragment>
    );
};

export default (props: RouteComponentProps<any>) => (
    <ServerContext.Provider>
        <ServerRouter {...props}/>
    </ServerContext.Provider>
);
