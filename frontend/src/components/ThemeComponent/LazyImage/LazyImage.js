import "./lazyimage.css";
import { Link } from "react-router-dom";

function LazyImage({ imageUrl, text ,collectionId}) {
  return (
    <div className="lazy-image-wrapper" style={{backgroundImage : imageUrl}}>
      <div>
        <Link to={`/Collection/${collectionId}`}>
          {" "}
          <img src={imageUrl} />
        </Link>
        <span>SHOP {text}</span>
      </div>
    </div>
  );
}

export default LazyImage;
