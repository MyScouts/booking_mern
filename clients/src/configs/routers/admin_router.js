import { Route } from 'react-router-dom'
import AdminLayout from '../../components/layouts/admin'

let Layout = ({ children, ...rest }) => {
    return (
        <AdminLayout>{children}</AdminLayout>
    )
}

let AdminRouter = ({ component: Component, ...rest }) => (
    <Route {...rest} render={props => (
        <Layout><Component {...props}></Component></Layout>
    )}>

    </Route>
)

export default AdminRouter