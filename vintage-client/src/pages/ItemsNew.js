import axios from "axios";
import { useEffect, useState } from "react";
import Footer from "../components/Footer";
import Header from "../components/Header";
import ItemBox from "../components/ItemBox";
import Main from "../components/Main";
import "./ItemsNew.css";

export default function ItemsNew() {
  const [itemList, setItemList] = useState();

  useEffect(() => {
    axios
      .get(`${process.env.REACT_APP_API_URL}/items/new`)
      .then(function (response) {
        console.log(response.data);
        setItemList(response.data);
      })
      .catch(function (error) {
        console.log(error);
      });
  }, []);

  const items = itemList?.map((itemList, index) => {
    return (
      <div key={index}>
        <ItemBox item={itemList} />
      </div>
    );
  });

  return (
    <div id="ItemsNew">
      <Header />
      <Main>
        <img className="new" src="\images\items\new.jpg" alt="new" />
        {itemList !== undefined ? (
          <div className="itemContainer">{items}</div>
        ) : undefined}
      </Main>
      <Footer />
    </div>
  );
}
