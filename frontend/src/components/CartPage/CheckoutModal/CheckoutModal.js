import "./checkoutmodal.css";

function CheckoutModal({ ok }) {
  return (
    <>
      {ok ? (
        <>
          <div className="checkout-modal"></div>{" "}
        </>
      ) : (
        <>
          <div className="checkout-modal"></div>
        </>
      )}
    </>
  );
}

export default CheckoutModal;
