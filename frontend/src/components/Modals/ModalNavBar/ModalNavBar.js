import './modalnavbar.css'
import { useDispatch, useSelector } from "react-redux";
import { toggleModal } from "../../../store/ui";
import Logo from '../../Buttons/Logo/index'
import { Link } from 'react-router-dom'

function ModalNavBar({modalId, extra = false ,subtotal}) {
     const dispatch = useDispatch();
       const currentUser = useSelector((state) => state.session.user);
       let color;
       extra ? color = 'white' : color = false
  return (
    <nav className="modals-nav-bar" style={{ color: color }}>
      <Logo color={color} />

      {extra && (
        <div
          className="modal-shopping hover-icon"
          onClick={() => dispatch(toggleModal(modalId))}
        >
          <Link to={`/Cart/${currentUser?.id}`}>
            {" "}
            <i className="fa-solid fa-bag-shopping"></i>
          </Link>
        </div>
      )}
      <div className="x-icon" onClick={() => dispatch(toggleModal(modalId))}>
        <i className="fa-solid fa-xmark"></i>
      </div>
    </nav>
  );
}

export default ModalNavBar