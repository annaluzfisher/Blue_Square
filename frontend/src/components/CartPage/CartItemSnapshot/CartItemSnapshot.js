import "./cartitemsnapshot.css";
import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { deleteCartItem, updateCartItem, getCart } from "../../../store/cart";


function CartItemSnapshot({ item, fromModal = false }) {
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState(item.quantity);
  const [cartItem, setCartItem] = useState(item);
  const storeCart = useSelector(getCart);
  const [loading, setLoading] = useState(false);
  const updateQuantity = (change) => {
    setLoading(true);
    if (change === "up") {
      setQuantity(quantity + 1);
    } else {
      if (quantity - 1 > 0) {
        setQuantity(quantity - 1);
      } else {
        setQuantity(item.quantity)
        dispatch(deleteCartItem(item.cartItemId));
      }
    }
    setTimeout(() => {
      setLoading(false);
    }, 400);
  };

  useEffect(() => {
    if (quantity <= 0) {
    } else if (item.quantity !== quantity) {
      dispatch(updateCartItem(item.cartItemId, quantity));
    }
  }, [quantity]);

  return (
    <div className="cis-container">
      <div>
        <div className="cis-image-box">
          <div className="cis-image-container">
            <img src={item ? item.imageUrl : ""} />
          </div>
        </div>
        <div className="details">
          <Link to={`/Items/${item.id}`}>
            <h3>{cartItem.name}</h3>
          </Link>
          <span>Item # {item.id}</span>
          {item.size && <span>Size {cartItem.size}</span>}
          <span>Unit Price ${cartItem.price}</span>
        </div>
      </div>

      <div className="cis-editor">
        <div onClick={() => updateQuantity("up")}>+</div>
        <div>{item.quantity}</div>
        <div onClick={() => updateQuantity("down")}>-</div>
      </div>
      <div className="price">
        {((item.price * quantity * 100) / 100).toFixed(2)}
      </div>

      <div
        className="trash-or-edit"
        onClick={() => dispatch(deleteCartItem(item.cartItemId))}
      >
        <div>
          <i className="fa-regular fa-trash-can"></i>
        </div>
      </div>
    </div>
  );
}

export default CartItemSnapshot;
