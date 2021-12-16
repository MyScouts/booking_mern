import { Route, Redirect } from 'react-router-dom'
import UserLayout from '../../components/layouts/user'
import { getToken } from '../../helpers/storage_helper'
import { notify, toastError } from '../../helpers/toast_helper'

let Layout = ({ children, ...rest }) => {
    return (
        <UserLayout>{children}</UserLayout>
    )
}

let UserRouter = ({ component: Component, ...rest }) => {
    let token = getToken()

    return (
        token !== null
            ?
            <Route {...rest} render={props => (
                <Layout><Component {...props}></Component></Layout>
            )}>
            </Route>
            :
            <>
                <Redirect to="/login" />
            </>
    )
}

export default UserRouter