import Header from '../components/Header';
import Main from '../components/Main';
import './Home.css';

import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/css';
import 'swiper/css/effect-fade';
import { Autoplay, EffectFade } from 'swiper/modules';
import Footer from '../components/Footer';

export default function Home() {

    return (
        <div id='Home'>
            <Header />
            <Main>
                <Swiper
                    className='banner'
                    modules={[Autoplay, EffectFade]}
                    autoplay={{ delay: 2900 }}
                    slidesPerView={1}
                    loop={true}
                    effect={'fade'}
                >
                    <SwiperSlide><img src='\images\home\banner1.jpg' alt='banner1' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\banner2.jpg' alt='banner2' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\banner3.jpg' alt='banner3' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\banner4.jpg' alt='banner4' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\banner5.jpg' alt='banner5' /></SwiperSlide>
                </Swiper>

                <Swiper
                    className='report'
                    modules={[Autoplay]}
                    autoplay={{ delay: 1800 }}
                    spaceBetween={1}
                    loop={true}
                    slidesPerView={3}
                >
                    <SwiperSlide><img src='\images\home\report1.jpg' alt='report1' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\report2.jpg' alt='report2' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\report3.jpg' alt='report3' /></SwiperSlide>
                    <SwiperSlide><img src='\images\home\report4.jpg' alt='report4' /></SwiperSlide>
                </Swiper>
            </Main>
            <Footer />
        </div>
    )
}