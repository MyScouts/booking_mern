/* eslint-disable jsx-a11y/alt-text */
import styled from "styled-components"
import { AVATAR } from "../../../utils/app_image"
import { getFirstName, getLastName, removeFirstName, removeLastName, removeToken } from '../../../helpers/storage_helper'
import { useState } from "react"
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome"
import { faDiceSix, faSignOutAlt, faUser } from "@fortawesome/free-solid-svg-icons"
import { useHistory } from "react-router"
import { toastSuccess } from "../../../helpers/toast_helper"

let AvatarWrapper = styled.div`
    display: flex;
    align-items: center;
    padding-left: 2rem;
    cursor: pointer;
    position: relative;
    
    .avatar {
        width: 3rem;
        border-radius: 50px;
        height: 3rem;
    }
    .user_name{
        margin-left: 5px;
        font-size: .9rem;
        font-weight: 800;
    }

    .modal{
        width: 200%;
        position: absolute;
        top: 120%;
        background-color: white;
        box-shadow: 0 0 1px black;
        padding: 1rem 2rem;
        display: block;
        right: 0;
        
        .header{
            display: flex;
            width: 100%;
            border-bottom: 1px solid gray;
            padding-bottom: .5rem;
            align-items: center;

            .description{
                margin-left: 1rem;
                line-height: 1.2rem;

                .fullname{
                    font-weight: 800;
                }
            }
        }

        .feture-action{
            display: flex;
            width: 100%;
            border-bottom: 1px solid gray;
            padding: 1rem 0 .5rem 0;
            align-items: center;
            
            .icon{
                line-height: 1.2rem;
            }

            .name{
                font-weight: 800;
                margin-left: 10px;
            }
        }

    }
`

let Avatar = () => {
    const [showProfile, setshowProfile] = useState(false)
    let history = useHistory()
    let firstName = getFirstName()
    let lastName = getLastName()

    let showModal = (status) => {
        return () => {
            setTimeout(() => {
                setshowProfile(status)
            }, 100);
        }
    }

    let onLogOut = () => {
        return () => {
            removeToken()
            removeLastName()
            removeFirstName()
            history.push('/login')
            toastSuccess("Log out is successfull!")
        }
    }
    return (
        <AvatarWrapper onMouseMove={showModal(true)} onMouseLeave={showModal(false)}>
            <img src={AVATAR} className="avatar" />
            <span className="user_name">{firstName}</span>

            {showProfile &&
                <div className='modal' onMouseMove={showModal(true)} onMouseLeave={showModal(false)}>
                    <div className="header">
                        <img src={AVATAR} className="avatar" />
                        <div className="description">
                            <p className="fullname">{firstName + " " + lastName}</p>
                            <p>View your profile!</p>
                        </div>
                    </div>

                    <div className="feture-action" style={{ borderBottom: "none", color: "red" }} onClick={onLogOut()}>
                        <FontAwesomeIcon icon={faSignOutAlt} className="icon" />
                        <p className="name">Log out</p>
                    </div>
                </div>}
        </AvatarWrapper>
    )
}

export default Avatar