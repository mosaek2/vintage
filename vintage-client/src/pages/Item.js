import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import { useNavigate, useSearchParams } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import { ContextSystem } from '../functions/MyContext';
import './Item.css';

export default function Item() {
    const [searchParams] = useSearchParams();
    const uid = searchParams.get("uid");
    const navigate = useNavigate();
    const { get, set } = useContext(ContextSystem);

    const [item, setItem] = useState({});

    useEffect(() => {
        axios.get(`${process.env.REACT_APP_API_URL}/item?uid=${uid}`)
            .then(function (response) {
                console.log(response.data);
                setItem(response.data);
            })
            .catch(function (error) {
                console.log(error);
            });
    }, [uid]);

    function handleClickQna() {
        axios.get(`${process.env.REACT_APP_API_URL}/member`, { withCredentials: true })
            .then((response) => {
                console.log(response.data);
                navigate(`/board/qna/write?uid=${uid}`);
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
                console.log(error.response.data);
                alert("로그인 후 이용해 주세요.");
                navigate('/login');
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
            });
    }

    return (
        <div id='Item'>
            <Header />
            <Main>
                <div className='itemContainer'>
                    <img src={item?.cover} alt='cover' className='cover' />
                    <div className='itemInfo'>
                        <p className='brand'>{item?.brand}</p>
                        <p className='name'>{item?.name}</p>
                        <div className='detailInfo'>
                            <div className='line'>
                                <p>판매가:</p>
                                {item?.discountRate !== 1
                                    ? <p className='defaultPrice'>{item?.price?.toString()?.replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</p>
                                    : undefined}
                                {item?.discountRate !== 1
                                    ? <p className='discount'>-{100 - (item?.discountRate * 100)}% 할인</p>
                                    : undefined}
                                {item?.discountAmount !== 0
                                    ? <p className='discount'>(-{item.discountAmount}원 추가 할인)</p>
                                    : undefined}
                                <p className='price'>
                                    {((item?.price * item?.discountRate) - item?.discountAmount)?.toString()?.replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원
                                </p>
                            </div>
                            {item?.size !== null ? <p>사이즈: {item?.size}</p> : undefined}
                            {item?.sizeDetail !== null ? <p>상세치수: {item?.sizeDetail}</p> : undefined}
                            <p>제품상태: {item?.condition !== null ? item?.condition : "[중고] 사진 외에 특별한 오염이 없는 양호한 상태"}</p>
                            <p>배송비: {((item?.price * item?.discountRate) - item?.discountAmount) < 50000 ? "3000원" : "무료"}</p>
                            {item.mdYn === "y" ? <div className='md'>MD추천</div> : undefined}
                        </div>

                        <div className='buttonContainer'>
                            <button className='black'>BUY NOW</button>
                            <button className='white'>장바구니</button>
                            <button className='white' onClick={handleClickQna}>문의하기</button>
                            <button className='white'>찜하기</button>
                        </div>
                    </div>
                </div>
                <img src='\images\items\guide1.jpg' className='guide guide1' alt='guide1' />
                <img src='\images\items\guide2.jpg' className='guide guide2' alt='guide2' />
                <img src={item?.detail} className='guide' alt='detail' />
                <img src='\images\items\guide3.jpg' className='guide guide3' alt='guide3' />
            </Main>
            <Footer />
        </div>
    );
}