import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { ContextSystem } from '../functions/MyContext';
import './Header.css';

export default function Header() {
    const { get, set } = useContext(ContextSystem);
    const navigate = useNavigate();





    const [scrollY, setScrollY] = useState(0);
    const [currentScroll, setCurrentScroll] = useState(0);

    useEffect(() => {
        function handleScroll() {
            const currentY = window.scrollY;
            setScrollY(currentY);

            if (currentScroll < currentY) {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: false,
                    isManShow: false,
                    isWomenShow: false,
                    isAccShow: false,
                    isComShow: false,
                    isHeaderHide: true
                });
            } else if (currentScroll > currentY) {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: false,
                    isManShow: false,
                    isWomenShow: false,
                    isAccShow: false,
                    isComShow: false,
                    isHeaderHide: false
                });
            }

            setCurrentScroll(currentY);
        };

        const debouncedHandleScroll = debounce(handleScroll, 100);
        window.addEventListener('scroll', debouncedHandleScroll);

        return () => {
            window.removeEventListener('scroll', debouncedHandleScroll);
        };
    }, [scrollY, currentScroll, get.header, set]);

    // 디바운스 함수
    function debounce(func, wait) {
        let timeout;
        return function (...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }





    function handleMouseOverLogo() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        })
    }

    function handleMouseOverFunction() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        });
    }

    function handleMouseOverBrand() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        })
    }

    function handleMouseOverNew() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        })
    }

    function handleMouseEnterMan() {
        set.setCategory({
            ...get.category,
            category1: "MAN",
            category2: "",
            category3: ""
        })

        const targetElement = document.getElementById('man');
        let timer;

        targetElement.addEventListener('mouseenter', () => {
            timer = setTimeout(() => {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: true,
                    isManShow: true,
                    isWomenShow: false,
                    isAccShow: false,
                    isComShow: false
                })
            }, 100);
        });
        targetElement.addEventListener('mouseleave', () => {
            clearTimeout(timer);
        })
    }

    function handleMouseEnterWomen() {
        set.setCategory({
            ...get.category,
            category1: "WOMAN",
            category2: "",
            category3: ""
        })

        const targetElement = document.getElementById('woman');
        let timer;

        targetElement.addEventListener('mouseenter', () => {
            timer = setTimeout(() => {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: true,
                    isManShow: false,
                    isWomenShow: true,
                    isAccShow: false,
                    isComShow: false
                })
            }, 100);
        });
        targetElement.addEventListener('mouseleave', () => {
            clearTimeout(timer);
        })
    }

    function handleMouseEnterAcc() {
        set.setCategory({
            ...get.category,
            category1: "ACC",
            category2: "",
            category3: ""
        });

        const targetElement = document.getElementById('acc');
        let timer;

        targetElement.addEventListener('mouseenter', () => {
            timer = setTimeout(() => {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: true,
                    isManShow: false,
                    isWomenShow: false,
                    isAccShow: true,
                    isComShow: false
                });
            }, 100);
        });
        targetElement.addEventListener('mouseleave', () => {
            clearTimeout(timer);
        })
    }

    function handleMouseOverKid() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        })
        set.setCategory({
            ...get.category,
            category1: "KID",
            category2: "",
            category3: ""
        })
    }

    function handleMouseEnterCom() {
        const targetElement = document.getElementById('com');
        let timer;

        targetElement.addEventListener('mouseenter', () => {
            timer = setTimeout(() => {
                set.setHeader({
                    ...get.header,
                    isHeaderExtend: true,
                    isManShow: false,
                    isWomenShow: false,
                    isAccShow: false,
                    isComShow: true
                })
            }, 100);
        });
        targetElement.addEventListener('mouseleave', () => {
            clearTimeout(timer);
        })
    }

    function handleMouseOverSale() {
        set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false
        })
    }





    function handleClickLogo() {
        navigate("/");
        window.scrollTo(0, 0);
    }

    function handleClickLogin() {
        navigate('/login');
        window.scrollTo(0, 0);
    }
    function handleClickLogout() {
        axios.get(`${process.env.REACT_APP_API_URL}/logout`, {
            withCredentials: true
        })
            .then((response) => {
                console.log(response.data);

                localStorage.setItem('isLogin', 'false');
                set.setIsLogin(false);

                navigate('/');
                window.scrollTo(0, 0);
            })
            .catch((error) => {
                console.log(error.response.data);

                localStorage.setItem('isLogin', 'false');
                set.setIsLogin(false);

                navigate('/');
                window.scrollTo(0, 0);
            });
    }

    function handleClickMyPage() {
        axios.get(`${process.env.REACT_APP_API_URL}/member`, { withCredentials: true })
            .then(() => {
                navigate('/mypage');
                window.scrollTo(0, 0);
            })
            .catch((error) => {
                console.log(error.response.data);

                alert("로그인 후 이용해 주세요.");
                navigate('/login');
                window.scrollTo(0, 0);
            });
    }

    function handleClickCart() {
        axios.get(`${process.env.REACT_APP_API_URL}/member`, { withCredentials: true })
            .then(() => {
                navigate('/');
                window.scrollTo(0, 0);
            })
            .catch((error) => {
                console.log(error.response.data);

                alert("로그인 후 이용해 주세요.");
                navigate('/login');
                window.scrollTo(0, 0);
            });
    }

    function handleClickDibs() {
        axios.get(`${process.env.REACT_APP_API_URL}/member`, { withCredentials: true })
            .then(() => {
                navigate('/');
                window.scrollTo(0, 0);
            })
            .catch((error) => {
                console.log(error.response.data);

                alert("로그인 후 이용해 주세요.");
                navigate('/login');
                window.scrollTo(0, 0);
            });
    }





    function handleClickNew() {
        navigate(`/items/new`);
        window.scrollTo(0, 0);
    }

    function handleClickMenu() {
        set.setCategory({ ...get.category, sort: "new" });
        navigate(`/items?category1=${get.category.category1}&category2=${get.category.category2}&category3=${get.category.category3}&sort=new`);
        window.scrollTo(0, 0);
    }

    function handleClickItems() {
        set.setCategory({ ...get.category, sort: "new" });
        navigate(`/items?category1=${get.category.category1}&category2=${get.category.category2}&category3=${get.category.category3}&sort=new`);
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
    }

    function handleClickSale() {
        navigate(`/items/sale`);
        window.scrollTo(0, 0);
    }





    function handleClickNotice() {
        navigate('/board/notice');
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
    }

    function handleClickQna() {
        navigate('/board/qna?page=1');
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
    }

    function handleClickReview() {
        navigate('/board/review');
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
    }





    return (
        <div id='Header'>
            <div className={get.header.isHeaderHide ? 'headerWrapper headerHide' : 'headerWrapper'}>
                <header className={get.header.isHeaderExtend ? 'headerExtend' : undefined}>
                    <table></table>
                    <img className='logo' src='\images\header\logo.png' alt='logo' onClick={handleClickLogo} onMouseOver={handleMouseOverLogo} />
                    <div className='functionContainer'>
                        {get.isLogin
                            ? <p onClick={handleClickLogout} onMouseOver={handleMouseOverFunction}>로그아웃</p>
                            : <p onClick={handleClickLogin} onMouseOver={handleMouseOverFunction}>로그인</p>}
                        <p onClick={handleClickMyPage} onMouseOver={handleMouseOverFunction}>마이페이지</p>
                        <p onClick={handleClickCart} onMouseOver={handleMouseOverFunction}>장바구니</p>
                        <p onClick={handleClickDibs} onMouseOver={handleMouseOverFunction}>찜목록</p>
                    </div>
                    <div className='menuWrapper'>
                        <p className='menu' onMouseOver={handleMouseOverBrand}>BRAND</p>

                        <p className='menu' onMouseOver={handleMouseOverNew} onClick={handleClickNew}>NEW</p>

                        <p id='man' className={get.header.isManShow ? 'menu menuShow' : 'menu'} onMouseEnter={handleMouseEnterMan}
                            onClick={handleClickMenu}>MAN<span className='triangle'>▼</span></p>

                        <p id='woman' className={get.header.isWomenShow ? 'menu menuShow' : 'menu'} onMouseEnter={handleMouseEnterWomen}
                            onClick={handleClickMenu}>WOMEN<span className='triangle'>▼</span></p>

                        <p id='acc' className={get.header.isAccShow ? 'menu menuShow' : 'menu'} onMouseEnter={handleMouseEnterAcc}
                            onClick={handleClickMenu}>ACC<span className='triangle'>▼</span></p>

                        <p className='menu' onMouseOver={handleMouseOverKid} onClick={handleClickMenu}>KID</p>

                        <p id='com' className={get.header.isComShow ? 'menu menuShow' : 'menu'} onMouseEnter={handleMouseEnterCom}>
                            COMMUNITY<span className='triangle'>▼</span></p>

                        <p className='menu' onMouseOver={handleMouseOverSale} style={{ color: "#f8931f", fontWeight: "bold" }}
                            onClick={handleClickSale}>ON SALE</p>
                    </div>
                </header>
            </div>
            <div className={get.header.isManShow ? 'subMenuShow' : 'subMenu'}>
                <div className='subMenuBox manOuter' onMouseOver={() => { set.setCategory({ category1: "MAN", category2: "OUTER", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox manTop' onMouseOver={() => { set.setCategory({ category1: "MAN", category2: "TOP", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox manBottom' onMouseOver={() => { set.setCategory({ category1: "MAN", category2: "BOTTOM", category3: "" }) }}
                    onClick={handleClickItems}></div>
            </div>
            <div className={get.header.isWomenShow ? 'subMenuShow' : 'subMenu'}>
                <div className='subMenuBox womanOuter' onMouseOver={() => { set.setCategory({ category1: "WOMAN", category2: "OUTER", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox womanTop' onMouseOver={() => { set.setCategory({ category1: "WOMAN", category2: "TOP", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox womanBottom' onMouseOver={() => { set.setCategory({ category1: "WOMAN", category2: "BOTTOM", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox womanDress' onMouseOver={() => { set.setCategory({ category1: "WOMAN", category2: "DRESS", category3: "" }) }}
                    onClick={handleClickItems}></div>
            </div>
            <div className={get.header.isAccShow ? 'subMenuShow' : 'subMenu'}>
                <div className='subMenuBox accCap' onMouseOver={() => { set.setCategory({ category1: "ACC", category2: "모자", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox accShoes' onMouseOver={() => { set.setCategory({ category1: "ACC", category2: "신발", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox accBag' onMouseOver={() => { set.setCategory({ category1: "ACC", category2: "가방", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox accTie' onMouseOver={() => { set.setCategory({ category1: "ACC", category2: "넥타이", category3: "" }) }}
                    onClick={handleClickItems}></div>
                <div className='subMenuBox accEtc' onMouseOver={() => { set.setCategory({ category1: "ACC", category2: "ETC", category3: "" }) }}
                    onClick={handleClickItems}></div>
            </div>
            <div className={get.header.isComShow ? 'subMenuShow' : 'subMenu'}>
                <div className='subMenuBox comNotice' onClick={handleClickNotice}></div>
                <div className='subMenuBox comQna' onClick={handleClickQna}></div>
                <div className='subMenuBox comReview' onClick={handleClickReview}></div>
            </div>
        </div>
    )
}