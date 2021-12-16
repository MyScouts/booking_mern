import styled from "styled-components"
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faUserFriends } from '@fortawesome/free-solid-svg-icons'
let FriendWrapper = styled.div`
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

let FriendView = () => {
    return (
        <FriendWrapper>
            <FontAwesomeIcon icon={faUserFriends} className="icon" />
            <span className="bage"></span>
        </FriendWrapper>
    )
}

export default FriendView