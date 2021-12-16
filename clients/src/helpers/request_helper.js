import axios from 'axios'
import qs from 'qs'
import { getToken } from './storage_helper'
import { onPick } from './sweetalert_helper'
let configTimeOut = 20000

let instance = axios.create({
    timeout: configTimeOut,
    maxContentLength: 5 * 1024 * 1024,
    maxBodyLength: 5 * 1024 * 1024,
})

const handleRefreshToken = async error => { };

instance.interceptors.response.use(
    async response => {
        return response;
    },

    error => {
        if (error.response?.status === 408 || error?.code === 'ECONNABORTED') {
            // DialogHelper.showConfirmDialog({
            //   title: I18n.translate('problems_connecting_to_the_server'),
            //   message: I18n.translate('server_error'),
            //   color: colors.secondary,
            //   SVGImage: ImgServerError,
            //   confirmText: I18n.translate('close'),
            // });
        } else if (error.response?.status === 401) {
            let customError = new Error('Authorization error');
            customError.response = error.response;
            customError.isAxiosError = true;
            return handleRefreshToken(customError);
        } else if (!error.status) {
            // DialogHelper.showConfirmDialog({
            //   title: I18n.translate('error_due_to_loss_of_network_connection'),
            //   message: I18n.translate('network_error'),
            //   color: colors.secondary,
            //   SVGImage: ImgNetworkError,
            //   confirmText: I18n.translate('close'),
            // });
        }
        // store.dispatch(hideLoading());
        return Promise.reject(error);
    },
)


const handleError = async error => {
    console.log('handleError error', error);
};

const preprocessResponse = data => {
    // if (data.status >= 300) {
    //     // eslint-disable-next-line no-throw-literal
    //     // onPick()
    //     throw { response: data };
    // }
    return data;
};

export default class RequestHelper {
    static async getHeader() {
        const token = getToken();
        return {
            Accept: 'application/json',
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
            // Platform: Platform.OS,
            // Version: DeviceInfo.getReadableVersion(),
            // VersionCMS: AppConfig.versionCMS,
        };
    }
    static async get(url, params) {
        const header = await this.getHeader();
        const source = axios.CancelToken.source();
        setTimeout(() => {
            source.cancel();
        }, configTimeOut);
        return instance
            .get(url, {
                headers: header,
                // params: { ...params, culture: getCulture() },
                paramsSerializer: params => {
                    return qs.stringify(params, { arrayFormat: 'repeat' });
                },
                cancelToken: source.token,
            })
            .then(data => {
                return data?.data;
            })
            .then(data => {
                return preprocessResponse(data);
            })
            .catch(e => {
                // FIXME: do not handle error here
                handleError(e);
                throw e;
            });
    }

    static async post(url, data, additionalHeader = {}) {
        // const source = axios.CancelToken.source();
        setTimeout(() => {
            // source.cancel();
        }, configTimeOut);
        const headers = await this.getHeader();
        return instance(
            {
                method: 'post',
                url: url,
                headers: { ...headers, ...additionalHeader },
                data: data,
                // params: { culture: getCulture() },
            },
            // { cancelToken: source.token },
        )
            .then(data => {
                return data?.data;
            })
            .then(data => {
                return preprocessResponse(data);
            })
            .catch(e => {
                handleError(e);
                throw e;
            });
    }

    static async put(apiUrl, data) {
        const source = axios.CancelToken.source();
        setTimeout(() => {
            source.cancel();
        }, configTimeOut);
        return instance(
            {
                method: 'put',
                url: apiUrl,
                headers: await this.getHeader(),
                data: data,
            },
            { cancelToken: source.token },
        )
            .then(data => {
                return data.data;
            })
            .then(data => {
                return preprocessResponse(data);
            })
            .catch(e => {
                handleError(e);
                throw e;
            });
    }

    static async delete(apiUrl, data) {
        const source = axios.CancelToken.source();
        setTimeout(() => {
            source.cancel();
        }, configTimeOut);
        return instance(
            {
                method: 'delete',
                url: apiUrl,
                headers: await this.getHeader(),
                data: data,
            },
            { cancelToken: source.token },
        )
            .then(data => {
                return data.data;
            })
            .then(data => {
                return preprocessResponse(data);
            })
            .catch(e => {
                handleError(e);
                throw e;
            });
    }
}

export function getUrlParams(search) {
    let hashes = search.slice(search.indexOf('?') + 1).split('&');
    return hashes.reduce((params, hash) => {
        let [key, val] = hash.split('=');
        return Object.assign(params, { [key]: decodeURIComponent(val) });
    }, {});
}
