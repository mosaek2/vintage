import { useEffect, useState } from 'react';
import './ItemsSale.css';
import Header from '../components/Header';
import Main from '../components/Main';
import axios from 'axios';
import ItemBox from '../components/ItemBox';
import Footer from '../components/Footer';

export default function ItemsSale() {
    const [itemList, setItemList] = useState();

    useEffect(() => {
        axios.get(`http://localhost:8080/items/sale`)
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
        )
    })

    return (
        <div id='ItemsSale'>
            <Header />
            <Main>
                <img className='sale' src='\images\items\sale.jpg' alt='sale' />
                {itemList !== undefined ?
                    <div className='itemContainer'>
                        {items}
                    </div>
                    : undefined}
            </Main>
            <Footer />
        </div>
    )
}