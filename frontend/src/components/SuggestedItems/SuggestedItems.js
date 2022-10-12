import './suggesteditems.css'
import ImageSnapshot from '../ItemShowPage/ImageSnapshot'
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { fetchCollections, getCollections } from '../../store/collections';
function SuggestedItems({title, collectionId}) {


  const dispatch = useDispatch();
  const storeCollections = useSelector(getCollections());
  const [collection, setCollection] = useState();
  const [itemIds, setItemIds] = useState([])

  useEffect(() => {
    setCollection(storeCollections.collections[collectionId]);

  }, [collectionId, storeCollections]);


 
useEffect(()=>{
  let sample = collection?.itemIds.slice(0, 11);
  setItemIds(sample)

},[collection])

  return (
    <div className="suggested-items-container">
      <h2>{title}</h2>
      <div className="si-snapshot-container">
 
          {itemIds && itemIds.map((itemId,i) => {
            return <ImageSnapshot key={i} itemId={itemId} />;
          })}
  
      </div>
    </div>
  );
}

export default SuggestedItems