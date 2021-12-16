const FCM_TOKEN = 'fcm_token';
const KEY_TOKEN = 'access_token';
const PASSWORD = 'password';
const REFRESH_TOKEN = 'refresh_token';
let FIRST_NAME = 'first_name'
let LAST_NAME = 'last_name'

export const saveFCMToken = fCMToken => localStorage.setItem(FCM_TOKEN, fCMToken);
export const getFCMToken = () => localStorage.getItem(FCM_TOKEN);

export const saveToken = token => localStorage.setItem(KEY_TOKEN, token)
export const getToken = () => localStorage.getItem(KEY_TOKEN)
export const removeToken = () => localStorage.removeItem(KEY_TOKEN);

export const savePassword = password => localStorage.setItem(PASSWORD, password);
export const getPassword = () => localStorage.getItem(PASSWORD)
export const removePassword = () => localStorage.removeItem(PASSWORD);

export const saveRefreshToken = refreshToken => localStorage.setItem(REFRESH_TOKEN, refreshToken);
export const getReFreshToken = () => localStorage.getItem(REFRESH_TOKEN);
export const removeRefreshToken = () => localStorage.removeItem(REFRESH_TOKEN);


export const saveFirstName = firstName => localStorage.setItem(FIRST_NAME, firstName);
export const getFirstName = () => localStorage.getItem(FIRST_NAME)
export const removeFirstName = () => localStorage.removeItem(FIRST_NAME);

export const saveLastName = lastName => localStorage.setItem(LAST_NAME, lastName);
export const getLastName = () => localStorage.getItem(LAST_NAME)
export const removeLastName = () => localStorage.removeItem(LAST_NAME);