import { useContext } from "react";
import { useNavigate } from "react-router-dom";
import { ContextSystem } from "../functions/MyContext";
import "./PostQna.css";

export default function PostQna({ post }) {
  const navigate = useNavigate();
  const { get, set } = useContext(ContextSystem);

  const date = new Date(post?.writeDate);
  const year = date?.getFullYear();
  const month = String(date.getMonth() + 1)?.padStart(2, "0");
  const day = String(date.getDate())?.padStart(2, "0");

  const length = post?.member?.name?.length;
  let name = post?.member?.name;
  if (length === 2) {
    name = name[0] + "*" + name[1];
  } else if (length === 3) {
    name = name[0] + "*" + name[2];
  } else if (length >= 4) {
    name = name[0] + "*" + name.slice(-1);
  }

  function handleClickTitle() {
    navigate(`/board/qna/view?uid=${post?.uid}`);
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
    }, 100);
  }

  return (
    <div id="PostQna">
      <div className="qnaBox">
        <div className="coverBox">
          {post?.item?.uid !== 0 ? (
            <img src={post?.item.cover} className="cover" alt="cover" />
          ) : (
            <div className="cover">일반문의</div>
          )}
        </div>

        <div className="titleBox">
          <p className="title" onClick={handleClickTitle}>
            {post?.title}
          </p>
          {post?.item?.uid !== 0 ? (
            <p className="item">
              [{post?.item?.brand}] {post?.item?.name}
              {post?.item?.size !== null ? ` (${post?.item?.size})` : undefined}
            </p>
          ) : undefined}
          {post?.answerYn === "y" ? (
            <p className="answer">답변완료</p>
          ) : undefined}
        </div>

        <div className="nameBox">{name}</div>

        <div className="dateBox">
          {year}.{month}.{day}
        </div>
      </div>
    </div>
  );
}
