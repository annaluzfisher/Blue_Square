import "./itemshowpage.css";
import { fetchItem, getItem } from "../../store/item";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import SizeBox from "./SizeBox/SizeBox";
import ReviewsComponent from "../Reviews/ReviewsComponent";

import NoSizeBox from "./NoSizeBox";
import SuggestedItems from "../SuggestedItems";
import AddedToBag from "../Modals/AddedToBag";

function ItemShowPage() {
  const { itemId } = useParams();
  const dispatch = useDispatch();
  const storeItem = useSelector(getItem(parseInt(itemId)));
  const [item, setItem] = useState({ name: " ", description: " " });
  const [colId, setColId] = useState();
  const ADDED_ID = 4;
  const navigate = useNavigate();

  const error = useSelector((state) => {
    if (!state) return null;
    if (!state.items) return null;
    return state.items.error;
  });

  const modal = useSelector((state) => {
    if (!state) return null;
    if (!state.ui) return null;
    if (!state.ui.modals) return null;
    else {
      return state.ui.modals[ADDED_ID];
    }
  });

  const [visible, setVisible] = useState(false);

  useEffect(() => {
    setVisible(modal.visible);
    modal ? setVisible(true) : setVisible(false);
  }, [modal]);

  useEffect(() => {
    if (!storeItem) {
      dispatch(fetchItem(itemId));
    }
  }, [itemId, storeItem]);

  useEffect(() => {
    setItem(storeItem);
    if (storeItem) {
      let id =
        storeItem.collections[
          Math.floor(Math.random() * storeItem.collections.length)
        ];
      setColId(id);
    }
  }, [storeItem]);

  useEffect(() => {
    if (error) {
      navigate("/404");
    }

  }, [error]);
  if (!item) return null;

  return (
    <>
      <div className="item-show-page">
        <div className="spacer"></div>
        <div className="product-hero">
          <div className="item-scroller"></div>
          <div className="hero-img-container">
            <img src={item.imageUrl} />
          </div>
          <div className="item-buy-box">
            <div>
              {item.new && <div>NEW</div>}
              <span> {item.name}</span>
              {item.size ? <SizeBox item={item} /> : <NoSizeBox item={item} />}
            </div>
          </div>
        </div>
      </div>

      <div className="description">
        <p>{item ? item.description : ""}</p>
      </div>
      <ReviewsComponent item={item} />

      <SuggestedItems title={"Check out similar items"} collectionId={colId} />

      {visible && <AddedToBag />}
    </>
  );
}

export default ItemShowPage;
