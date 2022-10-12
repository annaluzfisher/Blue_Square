import "./search.css";
import "../modals.css";
import NavTierLabel from "../NavTierLabel/NavTierLabel";
import ModalNavBar from "../ModalNavBar/ModalNavBar";
import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import {
  clearResults,
  fetchSearch,
  getResults,
  fetchSearch5,
} from "../../../store/search";
import ImageSnapshot from "../../ItemShowPage/ImageSnapshot";
import { useNavigate } from "react-router-dom";
import { toggleModal } from "../../../store/ui";

import Button from "../../Buttons/Button";

function Search() {
  const SEARCH_ID = 3;
  const visible = useSelector((state) => state.ui.modals[SEARCH_ID].visible);
  const [searchRequest, setSearchRequest] = useState("");
  const [options, setOptions] = useState();
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const handleSearch = (e) => {
    e.preventDefault()
        if (searchRequest !== '') {  dispatch(fetchSearch(searchRequest));
    dispatch(toggleModal(SEARCH_ID));
    navigate(`/Search/${searchRequest}`)
        }
  };

  const handleClick = () => {
     if (searchRequest !== '') { dispatch(fetchSearch(searchRequest));
    dispatch(toggleModal(SEARCH_ID));
    navigate(`/Search/${searchRequest}`);
     }
  };

  const handleChange = (e) => {
 setSearchRequest(e.target.value.toUpperCase());
       if (e.target.value.length > 0) {
        dispatch(fetchSearch5(e.target.value))
       }
  };

  const items = useSelector(getResults);
  useEffect(() => {
    if (searchRequest === "") {
      dispatch(clearResults());
    }
  }, [searchRequest]);

  useEffect(() => {
    setOptions(items);
  }, [items]);

  
  if (!visible) return null;
  return (
    <>
      <div className={`search-modal modal ${visible ? "" : "hidden"}`}>
        <ModalNavBar modalId={SEARCH_ID} />
        <NavTierLabel name={"SUGGESTIONS"} />
        <div className="search modal-page">
          <form className="search-form" onSubmit={(e)=>handleSearch(e)}>
            <input type="search" onChange={(e) => handleChange(e)}></input>
            <button type="submit" class="btn btn-success">

            <i
              className="fa-solid fa-magnifying-glass"
              // onClick={handleSearch}
            ></i>

            </button>
          </form>
        </div>
        <div className="suggestions">
          <div className="header-holder">
            {searchRequest && (
              <>
                <h1>'{searchRequest}'</h1>
                <div className="arrow-button" onClick={handleClick}>
                  <span>SHOP ALL</span>
                  <i className="fa-solid fa-angle-right"></i>
                </div>
              </>
            )}
          </div>
          <div className="scroller">
            {options[1] ? (
              options?.map((item) => {
                return <ImageSnapshot itemId={item.id} />;
              })
            ) : (
          
              <div className="no-results-container">
                <h3>No results...</h3>
                <Button
                  localPath={"/"}
                  name={"KEEP SHOPPING"}
                  primary={"secondary"}
                />
              </div>
            )}
          </div>
        </div>
      </div>
    </>
  );
}

export default Search;
