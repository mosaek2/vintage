import './Review.css';
import Header from '../components/Header';
import Main from '../components/Main';
import Footer from '../components/Footer';

export default function Review() {

    return (
        <div id='Review'>
            <Header />
            <Main>
                <p style={{
                    marginTop: "114px",
                    fontSize: "20px",
                    display: "flex",
                    justifyContent: "center"
                }}>Review</p>
            </Main>
            <Footer />
        </div>
    )
}