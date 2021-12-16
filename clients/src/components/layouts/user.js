import styled from 'styled-components'
import HeaderPage from '../parts/users/header';
// 

let MainWrapper = styled.div`
    padding: 1rem 1rem 0 1rem;
    width: 90%;
    margin: auto;
`

// 
let UserLayout = ({ children }) => {
    return (
        <MainWrapper>
            <header>
                <HeaderPage />
            </header>
            <main>
                {children}
            </main>
        </MainWrapper>
    );
}


export default UserLayout