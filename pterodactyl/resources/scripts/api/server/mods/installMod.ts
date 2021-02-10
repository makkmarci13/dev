import http from '@/api/http';

export default (uuid: string, modId: number): Promise<any> => {
    return new Promise((resolve, reject) => {
        http.post(`/api/client/servers/${uuid}/mods/install`, {
            modId,
        }, {
            timeout: 120000,
        }).then((data) => {
            resolve(data.data || []);
        }).catch(reject);
    });
};
