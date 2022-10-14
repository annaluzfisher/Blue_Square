import React from "react";
import "./sizebox.css";
import { useEffect, useState } from "react";
import Button from "../../Buttons/Button";
import { toggleModal } from "../../../store/ui";
import { useDispatch, useSelector } from "react-redux";
import { addCartItem, fetchCart, getCartId} from "../../../store/cart";
import { useNavigate } from "react-router-dom";
import { getCurrentUser } from "../../../store/session";

function SizeBox({ item }) {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [quantity, setQuantity] = useState("1");
  const [size, setSize] = useState();


  const currentUser = useSelector(getCurrentUser);

  const [itemPayload, setItemPayload] = useState({});
  const ADDED_ID = 4;
  const cartId = useSelector(getCartId);


  useEffect(() => {
    if (!cartId && currentUser) dispatch(fetchCart(currentUser.id));
  }, [currentUser]);


  useEffect(() => {
    let input = parseInt(quantity);
    if (input < 1) input = 1;
    else if (!input) input = "";
    setQuantity(parseInt(input));
    setSize(size);

  }, [quantity, size]);

  const adjustSize = (e, newSize) => {
    setSize(newSize);
    if (e?.currentTarget) {
    e.currentTarget.style.backgroundColor = 'black'
        e.currentTarget.style.color = "white"
    } else{
     let nodes =  document.getElementById('s-container').childNodes
   for(let i=0; i<nodes.length; i++) {
    if (nodes[i].nodeName.toLowerCase() == 'label') {
         nodes[i].style.backgroundColor = 'white'
         nodes[i].style.color = 'black'
     }
    }
  }
}

  const selectedSize = (input)=>{
    if (size === input){
      return {backgroundColor : 'black', color: 'white'}
    } else{
      return {backgroundColor : 'white', color: 'black'}
    }
  }
  useEffect(() => {
    if (currentUser) {
      setItemPayload({
        itemId: item.id,
        cartId: cartId,
        size: size,
        quantity: quantity,
      });
    }

  }, [quantity, size]);

  const addToCart = (e) => {
    e.preventDefault();
    if (!currentUser) {
      navigate("/Cart");
    } else {
      dispatch(toggleModal(ADDED_ID));
      dispatch(addCartItem(itemPayload));
      setSize()
      setQuantity(1);
      setTimeout(()=>{
        adjustSize();
      },400)
    }
  };

  return (
    <form className="size-box-form" onSubmit={addToCart}>
      <div className="size-box">
        <span>
          Size: -------------------------------------------------------
        </span>
        <div className="sizes-container" id='s-container'>
          <label
            onClick={(e) => adjustSize(e, "XS")}
            style={selectedSize("XS")}
          >
            {" "}
            <span>XS</span>
            <input type="radio" name="size" value={size} />
          </label>
          <label onClick={(e) => adjustSize(e, "S")} style={selectedSize("S")}>
            {" "}
            <span>S</span>
            <input type="radio" name="size" value={size} />
          </label>
          <label onClick={(e) => adjustSize(e, "M")} style={selectedSize("M")}>
            {" "}
            <span>M</span>
            <input type="radio" name="size" value={size} />
          </label>
          <label onClick={(e) => adjustSize(e, "L")} style={selectedSize("L")}>
            {" "}
            <span>L</span>
            <input type="radio" name="size" value={size} />
          </label>
          <label
            onClick={(e) => adjustSize(e, "XL")}
            style={selectedSize("XL")}
          >
            {" "}
            <span>XL</span>
            <input type="radio" name="size" value={size} />
          </label>
          <label
            onClick={(e) => adjustSize(e, "XXL")}
            style={selectedSize("XXL")}
          >
            <span>XXL</span>
            <input type="radio" name="size" value={size} />
          </label>
      
        </div>
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
          {size ? (
            <Button type="submit" name="ADD TO BAG"></Button>
          ) : (
            <div className="button" id="holder">
              SELECT A SIZE
            </div>
          )}
        </div>
        <span>----------------------------------------------------------</span>
      </div>
    </form>
  );
}

export default SizeBox;
