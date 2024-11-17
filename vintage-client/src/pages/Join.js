import axios from "axios";
import { useContext, useState } from "react";
import { useNavigate } from "react-router-dom";
import Footer from "../components/Footer";
import Header from "../components/Header";
import Main from "../components/Main";
import DaumPostcode from "../functions/DaumPostcode";
import { ContextSystem } from "../functions/MyContext";
import "./Join.css";

export default function Join() {
  const { get, set } = useContext(ContextSystem);
  const navigate = useNavigate();

  const [mail, setMail] = useState("");
  const [password, setPassword] = useState("");
  const [passwordCheck, setPasswordCheck] = useState("");
  const [phone, setPhone] = useState("");
  const [phoneAlt, setPhoneAlt] = useState("");
  const [name, setName] = useState("");
  const [birthYear, setBirthYear] = useState("");
  const [birthMonth, setBirthMonth] = useState("");
  const [birthDay, setBirthDay] = useState("");
  const [solarYn, setSolarYn] = useState("y");
  const [gender, setGender] = useState("");
  const [zip, setZip] = useState("");
  const [address, setAddress] = useState("");
  const [addressDetail, setAddressDetail] = useState("");
  const [smsYn, setSmsYn] = useState("");
  const [mailYn, setMailYn] = useState("");

  const [isValidPasswordCheckOut, setIsValidPasswordCheckOut] = useState(false);
  const [isValidPasswordCheck, setIsValidPasswordCheck] = useState(false);

  const [isUniqueMailClick, setIsUniqueMailClick] = useState(false);
  const [isUniqueMail, setIsUniqueMail] = useState(false);

  const [isUniquePhoneClick, setIsUniquePhoneClick] = useState(false);
  const [isUniquePhone, setIsUniquePhone] = useState(false);

  function handleClickMailCheck() {
    if (mail === "") {
      alert("메일 주소를 입력해주세요");
      return;
    }

    setIsUniqueMailClick(true);

    axios
      .post(`${process.env.REACT_APP_API_URL}/join/mailCheck`, {
        mail: `${mail}`,
      })
      .then((response) => {
        console.log(response.data);
        setIsUniqueMail(response.data);
      })
      .catch((error) => {
        console.log(error.reponse.data);
      });
  }

  function handleClickPhoneCheck() {
    if (phone === "") {
      alert("휴대전화번호를 입력해 주세요.");
      return;
    }

    setIsUniquePhoneClick(true);

    axios
      .post(`${process.env.REACT_APP_API_URL}/join/phoneCheck`, {
        phone: `${phone}`,
      })
      .then((response) => {
        console.log(response.data);
        setIsUniquePhone(response.data);
      })
      .catch((error) => {
        console.log(error.reponse.data);
      });
  }

  function formatPhoneNumber(value) {
    const cleaned = value.replace(/[^0-9]/g, ""); // 숫자가 아닌 모든 문자를 제거

    let formattedNumber = "";

    if (cleaned.length === 10) {
      // 휴대폰 번호가 10자리인 경우 (예: 010-123-4567)
      formattedNumber = cleaned.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
    } else if (cleaned.length === 11) {
      // 휴대폰 번호가 11자리인 경우 (예: 010-1234-5678)
      formattedNumber = cleaned.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
    } else if (cleaned.length === 9 && cleaned.startsWith("02")) {
      // 02로 시작하는 9자리 전화번호 (예: 02-428-1526)
      formattedNumber = cleaned.replace(/(\d{2})(\d{3})(\d{4})/, "$1-$2-$3");
    } else if (cleaned.length === 10 && !cleaned.startsWith("02")) {
      // 3자리 지역번호로 시작하는 10자리 전화번호 (예: 031-234-5678)
      formattedNumber = cleaned.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
    } else if (cleaned.length === 10 && cleaned.startsWith("02")) {
      // 02로 시작하는 10자리 전화번호 (예: 02-1234-5678)
      formattedNumber = cleaned.replace(/(\d{2})(\d{4})(\d{4})/, "$1-$2-$3");
    } else {
      // 일반적인 전화번호 포맷 (지역번호 포함)
      const match = cleaned.match(/^(\d{1,3})(\d{0,4})(\d{0,4})$/);
      if (match) {
        formattedNumber = [match[1], match[2], match[3]]
          .filter(Boolean)
          .join("-");
      }
    }

    return formattedNumber;
  }

  function handleChangePhone(e) {
    const formattedNumber = formatPhoneNumber(e.target.value);

    setPhone(formattedNumber);
    setIsUniquePhoneClick(false);
  }

  function formatPhoneAltNumber(value) {
    const cleaned = value.replace(/[^0-9]/g, "");
    const match = cleaned.match(/^(\d{1,3})(\d{0,4})(\d{0,4})$/);

    if (match) {
      return [match[1], match[2], match[3]].filter(Boolean).join("-");
    }

    return value;
  }

  function handleChangePhoneAlt(e) {
    const formattedNumber = formatPhoneAltNumber(e.target.value);
    setPhoneAlt(formattedNumber);
  }

  function handleClickJoin() {
    if (mail === "") {
      alert("메일 주소를 입력해 주세요.");
      return;
    }
    if (password === "") {
      alert("비밀번호를 입력해 주세요.");
      return;
    }
    if (name === "") {
      alert("이름을 입력해 주세요.");
      return;
    }
    if (gender === "") {
      alert("성별을 선택해 주세요.");
      return;
    }
    if (birthYear === "" || birthMonth === "" || birthDay === "") {
      alert("생년월일을 입력해 주세요.");
      return;
    }
    if (phone === "") {
      alert("휴대전화번호를 입력해 주세요");
      return;
    }
    if (zip === "" || address === "" || addressDetail === "") {
      alert("주소를 입력해 주세요.");
      return;
    }
    if (smsYn === "") {
      alert("SMS 수신 여부를 선택해 주세요.");
      return;
    }
    if (mailYn === "") {
      alert("메일 수신 여부를 선택해 주세요.");
      return;
    }

    if (password !== passwordCheck) {
      alert("비밀번호가 일치하지 않습니다.");
      return;
    }
    if (isUniqueMailClick === false) {
      alert("메일 중복 확인을 해주세요.");
      return;
    }
    if (isUniqueMail === false) {
      alert("이미 사용중인 메일 주소입니다.");
      return;
    }
    if (isUniquePhoneClick === false) {
      alert("휴대전화 중복 확인을 해주세요.");
      return;
    }
    if (isUniquePhone === false) {
      alert("이미 사용중인 휴대전화번호입니다.");
      return;
    }

    if (
      birthYear < 1900 ||
      birthYear > 2024 ||
      birthMonth < 1 ||
      birthMonth > 12 ||
      birthDay < 1 ||
      birthDay > 31
    ) {
      alert("올바르지 않은 생년월일입니다.");
      return;
    }

    axios
      .post(`${process.env.REACT_APP_API_URL}/join/request`, {
        mail: `${mail}`,
        password: `${password}`,
        phone: `${phone}`,
        phoneAlt: `${phoneAlt}`,
        name: `${name}`,
        birth: `${birthYear}-${birthMonth.padStart(2, "0")}-${birthDay.padStart(2, "0")}`,
        solarYn: `${solarYn}`,
        gender: `${gender}`,
        zip: `${zip}`,
        address: `${address}`,
        addressDetail: `${addressDetail}`,
        smsYn: `${smsYn}`,
        mailYn: `${mailYn}`,
      })
      .then((response) => {
        console.log(response.data);

        alert("회원가입 완료! 로그인 후 이용 가능합니다..");
        navigate("/");
        window.scrollTo(0, 0);
        setTimeout(() => {
          set.setHeader({
            ...get.header,
            isHeaderExtend: false,
            isManShow: false,
            isWomenShow: false,
            isAccShow: false,
            isComShow: false,
            isHeaderHide: false,
          });
        }, 50);
      })
      .catch((error) => {
        console.log(error.reponse.data);
        alert("잘못된 접근입니다.");
      });
  }

  const handleAddressComplete = (data) => {
    let fullAddress = data.address;
    let extraAddress = "";

    if (data.addressType === "R") {
      if (data.bname !== "") {
        extraAddress += data.bname;
      }
      if (data.buildingName !== "") {
        extraAddress +=
          extraAddress !== "" ? ", " + data.buildingName : data.buildingName;
      }
      fullAddress += extraAddress !== "" ? " (" + extraAddress + ")" : "";
    }

    setAddress(fullAddress);
    setZip(data.zonecode);
  };

  return (
    <div id="Join">
      <Header />
      <Main>
        <p className="joinTitle">회원가입</p>

        <div className="joinContainer">
          <div className="line">
            <p className="joinKey">이메일 주소*</p>
            {isUniqueMailClick ? (
              isUniqueMail ? (
                <p className="blueWord">사용 가능한 주소입니다.</p>
              ) : (
                <p className="redWord">이미 사용 중인 주소입니다.</p>
              )
            ) : undefined}
          </div>
          <div className="line">
            <input
              style={{ width: 256 }}
              onChange={(e) => {
                setMail(e.target.value);
                setIsUniqueMailClick(false);
              }}
            />
            <button className="buttonBox" onClick={handleClickMailCheck}>
              중복 확인
            </button>
          </div>

          <div className="line margin50">
            <p className="joinKey">비밀번호*</p>
          </div>
          <input
            type="password"
            style={{ width: 256 }}
            onChange={(e) => {
              setPassword(e.target.value);
            }}
            onBlur={() => {
              if (password !== "" && passwordCheck !== "")
                setIsValidPasswordCheckOut(true);
              if (
                password !== "" &&
                passwordCheck !== "" &&
                password === passwordCheck
              )
                setIsValidPasswordCheck(true);
              else setIsValidPasswordCheck(false);
            }}
          />

          <div className="line margin50">
            <p className="joinKey">비밀번호 확인*</p>
            {isValidPasswordCheckOut ? (
              isValidPasswordCheck ? (
                <p className="blueWord">비밀번호가 일치합니다.</p>
              ) : (
                <p className="redWord">비밀번호가 일치하지 않습니다.</p>
              )
            ) : undefined}
          </div>
          <input
            type="password"
            style={{ width: 256 }}
            onChange={(e) => {
              setPasswordCheck(e.target.value);
            }}
            onBlur={() => {
              if (password !== "" && passwordCheck !== "")
                setIsValidPasswordCheckOut(true);
              if (password === passwordCheck) setIsValidPasswordCheck(true);
              else setIsValidPasswordCheck(false);
            }}
          />

          <div className="line margin100">
            <p className="joinKey">이름*</p>
          </div>
          <input
            onChange={(e) => {
              setName(e.target.value);
            }}
          />

          <div className="line margin50">
            <p className="joinKey">성별*</p>
          </div>
          <div className="line" style={{ gap: 0 }}>
            <button
              className={gender === "male" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setGender("male");
              }}
            >
              남자
            </button>
            <button
              className={gender === "female" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setGender("female");
              }}
            >
              여자
            </button>
          </div>

          <div className="line margin50">
            <p className="joinKey">생년월일*</p>
          </div>
          <div className="line">
            <div className="line" style={{ gap: 0 }}>
              <button
                className={solarYn === "y" ? "selectBoxSelect" : "selectBox"}
                onClick={() => {
                  setSolarYn("y");
                }}
              >
                양력
              </button>
              <button
                className={solarYn === "n" ? "selectBoxSelect" : "selectBox"}
                onClick={() => {
                  setSolarYn("n");
                }}
              >
                음력
              </button>
            </div>
            <div className="line" style={{ gap: 0 }}>
              <input
                style={{ width: 45 }}
                onChange={(e) => {
                  setBirthYear(e.target.value);
                }}
              />
              <div className="birthBox">년</div>
            </div>
            <div className="line" style={{ gap: 0 }}>
              <input
                style={{ width: 20 }}
                onChange={(e) => {
                  setBirthMonth(e.target.value);
                }}
              />
              <div className="birthBox">월</div>
            </div>
            <div className="line" style={{ gap: 0 }}>
              <input
                style={{ width: 20 }}
                onChange={(e) => {
                  setBirthDay(e.target.value);
                }}
              />
              <div className="birthBox">일</div>
            </div>
          </div>

          <div className="line margin50">
            <p className="joinKey">휴대전화번호*</p>
            {isUniquePhoneClick ? (
              isUniquePhone ? (
                <p className="blueWord">사용 가능한 번호입니다.</p>
              ) : (
                <p className="redWord">이미 사용 중인 번호입니다.</p>
              )
            ) : undefined}
          </div>
          <div className="line">
            <input
              style={{ width: 148 }}
              onChange={handleChangePhone}
              value={phone}
              maxLength={13}
            />
            <button className="buttonBox" onClick={handleClickPhoneCheck}>
              중복 확인
            </button>
          </div>

          <div className="line margin50">
            <p className="joinKey">일반전화번호</p>
          </div>
          <input
            style={{ width: 148 }}
            onChange={handleChangePhoneAlt}
            value={phoneAlt}
            maxLength={13}
            readOnly
          />

          <div className="line margin100">
            <p className="joinKey">우편번호*</p>
          </div>
          <div className="line">
            <input
              style={{ width: 70 }}
              onChange={(e) => {
                setZip(e.target.value);
              }}
              name="zip"
              value={zip}
              readOnly
            />
            <DaumPostcode onComplete={handleAddressComplete} />
          </div>

          <div className="line margin50">
            <p className="joinKey">주소*</p>
          </div>
          <input
            style={{ width: 600 }}
            onChange={(e) => {
              setAddress(e.target.value);
            }}
            name="address"
            value={address}
            readOnly
          />

          <div className="line margin50">
            <p className="joinKey">나머지 주소*</p>
          </div>
          <input
            style={{ width: 600 }}
            onChange={(e) => {
              setAddressDetail(e.target.value);
            }}
          />

          <div className="line margin100">
            <p className="joinKey">SMS 수신 동의</p>
          </div>
          <div className="line" style={{ gap: 0 }}>
            <button
              className={smsYn === "y" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setSmsYn("y");
              }}
            >
              동의
            </button>
            <button
              className={smsYn === "n" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setSmsYn("n");
              }}
            >
              미동의
            </button>
          </div>

          <div className="line margin50">
            <p className="joinKey">메일 수신 동의</p>
          </div>
          <div className="line" style={{ gap: 0 }}>
            <button
              className={mailYn === "y" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setMailYn("y");
              }}
            >
              동의
            </button>
            <button
              className={mailYn === "n" ? "selectBoxSelect" : "selectBox"}
              onClick={() => {
                setMailYn("n");
              }}
            >
              미동의
            </button>
          </div>

          <button className="joinRequest" onClick={handleClickJoin}>
            가입하기
          </button>
        </div>
      </Main>
      <Footer />
    </div>
  );
}
