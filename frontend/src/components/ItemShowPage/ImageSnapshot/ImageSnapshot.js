import './imagesnapshot.css';
import { fetchItem, getItem } from "../../../store/item";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { Link } from 'react-router-dom'
import Star from '../../Star';
import { toggleModal } from '../../../store/ui';

function ImageSnapshot({itemId}) {

  const dispatch = useDispatch();
  const storeItem = useSelector(getItem(itemId));
  const [item, setItem] = useState();
  const ADDED_ID = 4;
  const modals = useSelector((state) => Object.values(state.ui.modals));
  const checkToggle =()=>{
     modals.map((modal) => {
       if (modal.visible) dispatch(toggleModal(modal.id));
     });
  }
  useEffect(() => {
    dispatch(fetchItem(itemId));
  }, [itemId]);


  useEffect(() => {
    dispatch(getItem(itemId));
    setItem(storeItem);
  }, [storeItem]);

  return (
    <Link to={`/Items/${itemId}`} onClick={checkToggle}>
      {" "}
      <div className="snapshot-container">
        <div className="snapshot-image-container">
          {/* <div> */}
          <img src={item ? item.imageUrl : ""} />
          {/* </div> */}
        </div>
        <div className="lower-snapshot-container">
          <div>{item ? item.name : ""}</div>
          <div>$ {item ? item.price : ""}</div>
          <div className="star-ratings-container">
     
              {[1, 2, 3, 4, 5].map((i) => {
                if (i <= item?.average) {
                  return <Star key={i} filled={true} />;
                } else {
                  return <Star key={i} filled={false} />;
                }
              })}
       
            <div className="line"></div>
          </div>
        </div>
      </div>
    </Link>
  );
}

export default ImageSnapshot