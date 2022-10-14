import './collectionshowpage.css'
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import {fetchCollections, getCollections} from '../../store/collections'
import Banner from '../Banner/Banner';
import ImageSnapshot from '../ItemShowPage/ImageSnapshot';

function CollectionShowPage() {
  const {collectionId}  = useParams();
  const dispatch = useDispatch();
  const storeCollections = useSelector(getCollections());
  const [collection, setCollection] = useState();
  const navigate = useNavigate();


useEffect(()=>{
  
  console.log(collectionId, collection?.id);
    if (collection &&  (collection?.id !== parseInt(collectionId))){
      navigate("/404")
  }
},[collection,collectionId])


  useEffect(() => {
    if (!storeCollections) dispatch(fetchCollections());
  }, []);

 useEffect(() => {
   setCollection(storeCollections.collections[parseInt(collectionId)]);
 }, [storeCollections]);


  if (!collection) return null;
  return (
    <>
      <Banner pageTitle={collection.name} imgUrl={collection.imageUrl} />
      <div className="results">
        <span>{`${collection.name} product results`}</span>
        <div>{`${collection.itemIds.length} results`}</div>
      </div>
      <div className="cat-page-images-container">
        {collection.itemIds.map((itemId) => {
          return <ImageSnapshot itemId={itemId} />;
        })}
      </div>
    </>
  );
}

export default CollectionShowPage

