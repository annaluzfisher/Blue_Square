import './banner.css'

function Banner({pageTitle, imgUrl}) {
  return (
    <div className='banner-container'>
      <div className="banner">
        <div></div>
        <span className="banner-title">{pageTitle}</span>
        <img src={process.env.PUBLIC_URL + imgUrl} />
      </div>
    </div>
  );
}

export default Banner