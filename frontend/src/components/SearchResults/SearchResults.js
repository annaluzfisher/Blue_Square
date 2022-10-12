import "./searchresults.css";
import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import {
  clearResults,
  fetchSearch,
  getResults,
} from "../../store/search";
import ImageSnapshot from "../ItemShowPage/ImageSnapshot";
import { useNavigate, useParams } from "react-router-dom";

import Button from "../Buttons/Button";

function SearchResults() {
  const results = useSelector(getResults);

  const navigate = useNavigate();
  const {query} = useParams()
  // if (query === undefined) navigate('/');

    const [searchRequest, setSearchRequest] = useState(query);
    const dispatch = useDispatch();

    useEffect(()=>{
    
       if(results.length === 0) dispatch(fetchSearch(query))
    },[])
    const handleSearch = (e) => {
      e.preventDefault();
      dispatch(fetchSearch(searchRequest));
    };

    const handleChange = (e) => {
      setSearchRequest(e.target.value.toUpperCase());
    };

 

    useEffect(() => {
      if (searchRequest === "") {
        dispatch(clearResults());
      }
    }, [searchRequest]);


  return (
    <>
      <div className="bar-holder">
        <form className="search-form" on onSubmit={(e) => handleSearch(e)}>
          <input
            type="search"
            placeholder="Search for a product"
            onChange={(e) => handleChange(e)}
          ></input>
          <button type="submit" class="btn btn-success">
            <i
              className="fa-solid fa-magnifying-glass"
              // onClick={handleSearch}
            ></i>
          </button>
        </form>
      </div>
      <div className="search-results-header">
        <h2>'{searchRequest.toUpperCase()}' product results</h2>
        <h2>{results?.length} Products</h2>
      </div>
      <div className="cat-page-images-container">
        {results[0] ? 
         (
        results?.map((result) => {
          return <ImageSnapshot key={result.id} itemId={result.id} />;
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
    </>
  );
}

export default SearchResults;
