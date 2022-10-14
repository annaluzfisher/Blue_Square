import "./categoryshowpage.css";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import {
  fetchCollections,
  getCategory,
  getCollections,
} from "../../store/collections";
import Banner from "../Banner/Banner";
import ImageSnapshot from "../ItemShowPage/ImageSnapshot";

function CategoryShowPage() {
  const { categoryId } = useParams();

  const navigate = useNavigate();
  const dispatch = useDispatch();
  const storeCategory = useSelector(getCategory(parseInt(categoryId)));
  const [category, setCategory] = useState();

 useEffect(() => {

  if (category && (category?.id !== parseInt(categoryId)))   navigate("/404");
 }, [category,storeCategory]);



  useEffect(() => {
   if (storeCategory) setCategory(storeCategory);
  }, [storeCategory]);

  if (!category) return null;
  if (!categoryId) return null;
  if (!storeCategory) return null
  let count = storeCategory?.itemIds.length;
  return (
    <>
      <Banner pageTitle={storeCategory?.name} imgUrl={storeCategory?.imageUrl} />
      <div className="results">
        <span>{`${storeCategory?.name} product results`}</span>
        <div>{`${count} results`}</div>
      </div>
      <div className="cat-page-images-container">
        {storeCategory?.itemIds.map((itemId) => {
          return <ImageSnapshot key={itemId} itemId={itemId} />;
        })}
      </div>
    </>
  );
}

export default CategoryShowPage;
