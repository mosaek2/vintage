import { Route, Routes } from 'react-router-dom';
import MyContext from './functions/MyContext';
import Home from './pages/Home';
import Item from './pages/Item';
import Items from './pages/Items';
import ItemsNew from './pages/ItemsNew';
import ItemsSale from './pages/ItemsSale';
import Join from './pages/Join';
import Login from './pages/Login';
import MyPage from './pages/MyPage';
import Notice from './pages/Notice';
import Qna from './pages/Qna';
import QnaModify from './pages/QnaModify';
import QnaView from './pages/QnaView';
import QnaWrite from './pages/QnaWrite';
import Review from './pages/Review';

export default function App() {
    return (
        <div id='App'>
            <MyContext>
                <Routes>
                    <Route path='/' element={<Home />} />
                    <Route path='/join' element={<Join />} />
                    <Route path='/login' element={<Login />} />
                    <Route path='/mypage' element={<MyPage />} />

                    <Route path='/items' element={<Items />} />
                    <Route path='/items/sale' element={<ItemsSale />} />
                    <Route path='/items/new' element={<ItemsNew />} />
                    <Route path='/item' element={<Item />} />

                    <Route path='/board/notice' element={<Notice />} />
                    <Route path='/board/qna' element={<Qna />} />
                    <Route path='/board/qna/write' element={<QnaWrite />} />
                    <Route path='/board/qna/view' element={<QnaView />} />
                    <Route path='/board/qna/modify' element={<QnaModify />} />
                    <Route path='/board/review' element={<Review />} />
                </Routes>
            </MyContext>
        </div>
    );
}