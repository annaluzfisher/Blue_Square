import { getCollection, getCategories } from "../../../../store/collections";
import "./expandablecollection.css";
import { useSelector, useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import { toggleModal } from "../../../../store/ui";
function ExpandableCollection({ collectionId }) {
  const collection = useSelector(getCollection(collectionId));
  const categories = useSelector(getCategories());
  const dispatch = useDispatch();
  const categoryIds = collection.categoryIds;
  const SHOP_ID = 2;
  const childCategories = [];
  const soloCategories = [];
  // let hidden = 'hidden'

  // const toggleSubCat=(i) =>{
  //    <div className={`sub-cat-container`}>
  //      {i.map((sub) => {
  //        return (
  //          <Link to={`Category/${sub}`}>
  //            <span onClick={handleToggle} key={sub}>
  //              {categories[sub].name}
  //            </span>
  //          </Link>
  //        );
  //      })}
  //    </div>;

  categoryIds.map((id) => {
    if (!categories[id].parentId) {
      soloCategories.push(id);
    } else {
      childCategories.push(id);
    }
  });

  let sortedIds = {};
  soloCategories.map((id) => {
    return (sortedIds[id] = []);
  });
  childCategories.forEach((childId) => {
    if (soloCategories.includes(categories[childId].parentId)) {
      sortedIds[categories[childId].parentId].push(childId);
    } else {
      sortedIds[childId] = [];
    }
  });

  const array = Object.keys(sortedIds);
  let final = [];
  array.forEach((key) => {
    if (sortedIds[key].length > 0) {
      final.push([key, sortedIds[key]]);
    } else {
      final.push(key);
    }
  });

  const handleToggle = ()=>{
    dispatch(toggleModal(SHOP_ID))
  }

  if (collection.id) {
    return (
      <div className="ec-container">
        {collection && <h3 key={collection.id}>{collection.name}</h3>}
        {final.map((catId,i) => {
          if (categories[catId]) {
            return (
              <Link to={`Category/${catId}`} key={catId}>
                <p onClick={handleToggle}>{categories[catId].name}</p>
              </Link>
            );
          } else {
            return (
              <div key={i} className="expandable">
                <div className="expandable-title">
                  <div className="plus">+</div>
                  <span key={catId[0]}>{categories[catId[0]].name}</span>
                </div>
                <div className={`sub-cat-container`}>
                  {catId[1].map((sub) => {
                    return (
                      <Link to={`Category/${sub}`}>
                        <span onClick={handleToggle} key={sub}>
                          {categories[sub].name}
                        </span>
                      </Link>
                    );
                  })}
                </div>
              </div>
            );
                }
        })}
      </div>
    );
  }
}

export default ExpandableCollection;

