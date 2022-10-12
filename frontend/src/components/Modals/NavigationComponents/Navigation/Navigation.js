import "../../modals.css";
import { useSelector} from "react-redux";
import {useEffect} from 'react';
import "./navigation.css";
import LogInForm from "../../../Forms/LogIn/LogInForm";
import UserInfo from "../UserInfo/UserInfo";
import ModalNavBar from "../../ModalNavBar/ModalNavBar";
import NavTierLabel
 from "../../NavTierLabel/NavTierLabel";
function Navigation() {
  const NAVIGATION_ID = 1;
  const visible = useSelector(
    (state) => state.ui.modals[NAVIGATION_ID].visible
  );
  const currentUser = useSelector((state) => state.session.user);


    if  (!visible) return null;
  return (
    <div className={`navigation-modal modal ${visible ? "" : "hidden"}`}>
      <ModalNavBar modalId={NAVIGATION_ID} />
        <NavTierLabel name="CUSTOMER SUPPORT"/>
      <div className="navigation modal-page">

        <div className="master-form-wrapper">
          {currentUser ? <UserInfo /> : <LogInForm />}
        </div>
      </div>
    </div>
  );
}

export default Navigation;
