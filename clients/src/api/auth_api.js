import { AppConfig } from "../configs/app_config";
import RequestHelper from "../helpers/request_helper";

let LOGIN_URL = `${AppConfig.API_URL}/auth/signin`

export let requestLoginServices = ({ email, password }) => RequestHelper.post(LOGIN_URL, { email, password })