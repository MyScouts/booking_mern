import * as yup from "yup";

export let loginSchema = yup.object({
    email: yup.string().email().required(),
    password: yup.string().required().min(6),
});