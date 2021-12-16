import styled from 'styled-components'
import { faEye, faEyeSlash } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import React, { useState } from 'react'
// 

let InputGroup = styled.div`
    margin: 1rem 0;
    align-items: center;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    
    label{
        display: inline-block;
        font-size: 1rem;
        color: #2C394B;
        font-weight: 800;
        text-transform: uppercase;
        margin-bottom: .5rem;
    }

    .input_form{
        width: 100%;
        position: relative;

        input{
            padding: 1rem .5rem;
            background-color: #E1E5EA;
            border-radius:.3rem;
            width: 100%;
            font-weight: 800;
            color: #2C394B;
            -webkit-box-sizing: border-box; 
            -moz-box-sizing: border-box;   
            box-sizing: border-box; 
        }

        .icon_prex_fix{
            position: absolute;
            top: 35%; 
            right: 1rem;
            color: #2C394B;
            cursor: pointer;
            /* transform: translate(-50%, -50%); */
        }
    }

    .text_error{
        color: red;
        font-size: .9rem;
        display: inline-block;
        margin-top: 5px;
        font-weight: 500;
    }

`

// let CustomInputGroup = (props) => {
let CustomInputGroup = React.forwardRef((props, ref) => {
    const [show, setshow] = useState(false)

    function onChangeTypePassword() {
        return () => setshow(!show)
    }

    return (
        <InputGroup>
            {props.label && <label htmlFor={props.name}> {props.label}</label>}
            <div className="input_form">
                {props.type !== 'password'
                    ?
                    <input type="text" name={props.name} id={props.name} {...props.register} />
                    :
                    <>
                        <input type={show ? "text" : "password"} name={props.name} id={props.name} {...props.register} />
                        <FontAwesomeIcon icon={show ? faEye : faEyeSlash} className="icon_prex_fix" onClick={onChangeTypePassword()} />
                    </>
                }
            </div>
            <span className="text_error">{props.error}</span>
        </InputGroup>
    )
})

export default CustomInputGroup