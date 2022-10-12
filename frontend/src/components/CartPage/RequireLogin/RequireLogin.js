import "./requirelogin.css";
import { useState, useEffect } from "react";
import { useSelector ,useDispatch} from "react-redux";
import { useNavigate} from "react-router-dom";
import Button from "../../Buttons/Button";
import { toggleModal } from "../../../store/ui";
import Banner from "../../Banner/Banner";

function RequireLogin() {
  const currentUser = useSelector((state) => state.session.user);
  const navigate = useNavigate();
  const dispatch = useDispatch();

  useEffect(() => {
    if (currentUser) navigate(`/Cart/${currentUser.id}`);
  }, [currentUser]);

  const handleClick = () =>{
    navigate(-1)
    dispatch(toggleModal(1))
  }

  return (
    <div className="require-login-page">
 <Banner pageTitle={"You're almost there..."} imgUrl={"BannerImages/sunset.jpg"}/>
      <div className="require-buttons-container">
      <Button localPath="/Create-Account" name={"REGISTER"} />
      <button className="button" style={{backgroundColor:'black'}} onClick={handleClick}>LOG IN</button>
      </div>
    </div>
  );
}

export default RequireLogin;
