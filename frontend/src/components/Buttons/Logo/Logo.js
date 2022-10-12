
import './logo.css'
import {Link} from 'react-router-dom'
import {useDispatch, useSelector} from 'react-redux'
import { toggleModal } from '../../../store/ui';

function Logo({color = 'white'}) {

    const dispatch = useDispatch();
    const modals = useSelector((state) => Object.values(state.ui.modals));
    const handleClick = () => {
      modals.map((modal) => {
        if (modal.visible) dispatch(toggleModal(modal.id));
      });
    };
    
  return (
    <div className="logo" id='logo'>
      <Link to="/" onClick={handleClick}>
          <i className="fa-regular fa-circle-stop" style={{ color: color }}></i>
      </Link>
    </div>
  );
}

export default Logo