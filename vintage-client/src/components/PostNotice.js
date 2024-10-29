import './PostNotice.css';

export default function PostNotice({ post }) {

    const date = new Date(post?.writeDate);
    const year = date?.getFullYear();
    const month = String(date.getMonth() + 1)?.padStart(2, '0');
    const day = String(date.getDate())?.padStart(2, '0');

    return (
        <div id='PostNotice'>
            <div className={post?.fixYn === 'n' ? 'noticeBox moveBox' : 'noticeBox fixBox'}>
                <div className={post?.fixYn === 'n' ? 'title' : 'title fixTitle'}>
                    <p className='titleText'>{post?.title}</p>
                </div>

                {post?.fixYn === 'n' ? <div className='date'>{year}.{month}.{day}</div> : undefined}
            </div>
        </div>
    )
}