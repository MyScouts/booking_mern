import styled from "styled-components"
import { Link } from 'react-router-dom'

let MenuWrapper = styled.ul`
    display: flex;

    .menu-item{
        padding: 0 .5rem 0 .5rem;
        font-weight: 700;
        font-size: 1.1rem;

        .item-links{
            text-decoration: none;
            color: #515E63;
            transition: all .3s;
            
            &:hover{
                color: #012443;
            }
        }
    }
`

let MenuList = () => {
    return (
        <MenuWrapper>
            <li className="menu-item">
                <Link className="item-links">Home</Link>
            </li>
            <li className="menu-item">
                <Link className="item-links">Blogs</Link>
            </li>
            <li className="menu-item">
                <Link className="item-links">Blogs</Link>
            </li>
            <li className="menu-item">
                <Link className="item-links">Contact me</Link>
            </li>
        </MenuWrapper>
    )
}

export default MenuList