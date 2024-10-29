import './Footer.css';

export default function Footer() {
    return (
        <div id='Footer'>
            <footer>
                <div className='top'>
                    <div className='topBox1'>
                        <p className='topTitle'>CONTACT US</p>
                        <p className='phone'>010-3002-0014</p>
                        <div className='textAlign'>
                            <p><strong>문의 가능 시간</strong> 09:30 ~ 17:30 (토, 일 공휴일 휴무)</p>
                            <p><strong>점심시간</strong> 12:00 ~ 13:00</p>
                            <p>업무 중 전화통화가 어려우니 문의는 카카오톡 상담하기를 이용 부탁드립니다.</p>
                        </div>
                    </div>
                    <div className='topBox2'>
                        <p className='topTitle'>BANK ACCOUNT</p>
                        <div className='textAlign'>
                            <p><strong>국민은행</strong> 910526-92-0214</p>
                            <p><strong>농협은행</strong> 101-44-971014</p>
                            <p><strong>우리은행</strong> 3910-067281-1649</p>
                            <p><strong>하나은행</strong> 7121-419587-6803</p>
                            <p><strong>신한은행</strong> 1743-88-0921</p>
                            <p style={{ marginTop: 13 }}><strong>예금주</strong> 권혁민</p>
                        </div>
                    </div>
                    <div className='topBox3'>
                        <p className='topTitle'>REFUND & EXCHANGE</p>
                        <div className='textAlign'>
                            <p><strong>(05329) 서울특별시 강동구 천호동 454-15 동원천호빌딩 5층 소포실</strong></p>
                            <p>· 반품·교환 전, 꼭 유의사항을 확인해주세요</p>
                            <p>· 상품발송 후 배송정보는 택배사 사이트에서 조회가 가능합니다.</p>
                        </div>
                    </div>
                </div>

                <div className='bottom'>
                    <div className='textAlign'>
                        <div className='line'>
                            <p>상호명: 오렌지무역</p>
                            <p>쇼핑몰명: VINTAGE</p>
                            <p>대표: 권혁민</p>
                            <p>고객센터: 070-0526-1014</p>
                        </div>
                        <div className='line'>
                            <p>사업장주소: 서울특별시 강동구 천호동 454-15 동원천호빌딩 5층 하이미디어 컴퓨터학원 천호점</p>
                            <p>사업자등록번호 : 1404114041</p>
                        </div>
                        <p style={{ marginTop: 13 }}>COPYRIGHT © 오렌지무역 VINTAGE ALL RIGHT RESERVED.</p>
                        <p>본 사이트내 모든 이미지 및 컨텐츠 등은 저작권법 제4조의 의한 저작물로써 소유권은 오렌지무역 VINTAGE 에게 있으며, 무단 도용시 법적인 제재를 받을 수 있습니다.</p>
                    </div>
                </div>
            </footer>
        </div>
    )
}