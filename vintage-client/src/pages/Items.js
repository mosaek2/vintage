import axios from "axios";
import { useContext, useEffect, useState } from "react";
import { useNavigate, useSearchParams } from "react-router-dom";
import Footer from "../components/Footer";
import Header from "../components/Header";
import ItemBox from "../components/ItemBox";
import Main from "../components/Main";
import { ContextSystem } from "../functions/MyContext";
import "./Items.css";

export default function Items() {
  const { get, set } = useContext(ContextSystem);
  const navigate = useNavigate();

  const [searchParams] = useSearchParams();
  const category1 = searchParams.get("category1");
  const category2 = searchParams.get("category2");
  const category3 = searchParams.get("category3");
  const sort = searchParams.get("sort");

  const [itemList, setItemList] = useState([]);

  useEffect(() => {
    axios
      .get(
        `${process.env.REACT_APP_API_URL}/items?category1=${category1}&category2=${category2}&category3=${category3}&sort=${sort}`,
      )
      .then((response) => {
        console.log(response.data);
        setItemList(response.data);
      })
      .catch((error) => {
        console.log(error.response.data);
      });
  }, [category1, category2, category3, sort]);

  function handleClickItems() {
    navigate(
      `/items?category1=${get.category.category1}&category2=${get.category.category2}&category3=${get.category.category3}&sort=new`,
    );
    window.scrollTo(0, 0);
    window.setTimeout(() => {
      set.setHeader({
        ...get.header,
        isHeaderExtend: false,
        isManShow: false,
        isWomenShow: false,
        isAccShow: false,
        isComShow: false,
        isHeaderHide: false,
      });
    }, 20);
  }

  function handleClickSort() {
    navigate(
      `/items?category1=${category1}&category2=${category2}&category3=${category3}&sort=${get.category.sort}`,
    );
  }

  const items = itemList?.map((itemList, index) => {
    return (
      <div key={index}>
        <ItemBox item={itemList} />
      </div>
    );
  });

  return (
    <div id="Items">
      <Header />
      <Main>
        <div className="category">
          <p
            className="categoryText"
            onMouseOver={() => {
              set.setCategory({
                ...get.category,
                category1: `${category1}`,
                category2: "",
                category3: "",
              });
            }}
            onClick={handleClickItems}
          >
            {category1}
          </p>

          <p>
            {category1 === "MAN" || category1 === "WOMAN" || category1 === "ACC"
              ? ">"
              : undefined}
          </p>

          {category1 === "MAN" ? (
            <div className="categoryGroup">
              <p
                className={
                  category2 === "OUTER" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "OUTER",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                OUTER
              </p>
              <p
                className={
                  category2 === "TOP" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "TOP",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                TOP
              </p>
              <p
                className={
                  category2 === "BOTTOM" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "BOTTOM",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                BOTTOM
              </p>
            </div>
          ) : undefined}
          {category1 === "WOMAN" ? (
            <div className="categoryGroup">
              <p
                className={
                  category2 === "OUTER" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "OUTER",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                OUTER
              </p>
              <p
                className={
                  category2 === "TOP" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "TOP",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                TOP
              </p>
              <p
                className={
                  category2 === "BOTTOM" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "BOTTOM",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                BOTTOM
              </p>
              <p
                className={
                  category2 === "DRESS" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "DRESS",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                DRESS
              </p>
            </div>
          ) : undefined}
          {category1 === "ACC" ? (
            <div className="categoryGroup">
              <p
                className={
                  category2 === "모자" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "모자",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                모자
              </p>
              <p
                className={
                  category2 === "신발" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "신발",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                신발
              </p>
              <p
                className={
                  category2 === "가방" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "가방",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                가방
              </p>
              <p
                className={
                  category2 === "넥타이" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "넥타이",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                넥타이
              </p>
              <p
                className={
                  category2 === "ETC" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: "ETC",
                    category3: "",
                  });
                }}
                onClick={handleClickItems}
              >
                ETC
              </p>
            </div>
          ) : undefined}

          <p>
            {(category1 === "MAN" || category1 === "WOMAN") &&
            category2 !== "" &&
            category2 !== "DRESS"
              ? ">"
              : undefined}
          </p>

          {(category1 === "MAN" || category1 === "WOMAN") &&
          category2 === "OUTER" ? (
            <div className="categoryGroup">
              <p
                className={
                  category3 === "자켓/점퍼" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "자켓/점퍼",
                  });
                }}
                onClick={handleClickItems}
              >
                자켓/점퍼
              </p>
              <p
                className={
                  category3 === "바람막이/져지"
                    ? "categoryTextSelect"
                    : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "바람막이/져지",
                  });
                }}
                onClick={handleClickItems}
              >
                바람막이/져지
              </p>
              <p
                className={
                  category3 === "코트" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "코트",
                  });
                }}
                onClick={handleClickItems}
              >
                코트
              </p>
            </div>
          ) : undefined}
          {category1 === "MAN" && category2 === "TOP" ? (
            <div className="categoryGroup">
              <p
                className={
                  category3 === "티셔츠" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "티셔츠",
                  });
                }}
                onClick={handleClickItems}
              >
                티셔츠
              </p>
              <p
                className={
                  category3 === "맨투맨/후드" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "맨투맨/후드",
                  });
                }}
                onClick={handleClickItems}
              >
                맨투맨/후드
              </p>
              <p
                className={
                  category3 === "셔츠" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "셔츠",
                  });
                }}
                onClick={handleClickItems}
              >
                셔츠
              </p>
            </div>
          ) : undefined}
          {category1 === "WOMAN" && category2 === "TOP" ? (
            <div className="categoryGroup">
              <p
                className={
                  category3 === "티셔츠" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "티셔츠",
                  });
                }}
                onClick={handleClickItems}
              >
                티셔츠
              </p>
              <p
                className={
                  category3 === "맨투맨/후드" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "맨투맨/후드",
                  });
                }}
                onClick={handleClickItems}
              >
                맨투맨/후드
              </p>
              <p
                className={
                  category3 === "셔츠" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "셔츠",
                  });
                }}
                onClick={handleClickItems}
              >
                셔츠/블라우스
              </p>
            </div>
          ) : undefined}
          {category1 === "MAN" && category2 === "BOTTOM" ? (
            <div className="categoryGroup">
              <p
                className={
                  category3 === "청바지" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "청바지",
                  });
                }}
                onClick={handleClickItems}
              >
                청바지
              </p>
              <p
                className={
                  category3 === "바지" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "바지",
                  });
                }}
                onClick={handleClickItems}
              >
                바지
              </p>
            </div>
          ) : undefined}
          {category1 === "WOMAN" && category2 === "BOTTOM" ? (
            <div className="categoryGroup">
              <p
                className={
                  category3 === "청바지" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "청바지",
                  });
                }}
                onClick={handleClickItems}
              >
                청바지
              </p>
              <p
                className={
                  category3 === "바지" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "바지",
                  });
                }}
                onClick={handleClickItems}
              >
                바지
              </p>
              <p
                className={
                  category3 === "스커트" ? "categoryTextSelect" : undefined
                }
                onMouseOver={() => {
                  set.setCategory({
                    ...get.category,
                    category1: `${category1}`,
                    category2: `${category2}`,
                    category3: "스커트",
                  });
                }}
                onClick={handleClickItems}
              >
                스커트
              </p>
            </div>
          ) : undefined}
        </div>

        <div className="sortBox">
          <p
            className={sort === "new" ? "sortBoxTextSelect" : "sortBoxText"}
            onMouseOver={() => {
              set.setCategory({ ...get.category, sort: "new" });
            }}
            onClick={handleClickSort}
          >
            신상품순
          </p>
          <p
            className={sort === "low" ? "sortBoxTextSelect" : "sortBoxText"}
            onMouseOver={() => {
              set.setCategory({ ...get.category, sort: "low" });
            }}
            onClick={handleClickSort}
          >
            낮은가격순
          </p>
          <p
            className={sort === "high" ? "sortBoxTextSelect" : "sortBoxText"}
            onMouseOver={() => {
              set.setCategory({ ...get.category, sort: "high" });
            }}
            onClick={handleClickSort}
          >
            높은가격순
          </p>
          <p
            className={
              sort === "discount" ? "sortBoxTextSelect" : "sortBoxText"
            }
            onMouseOver={() => {
              set.setCategory({ ...get.category, sort: "discount" });
            }}
            onClick={handleClickSort}
          >
            할인율순
          </p>
        </div>

        {itemList !== undefined ? (
          <div className="itemContainer">{items}</div>
        ) : undefined}
      </Main>
      <Footer />
    </div>
  );
}
