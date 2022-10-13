import "./cartpage.css";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import { fetchCart, getCart , clearCart} from "../../store/cart";
import CartItemSnapshot from "./CartItemSnapshot";
import Button from "../Buttons/Button";
import SuggestedItems from "../SuggestedItems";
import { getCurrentUser } from "../../store/session";
import { getCollections } from "../../store/collections";
import BeatLoader from "react-spinners/BeatLoader";
import CheckoutModal from "./CheckoutModal";

function CartPage() {
  const currentUser = useSelector(getCurrentUser);
  const { userId } = useParams();
  const navigate = useNavigate();
  useEffect(() => {
    if (!currentUser) navigate("/Cart");
    if (currentUser?.id !== parseInt(userId)) navigate("/Cart");
  }, [userId, currentUser]);
  const dispatch = useDispatch();
  const storeCart = useSelector(getCart);
  const collections = useSelector(getCollections());
  const [suggestionId, setSuggestionId] = useState();
  const [loading, setLoading] = useState(true);
   const [loadingCheckout, setLoadingCheckout] = useState(false);

  const [okToCheckout, setOkToCheckout] = useState(true);
  const page = document.getElementById("cart-page");
  const [order, setOrder] = useState(true);
  const [thankYou, setThankYou] = useState(false);

  useEffect(() => {
    dispatch(fetchCart(currentUser?.id));
  }, [currentUser]);

  setTimeout(() => {
    setLoading(false);
  }, 1000);

  const numItems = useSelector((state) => {
    if (!state.cart.numItems) {
      return 0;
    } else {
      return state.cart.numItems.numItems;
    }
  });


  const vals = Object.values(collections?.collections);
  useEffect(() => {
    if (!suggestionId) {
      const random = Math.floor(Math.random(vals.length * 1) * vals.length);

      setSuggestionId(vals[random]?.id);
    }
  },[vals]);

  const [subtotal, setSubtotal] = useState(0);

  let subTotalV = 0;

  useEffect(() => {
    if (storeCart) {
      let allItems = storeCart;
      allItems.map((item) => {
        subTotalV += parseFloat(
          (((item.price * item.quantity) / 100) * 100).toFixed(2)
        );
      });
      setSubtotal(subTotalV.toFixed(2));
    }
  }, [numItems]);

  useEffect(() => {
    if (currentUser && !storeCart) {
      dispatch(fetchCart(currentUser.id));
    }
  }, [currentUser]);

  const scrollToFooter = () => {
   const links = document.getElementById('links-box')
   links.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  useEffect(()=>{
    if ((!order && !okToCheckout) && subtotal < 2000){
     setLoadingCheckout(true)
     setTimeout(()=>{
       setOrder(true)
       setOkToCheckout(true)
     }, 600)
    }
  },[subtotal])

  const handleCheckout = () => {
    if (subtotal === 0) {
      return null
    }
   
    setLoadingCheckout(true)
    setTimeout(()=>{
      setLoadingCheckout(false)
    },600)
    if (subtotal < 2000 && subtotal > 0) {
      setOkToCheckout(true);
      setLoading(true)
      setTimeout(()=>{ 
        setThankYou(true);
        setLoading(false);
      },600)
      dispatch(clearCart(currentUser.id))
    } else if(subtotal > 2000){
      setOkToCheckout(false);
      setOrder(false);
    }
  
  };

  if (!currentUser) return null;

  return (
    <>
      <div className="cart-page" id={"cart-page"}>
        <div>
          <div className="title-holder">
            <h1>{"SHOPPING BAG"}</h1>
            <span>{numItems} Items</span>
          </div>
          {loading ? (
            <BeatLoader
              className="loader"
              color="#CD4C1D"
              speedMultiplier={0.5}
            />
          ) : (
            <>
              {numItems > 0 ? (
                <div className="snapshot-holder">
                  {storeCart.map((item, i) => {
                    return <CartItemSnapshot key={100 + i} item={item} />;
                  })}
                </div>
              ) : (
                <div className="empty-holder">
                  {thankYou ? (
                    <>
                      <h1>Thank You</h1>
                      <h1>Your order has been placed.</h1>
                    </>
                  ) : (
                    <h1>Looks like your cart is empty</h1>
                  )}
                  <Button localPath="/" color="black" name={"KEEP SHOPPING"} />
                </div>
              )}
            </>
          )}
        </div>
        {order && (
          <div className="order-summary">
            <h2>{"Order Summary"}</h2>
            <div>
              <span>Order Subtotal</span>
              <span>$ {subtotal}</span>
            </div>
            <div>
              <span>Estimated Shipping</span>
              <span>$ {(subtotal * 0.09).toFixed(2)}</span>
            </div>
            <div>
              <span>Total</span>
              <span>$ {parseFloat(subtotal * 0.09 + subtotal).toFixed(2)}</span>
            </div>
            <div className="button" onClick={handleCheckout}>
              CHECK OUT NOW
            </div>
          </div>
        )}
        {!okToCheckout && !order && (
          <div className="order-summary">
            {loadingCheckout ? (
              <BeatLoader
                className="loader"
                color="#CD4C1D"
                speedMultiplier={0.4}
              />
            ) : (
              <>
                <h2>{"Are You Sure?"}</h2>
                <div>
                  <p>
                    {
                      "Looks like you're order is over $2,000 USD. For large orders please call (713) 823-7373."
                    }
                  </p>
                </div>
                <div className="button" onClick={scrollToFooter}>
                  CONTACT VIA EMAIL
                </div>
              </>
            )}
          </div>
        )}
      </div>

      <SuggestedItems
        title={"You might be interested in"}
        collectionId={suggestionId}
      />
    </>
  );
}

export default CartPage;
