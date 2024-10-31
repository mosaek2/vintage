import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import { ContextSystem } from '../functions/MyContext';
import './QnaWrite.css';

export default function QnaWrite() {
    const [searchParams] = useSearchParams();
    const uid = searchParams.get("uid");
    const [item, setItem] = useState({});
    const navigate = useNavigate();
    const { get, set } = useContext(ContextSystem);

    useEffect(() => {
        if (uid !== "") {
            axios.get(`${process.env.REACT_APP_API_URL}/item?uid=${uid}`)
                .then((response) => {
                    console.log(response?.data);
                    setItem(response?.data);
                })
                .catch((error) => {
                    console.log(error?.response?.data);
                })
        }
    }, [uid]);

    const [title, setTitle] = useState("");
    const [content, setContent] = useState("");

    function handleClickWrite() {
        if (title === "") {
            alert("제목을 입력해 주세요.");
            return;
        }
        if (content === "") {
            alert("내용을 입력해 주세요.");
            return;
        }

        axios.post(`${process.env.REACT_APP_API_URL}/board/qna/insert`, {
            "board": `qna`,
            "title": `${title}`,
            "content": `${content}`,
            "itemUid": uid
        }, { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                navigate('/board/qna');
                window.scrollTo(0, 0);
                setTimeout(() => {
                    set.setHeader({
                        ...get.header,
                        isHeaderExtend: false,
                        isManShow: false,
                        isWomenShow: false,
                        isAccShow: false,
                        isComShow: false,
                        isHeaderHide: false
                    })
                }, 100);
            })
            .catch((error) => {
                console.log(error.reponse.data);
                alert("잘못된 접근입니다.");
            });
    }

    return (
        <div id='QnaWrite'>
            <Header />
            <Main>
                <p style={{
                    marginTop: "114px",
                    fontSize: "20px",
                    display: "flex",
                    justifyContent: "center"
                }}>문의하기</p>

                {uid !== ""
                    ? <img src={item?.cover} className='cover' alt='cover' />
                    : undefined}
                {uid !== ""
                    ? <p className='item'>[{item?.brand}] {item?.name}
                        {item?.size !== null ? ` (${item?.size})` : undefined}</p>
                    : <p className='item'>일반문의</p>}

                <input className='inputTitle' onChange={(e) => { setTitle(e.target.value) }}
                    placeholder='제목' />

                <textarea className='inputContent' onChange={(e) => { setContent(e.target.value) }}
                    placeholder='내용' />

                <button className='qnaRequest' onClick={handleClickWrite}>문의하기</button>

            </Main>
            <Footer />
        </div>
    )
}