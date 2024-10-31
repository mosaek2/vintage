import axios from 'axios';
import { useContext, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Footer from '../components/Footer';
import Header from '../components/Header';
import Main from '../components/Main';
import { ContextSystem } from '../functions/MyContext';
import './Login.css';

export default function Login() {
    const [mail, setMail] = useState("");
    const [password, setPassword] = useState("");

    const { get, set } = useContext(ContextSystem);
    const navigate = useNavigate();

    useEffect(() => {
        document.getElementById('inputMail').focus();
    }, [])

    function handleKeyPress(e) {
        if (e.key === "Enter") {
            handleClickLogin();
        }
    }

    function handleClickJoin() {
        navigate('/join');
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

    function handleClickLogin() {
        if (mail === "") {
            alert("이메일 주소를 입력해 주세요.");
            return;
        }
        if (password === "") {
            alert("비밀번호를 입력해 주세요.");
            return;
        }

        axios.post(`${process.env.REACT_APP_API_URL}/login/request`, {
            mail: `${mail}`,
            password: `${password}`
        }, { withCredentials: true })
            .then(function (response) {
                console.log(response.data);

                localStorage.setItem('isLogin', 'true');
                set.setIsLogin(true);

                navigate(-1);
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
            .catch(function (error) {
                console.log(error.response.data);
                alert(error.response.data);
            })
    }

    return (
        <div id='Login'>
            <Header />
            <Main>
                <p className="loginTitle">로그인</p>

                <div className='loginContainer'>
                    <div className="line">
                        <p className="loginKey">이메일 주소</p>
                    </div>
                    <div className="line">
                        <input id='inputMail' onChange={(e) => { setMail(e.target.value) }} onKeyDown={handleKeyPress} />
                        <div className="buttonBox">이메일 찾기</div>
                    </div>

                    <div className="line margin50">
                        <p className="loginKey">비밀번호</p>
                    </div>
                    <div className="line">
                        <input type='password' id='inputPassword' onChange={(e) => { setPassword(e.target.value) }} onKeyDown={handleKeyPress} />
                        <div className="buttonBox">비밀번호 찾기</div>
                    </div>

                    <button className='request' onClick={handleClickLogin}>로그인</button>

                    <div className='or margin34'>
                        <div className='orLine'></div>
                        <p className='orText'>또는</p>
                        <div className='orLine'></div>
                    </div>

                    <button className='request margin34' onClick={handleClickJoin}>회원가입</button>
                </div>
            </Main>
            <Footer />
        </div>
    )
}