import * as actionTypes from '../constains/auth'

export let authReducer = (state = {}, action) => {
    switch (action.type) {
        case actionTypes.LOGIN_REQUEST:
            return {
                loading: true,
                auth: {}
            }
        case actionTypes.LOGIN_SUCCESS:
            return {
                loading: false,
                auth: action.payload
            }
        case actionTypes.LOGIN_FAILD:
            return {
                loading: false,
                auth: {}
            }
        case actionTypes.LOGOUT_REQUEST:
            return {
                loading: true
            }
        case actionTypes.LOGOUT_SUCCESS:
            return {
                loading: false,
                auth: {}
            }
        default:
            return state;
    }
}

export default authReducer