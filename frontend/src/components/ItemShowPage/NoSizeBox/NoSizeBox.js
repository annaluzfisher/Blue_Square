import React from "react";
import "./nosizebox.css";
import { useEffect, useState } from "react";
import Button from "../../Buttons/Button";
import { toggleModal } from "../../../store/ui";
import { useDispatch, useSelector } from "react-redux";
import { addCartItem, fetchCart } from "../../../store/cart";
import { useNavigate } from "react-router-dom";
import { getCurrentUser } from "../../../store/session";

function NoSizeBox({ item }) {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState("1");

  // const storeCart = useSelector((state) => state.cart);

  const currentUser = useSelector((state) => state.session.user);

  const [itemPayload, setItemPayload] = useState({});
  const ADDED_ID = 4;


  useEffect(() => {
    let input = parseInt(quantity);
    if (input < 1) input = 1;
    else if (!input) input = "";
    setQuantity(parseInt(input));

  }, [quantity]);



  useEffect(() => {
    if (currentUser) {
      setItemPayload({
        itemId: item.id,
        cartId: currentUser.cart,
        quantity: quantity,
      });
    }
  }, [quantity]);

  const addToCart = (e) => {
    e.preventDefault();

    if (!currentUser) {
      navigate("/Cart");
  
    } else {
      dispatch(addCartItem(itemPayload));
      dispatch(toggleModal(ADDED_ID));

   
    }
  };
  return (
    <form className="no-size-box-form" onSubmit={addToCart}>
      <div className="size-box">
        
      
   
  
        <span>----------------------------------------------------------</span>
        <div className="sb-price">
          <span>$ {item.price}</span> <span>USD</span>
        </div>
        <div className="sb-button-container">
          <div className="sb-qty">
            <label>
              QTY
              <input
                type="number"
                value={quantity > 0 ? `${quantity}` : ""}
                onChange={(e) => setQuantity(e.target.value)}
              />
            </label>
          </div>
         
            <Button type="submit" name="ADD TO BAG"></Button>
      
        </div>
        <span>----------------------------------------------------------</span>
      </div>
    </form>
  );
}

export default NoSizeBox;
