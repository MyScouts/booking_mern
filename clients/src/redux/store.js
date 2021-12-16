import { createStore, combineReducers, applyMiddleware } from 'redux'
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'

// reducers import
import authReducer from './reducers/auth'


// base store
let reducerBase = combineReducers({
    auth: authReducer
})

let middleware = [thunk]

let store = createStore(
    reducerBase,
    composeWithDevTools(applyMiddleware(...middleware))
)

export default store;