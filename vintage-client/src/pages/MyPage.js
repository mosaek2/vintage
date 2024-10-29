import Header from '../components/Header';
import Main from '../components/Main';
import Footer from '../components/Footer';
import './MyPage.css';
import axios from 'axios';
import { useEffect, useState } from 'react';

export default function MyPage() {
    const [member, setMember] = useState({});

    useEffect(() => {
        axios.get('http://localhost:8080/member', { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                setMember(response.data);
            })
            .catch((error) => {
                console.log(error.response.data);
            });
    }, [])

    return (
        <div id='MyPage'>
            <Header />
            <Main>
                <p>{member?.mail}</p>
                <p>{member?.name}</p>
                <p>{member?.age}</p>
                <p>{member?.phone}</p>
            </Main>
            <Footer />
        </div>
    )
}