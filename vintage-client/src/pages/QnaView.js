import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import { ContextSystem } from '../functions/MyContext';
import './QnaView.css';

export default function QnaView() {
    const [searchParams] = useSearchParams();
    const uid = searchParams.get("uid");
    const [post, setPost] = useState({});
    const [commentList, setCommentList] = useState(null);
    const navigate = useNavigate();
    const { get, set } = useContext(ContextSystem);

    useEffect(() => {
        axios.get(`http://localhost:8080/board?uid=${uid}`, { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                setPost(response.data);
            })
            .catch((error) => {
                console.log(error.response.data);
                alert("잘못된 접근입니다.");
                navigate(-1);
            });

        axios.get(`http://localhost:8080/comments?uid=${uid}`, { withCredentials: true })
            .then((response) => {
                if (response?.data?.length !== 0) {
                    console.log(response?.data);
                    setCommentList(response?.data);
                }
            })
            .catch((error) => {
                console.log(error?.response?.data);
            });
    }, [uid, navigate]);


    function handleClickModify() {
        axios.get(`http://localhost:8080/member`, { withCredentials: true })
            .then((response) => {
                if (response?.data?.uid === post?.member?.uid) {
                    navigate(`/board/qna/modify?uid=${uid}`);
                } else {
                    alert("본인의 게시글만 수정할 수 있습니다.");
                    return;
                }
            })
            .catch((error) => {
                console.log(error.response.data);
                alert("로그인 후 이용해 주세요.");
                navigate(`/login`);
            })


    }

    function handleClickDelete() {
        axios.get(`http://localhost:8080/member`, { withCredentials: true })
            .then((response) => {
                if (response?.data?.uid === post?.member?.uid) {
                    if (window.confirm("정말 삭제하시겠습니까?") === true) {
                        axios.delete(`http://localhost:8080/board/delete?uid=${uid}`, { withCredentials: true })
                            .then((response) => {
                                console.log(response.data);
                                alert("게시글이 삭제되었습니다.");

                                navigate("/board/qna");
                                window.scrollTo(0, 0);
                                set.setHeader({
                                    ...get.header,
                                    isHeaderExtend: false,
                                    isManShow: false,
                                    isWomenShow: false,
                                    isAccShow: false,
                                    isComShow: false,
                                    isHeaderHide: false
                                })
                            })
                            .catch((error) => {
                                if (error.response.status === 400) {
                                    alert("잘못된 접근입니다.");
                                    return;
                                }

                                if (error.response.status === 401) {
                                    alert("로그인 후 이용해 주세요.");
                                    return;
                                }

                                if (error.response.status === 403) {
                                    alert("본인의 게시글만 삭제할 수 있습니다.");
                                    return;
                                }
                            });
                    } else {
                        return;
                    }
                } else {
                    alert("본인의 게시글만 삭제할 수 있습니다.");
                    return;
                }
            })
            .catch((error) => {
                console.log(error.response.data);
                alert("로그인 후 이용해 주세요.");
                navigate(`/login`);
            })


    }

    const length = post?.member?.name?.length;
    let name = post?.member?.name;
    if (length === 2) {
        name = name[0] + '*' + name[1];
    } else if (length === 3) {
        name = name[0] + '*' + name[2];
    } else if (length >= 4) {
        name = name[0] + '*' + name.slice(-1);
    }

    const date = new Date(post?.writeDate);
    const year = date?.getFullYear();
    const month = String(date.getMonth() + 1)?.padStart(2, '0');
    const day = String(date.getDate())?.padStart(2, '0');
    const hour = String(date.getHours());
    const minute = String(date.getMinutes());

    return (
        <div id='QnaView'>
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

                {commentList !== null
                    ? <div className='answer'>{commentList[0]?.content}</div>
                    : undefined}

                <div className='title'>{post?.title}</div>

                <div className='content'>{post?.content}</div>

                <div className='buttonContainer'>
                    <p className='info'>{name}님이 {year}년 {month}월 {day}일 {hour}시 {minute}분에 작성한 글입니다.</p>
                    <button onClick={handleClickModify}>수정</button>
                    <button onClick={handleClickDelete}>삭제</button>
                </div>

            </Main>
            <Footer />
        </div>
    )
}