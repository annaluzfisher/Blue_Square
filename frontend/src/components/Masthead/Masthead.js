import './masthead.css'
import Button from '../Buttons/Button/Button'

export let LOADED = false;

function Masthead({promoTitle,imgUrl,winter,ski,jackets}) {
  return (
    <div className="masthead">
      <div className="overlay"></div>
      <img
        src={process.env.PUBLIC_URL + imgUrl}
        onLoadedData={() => (LOADED = true)}
      />
      <div className="masthead-content-wrapper">
        <h1 className="page-title">{promoTitle}</h1>
        <div className="promo-details">
          <span>Save Up to 30% Off Selected Equipment</span>
          <span>and 25% Off Selected Apparel</span>
          <span>Valid through 10/5/22</span>
        </div>
        <div className="buttons-container">
          <Button name={"SHOP WINTER GEAR"} localPath={`/Collection/${winter}`} />{" "}
          {/* <Button name={"SHOP SKI & RIDE"} localPath={"/Category/2"} />{" "}
          <Button localPath={"/Category/10"} name={"SHOP JACKETS"} /> */}
        </div>
      </div>
    </div>
  );
}

export default Masthead