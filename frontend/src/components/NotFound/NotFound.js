import './notfound.css'
import Button from '../Buttons/Button/Button'
function NotFound({imgUrl}) {

  return (
    <div className="not-found-page">
      <div className="overlay"></div>
      <img src={process.env.PUBLIC_URL + "BannerImages/notfound.jpg"} />
      <div className="oops-container">
        <span id="four">404</span>
        <div> Oops! At least the landing is soft.</div>
        <p> The page you are looking for does not exist.</p>
        <Button localPath={'/'} name={'Blue Square Home'} primary={'secondary'}/>
      </div>
    </div>
  );
}

export default NotFound