import "./userinfo.css";
import { logoutUser } from "../../../../store/session";
import { useDispatch, useSelector } from "react-redux";
import { toggleModal } from "../../../../store/ui";
import Button from "../../../Buttons/Button/Button";
function UserInfo() {
  const dispatch = useDispatch();
  const user = useSelector((state) => state.session.user);
  const currentUser = sessionStorage.getItem("currentUser");

  const handleClick = () => {
    sessionStorage.setItem("currentUser", null);
    dispatch(logoutUser());
  };
  return (
    <>
      <div className="user-info-wrapper">
        <div className="details">Account Details</div>
        <span>{user.firstName + "  " + user.lastName}</span>
        <span>{user.email}</span>
        <span>{user.company}</span>
        <div>
          <Button name={"MY ACCOUNT"} localPath={'/Cart'}/>
          <div className="logout-button" onClick={handleClick}>
            <span>LOGOUT</span>
            <i className="fa-solid fa-angle-right"></i>
          </div>
        </div>
      </div>
    </>
  );
}

export default UserInfo;
