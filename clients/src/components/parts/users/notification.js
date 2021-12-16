import styled from "styled-components"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faBell } from '@fortawesome/free-solid-svg-icons'

let NotificationWrapper = styled.div`
    padding: 0 .5rem;
    cursor: pointer;
    position: relative;
    .icon{
        font-size: 1.1rem;
        color:  #012443;
    }

    .bage{
        position: absolute;
        display: inline-block;
        background-color: red;
        right: 0;
        top: -5px;
        width: 10px;
        height: 10px;
        border-radius: 50px;
    }
`

let Notification = () => {
    return (
        <NotificationWrapper>
            <FontAwesomeIcon icon={faBell} className="icon" />
            <span className="bage"></span>
        </NotificationWrapper>
    )
}

export default Notification