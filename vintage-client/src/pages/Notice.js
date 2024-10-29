import './Notice.css';
import Header from '../components/Header';
import Main from '../components/Main';
import Footer from '../components/Footer';
import { useEffect, useState } from 'react';
import axios from 'axios';
import PostNotice from '../components/PostNotice';

export default function Notice() {
    const [posts, setPosts] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8080/board/notice', { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                setPosts(response.data);
            })
            .catch((error) => {
                console.log(error.response.data);
            });
    }, []);

    const noticeList = posts?.map((posts, index) => {
        return (
            <div key={index}>
                <PostNotice post={posts} />
            </div>
        )
    })

    return (
        <div id='Notice'>
            <Header />
            <Main>
                <p style={{
                    marginTop: "114px",
                    fontSize: "20px",
                    display: "flex",
                    justifyContent: "center"
                }}>공지사항</p>

                <div className='noticeContainer'>
                    {noticeList}
                </div>

            </Main>
            <Footer />
        </div>
    )
}