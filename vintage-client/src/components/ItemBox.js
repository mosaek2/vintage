import { useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import { ContextSystem } from '../functions/MyContext';
import './ItemBox.css';

export default function ItemBox({ item }) {
    const navigate = useNavigate();
    const { get, set } = useContext(ContextSystem);

    function handleClickCover() {
        navigate(`/item?uid=${item.uid}`);
        window.scrollTo(0, 0);
        window.setTimeout(() => {
            set.setHeader({
                ...get.header,
                isHeaderExtend: false,
                isManShow: false,
                isWomenShow: false,
                isAccShow: false,
                isComShow: false,
                isHeaderHide: false
            })
        }, 20);
    }

    return (
        <div id='ItemBox'>
            {item !== undefined ?
                <div className='itemBox'>
                    <div className='coverWrapper'>
                        {item.discountAmount !== 0 || item.discountRate !== 1 ?
                            <div className='label'>SALE</div> : undefined}
                        <img src={item.cover} className='cover' alt='cover' onClick={handleClickCover} />
                    </div>
                    <div className='itemSummary'>
                        <p>[{item.brand}]</p>
                        <p>{item.name}</p>
                        {item.size !== null ? <p>({item.size})</p> : undefined}
                    </div>

                    <div className='priceBox'>
                        <p className='price'>
                            {((item.price * item.discountRate) - item.discountAmount).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}
                        </p>
                        <p className='won'>원</p>
                    </div>
                    {item.discountAmount !== 0 || item.discountRate !== 1 ?
                        <div className='discountBox'>
                            {item.discountRate !== 1
                                ? <p className={item.discountRate <= 0.5 ? 'discount discount2' : 'discount'}>-{100 - (item.discountRate * 100)}% 할인</p>
                                : undefined}
                            {item.discountAmount !== 0
                                ? <p className='discount'>(-{item.discountAmount}원 추가 할인)</p>
                                : undefined}
                            <p className='defaultPrice'>{item.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</p>
                        </div>
                        : undefined}
                    {item.mdYn === "y" ? <div className='md'>MD추천</div> : undefined}
                </div>
                : undefined}
        </div>
    )
}