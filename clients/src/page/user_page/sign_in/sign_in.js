import styled from 'styled-components'
import CustomInputGroup from '../../../components/custom_input';
import { useForm } from 'react-hook-form'
import React from 'react';
import { yupResolver } from '@hookform/resolvers/yup';
import { loginSchema } from '../../../validator/authSchema';
import { PageSize } from '../../../configs/page_size_config';
import { toastError, toastSuccess } from '../../../helpers/toast_helper';
import { handleLoginAction } from '../../../redux/actions/auth';
import { useHistory } from "react-router-dom"

let MainLayout = styled.div`
    width: 100vw;
    height: 100vh;
    background: #cc2b5e; 
    background: -webkit-linear-gradient(to right, #cc2b5e, #753a88); 
    background: linear-gradient(to right, #cc2b5e, #753a88);
    display: flex;
    
    .content{
        margin: auto;
        display: inline-block;
        width: 25%;
        background-color: white;
        padding: 1.5rem 4rem;
        border-radius: .5rem;

        @media (max-width: ${PageSize.laptop}){
            width: 50%;
        }

        @media (max-width: ${PageSize.tablet}){
            width: 70%;
        }
    }

    .header{
        border-bottom: 1px solid black;
        text-align: center;
        margin-bottom: 1rem;
        padding: .5rem;
        
        .title{
            letter-spacing: .3rem;
            font-size: 2rem;
            color: #082032;
        }
    }

    .body{
        margin: 2rem 0;
        width: 100%;
        text-align: center;

        button{
            width: 100%;
            padding: .8rem 0;
            background-color: #082032;
            color: white;
            cursor: pointer;
            transition: all .5s;
            border-radius: .5rem;
            border: 2px solid #082032;
            font-weight: 800;
            text-transform: uppercase;

            &:hover{
                background-color: white;
                color: #082032;
            }
        }

        .action_form{
            padding: 0 0 1rem 0;
            display: flex;
            justify-content: space-between;
            align-items: center;

            div {
                display: flex;
                align-items: center;
                
                label{
                    font-size: .9rem;
                    font-weight: 500;
                }

                input{
                    filter: hue-rotate(30deg);
                }
            }
        }

    }
`


let SignInPage = () => {
    let history = useHistory()
    let { register, handleSubmit, watch, formState: { errors } } = useForm({
        resolver: yupResolver(loginSchema)
    });

    async function onSubmit(data) {
        let status = await handleLoginAction({ email: data.email, password: data.password })

        if (status) {
            toastSuccess("Login is successfull!")
            history.push('/')
        }
    }

    return (
        <MainLayout>
            <div className="content">
                <div className="header">
                    <h2 className="title">LOGIN</h2>
                </div>
                <form onSubmit={handleSubmit(onSubmit)}>
                    <div className="body">
                        <CustomInputGroup label="email" name="email" register={{ ...register('email') }} error={errors.email?.message} />
                        <CustomInputGroup register={{ ...register('password') }} label="Password" type="password" name="password" error={errors.password?.message} />
                        <div className="action_form">
                            <div>
                                <input type="checkbox" id="remember" />
                                <label htmlFor="remember" className="rember_label">Remember me!</label>
                            </div>
                            <div>
                                <label>Forgot passwrod!</label>
                            </div>
                        </div>
                        <button type="submit">Login</button>
                    </div>
                </form>
            </div>
        </MainLayout>
    )
}

export default SignInPage;