import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import Pagination from 'react-js-pagination';
import { useNavigate, useSearchParams } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import PostQna from '../components/PostQna';
import { ContextSystem } from '../functions/MyContext';
import './Qna.css';

export default function Qna() {
    const [posts, setPosts] = useState([]);
    const navigate = useNavigate();
    const { get, set } = useContext(ContextSystem);

    const [searchParams] = useSearchParams();
    const page = parseInt(searchParams.get('page') || '1', 10);

    useEffect(() => {
        setCurrentPage(page); // URL에서 페이지 번호를 읽어와 설정
        axios.get(`${process.env.REACT_APP_API_URL}/board/qna`, { withCredentials: true })
            .then(response => {
                setPosts(response.data);
            })
            .catch(error => {
                console.log(error.response.data);
            });
    }, [page]);

    const itemsPerPage = 5; // 한 페이지에 표시할 아이템 수
    const [currentPage, setCurrentPage] = useState(page); // 현재 페이지 번호
    const indexOfLastItem = currentPage * itemsPerPage; // 현재 페이지의 마지막 아이템 인덱스
    const indexOfFirstItem = indexOfLastItem - itemsPerPage; // 현재 페이지의 첫 번째 아이템 인덱스
    const currentItems = posts.slice(indexOfFirstItem, indexOfLastItem); // 현재 페이지에 표시할 아이템들

    const qnaList = currentItems.map((post, index) => (
        <div key={index}>
            <PostQna post={post} />
        </div>
    ));

    function handleClickQna() {
        axios.get(`${process.env.REACT_APP_API_URL}/member`, { withCredentials: true })
            .then((response) => {
                navigate('/board/qna/write?uid=');
                window.scrollTo(0, 0);
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: false,
                    isManShow: false,
                    isWomenShow: false,
                    isAccShow: false,
                    isComShow: false,
                    isHeaderHide: false
                });
            })
            .catch((error) => {
                console.log(error.response.data);
                alert("로그인 후 이용해 주세요.");
                navigate('/login');
                window.scrollTo(0, 0);
            });
    }

    function handlePageChange(pageNumber) {
        navigate(`?page=${pageNumber}`); // URL을 업데이트하여 페이지 변경
    }

    return (
        <div id='Qna'>
            <Header />
            <Main>
                <p style={{
                    marginTop: "114px",
                    fontSize: "20px",
                    display: "flex",
                    justifyContent: "center"
                }}>Q&A</p>

                <div className='qnaContainer'>
                    {qnaList}
                    <Pagination
                        activePage={currentPage}
                        itemsCountPerPage={itemsPerPage}
                        totalItemsCount={posts.length}
                        pageRangeDisplayed={5}
                        onChange={handlePageChange}
                        itemClass="page-item"
                        linkClass="page-link"
                    />
                    <button onClick={handleClickQna}>문의하기</button>
                </div>
            </Main>
            <Footer />
        </div>
    );
}
