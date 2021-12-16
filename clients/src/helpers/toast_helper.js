import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

toast.configure();
export const notify = () => toast("Wow so easy!");
export const toastError = message => toast.error(message);
export const toastSuccess = message => toast.success(message);
