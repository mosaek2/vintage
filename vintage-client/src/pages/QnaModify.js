import axios from 'axios';
import { useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import './QnaModify.css';

export default function QnaModify() {
    const [searchParams] = useSearchParams();
    const uid = searchParams.get("uid");
    const [post, setPost] = useState({});
    const navigate = useNavigate();

    const [title, setTitle] = useState("");
    const [content, setContent] = useState("");

    useEffect(() => {
        axios.get(`${process.env.REACT_APP_API_URL}/board?uid=${uid}`)
            .then((response) => {
                console.log(response?.data);
                setPost(response?.data);

                setTitle(response?.data?.title);
                setContent(response?.data?.content);
            })
            .catch((error) => {
                console.log(error?.response?.data);
            })
    }, [uid]);

    function handleClickModify() {
        axios.put(`${process.env.REACT_APP_API_URL}/board/qna/modify?uid=${uid}`, {
            "uid": `${uid}`,
            "title": `${title}`,
            "content": `${content}`,
            "itemUid": `${post?.item?.uid}`
        }, { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                alert("수정되었습니다.");
                navigate(-1);
            })
            .catch((error) => {
                console.log(error.response.status);
                console.log(error.response.data);
            })
    }

    return (
        <div id='QnaModify'>
            <Header />
            <Main>
                <p style={{
                    marginTop: "114px",
                    fontSize: "20px",
                    display: "flex",
                    justifyContent: "center"
                }}>Q&A</p>

                {post?.item?.uid !== 0
                    ? <img src={post?.item?.cover} className='cover' alt='cover' />
                    : undefined}
                {post?.item?.uid !== 0
                    ? <p className='item'>[{post?.item?.brand}] {post?.item?.name}
                        {post?.item?.size !== null ? ` (${post?.item?.size})` : undefined}</p>
                    : <p className='item'>일반문의</p>}

                <input className='inputTitle' onChange={(e) => { setTitle(e.target.value) }}
                    defaultValue={post?.title} placeholder='제목' />

                <textarea className='inputContent' onChange={(e) => { setContent(e.target.value) }}
                    defaultValue={post?.content} placeholder='내용' />

                <button className='qnaRequest' onClick={handleClickModify}>작성완료</button>

            </Main>
            <Footer />
        </div>
    )
}