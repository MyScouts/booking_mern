/* eslint-disable jsx-a11y/alt-text */
import styled from 'styled-components'
import { APP_LOGO } from '../../../utils/app_image';
import MenuList from './menu';
import { Link } from 'react-router-dom'
import FriendView from './friends';
import Notification from './notification';
import Avatar from './Avatar';
let HeaderWrapper = styled.div`
    display: flex;
    justify-content: space-between;

    .header_left{
        display: flex;
        align-items: center;

        .logo{
            width: 3.5rem;
        }

        .web_name{
            margin-left: 10px;
            font-size: 1.5rem;
            color: #012443;
        }
    }

    .header_right{
        align-items: center;
        display: flex;
    }
`

let ActionButtonWrapper = styled.div`
    border: 1px solid #012443;
    padding: .5rem 1rem;
    border-radius: 50px;
    transition: all .3s;

    .links{
        text-decoration: none;
        font-weight: 700;
        font-size: 1.1rem;
        color: #012443;
        transition: all .3s;
    }

    &:hover{
        background-color: #012443;
        .links{
            color: white;
        }
    }
`

// 
let HeaderPage = () => {
    return (
        <HeaderWrapper>
            <div className="header_left">
                <img src={APP_LOGO} className="logo" />
                <h1 className="web_name">Fleet</h1>
            </div>
            <div className="header_right" >
                <MenuList />
                <ActionButton />
                <FriendView />
                <Notification />
                <Avatar />
            </div>
        </HeaderWrapper>
    )
}

let ActionButton = () => {
    return (
        <ActionButtonWrapper>
            <Link to="" className="links"> List your property</Link>
        </ActionButtonWrapper>
    )
}

export default HeaderPage;