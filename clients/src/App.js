import { BrowserRouter as Router, Route, Switch, Redirect } from 'react-router-dom'
import AdminRouter from './configs/routers/admin_router';
import UserRouter from './configs/routers/user_router';
import DashBoardPage from './page/admin_page/dasboard/dasboard';
import HomePage from './page/user_page/home/home';
import SignInPage from './page/user_page/sign_in/sign_in';
import './style.scss'
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import io from "socket.io-client";

const socket = io.connect('http://localhost:3000');

function App() {

    let toasController = () => {
        return (<ToastContainer />)
    }

    return (
        <Router>
            <Switch>
                {/* Auth */}
                <Route path="/login" component={SignInPage} />

                {/* user */}
                <UserRouter exact path="/" component={HomePage} />

                {/* admin */}
                <AdminRouter exact path="/admin" component={DashBoardPage} />
                <Redirect to="/" />
            </Switch>
            {toasController()}
        </Router>
    );
}

export default App;
