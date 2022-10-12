import { toggleModal } from "../../store/ui";
import "./navbar.css";
import { useEffect, React, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import Navigation from "../Modals/NavigationComponents/Navigation/Navigation";
import { Link, useLocation, useParams } from "react-router-dom";
import Logo from "../Buttons/Logo/Logo";
import Search from "../Modals/Search/Search";
import Shop from "../Modals/Shop/Shop";

import { clearResults } from "../../store/search";
// const Shop = React.lazy(() => import("../Modals/Shop/Shop"));

function NavBar() {
  const NAVIGATION_ID = 1;
  const SHOP_ID = 2;
  const SEARCH_ID = 3;
  const ADDED_ID = 4
  const dispatch = useDispatch();
  let location = useLocation();
  const [color, setColor] = useState('white');
  const currentUser = useSelector((state) => state.session.user);
  const params = useParams();
  useEffect(() => {

    location.pathname.includes("/Items/") ||
    location.pathname.includes("Cart/") ||
    location.pathname.includes("Search")
      ? setColor("black")
      : setColor("white");
  }, [location.pathname,params,currentUser]);

const handleSearchToggle = () => {
if (!location.pathname.includes('Search')){
  dispatch(clearResults())
}
dispatch(toggleModal(SEARCH_ID))
}
  return (
    <>
      <nav className="nav-bar" style={{color : color}}>
        <div className="nav-left">
          <Logo color={color} />
          <div className="title-wrapper">
            <span>Blue Square</span>
          </div>
        </div>
        {/* <div className="nav-middle"></div> */}
        <div className="nav-right">
          <div
            className="shop-wrapper"
            onClick={() => dispatch(toggleModal(SHOP_ID))}
          >
            <span>SHOP</span>
          </div>
          <div
            className="search-icon-wrapper"
            onClick={handleSearchToggle}
          >
            <i className="fa-solid fa-magnifying-glass hover-icon"></i>
          </div>
          <div
            className="hamburger-icon-wrapper"
            onClick={() => dispatch(toggleModal(NAVIGATION_ID))}
          >
            <i className="fa-solid fa-bars"></i>
          </div>
          <div className="shopping-bag-icon-wrapper hover-icon">
            {!currentUser ? (
              <Link to="Cart">
                {" "}
                <i className="fa-solid fa-bag-shopping"></i>
              </Link>
            ) : (
              <Link to={`Cart/${currentUser.id}`}>
                {" "}
                <i className="fa-solid fa-bag-shopping"></i>
              </Link>
            )}
          </div>
        </div>
      </nav>
      <Navigation />
      <Shop />
      <Search />

    </>
  );
}
<i className="fa-solid fa-magnifying-glass"></i>;
export default NavBar;
