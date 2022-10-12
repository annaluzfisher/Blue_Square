import "./shop.css";
import "../modals.css";
import React from "react";
import ModalNavBar from "../ModalNavBar/ModalNavBar";
import { useSelector, useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import NavTierLabel from "../NavTierLabel/NavTierLabel";
import { fetchCollections, getCollections } from "../../../store/collections";
// const ExpandableCollection = React.lazy(() => import("./ExpandableCollection/ExpandableCollection"));
import ExpandableCollection from "./ExpandableCollection";
import ExpandableActivities from "./ExpandableCollection/ExpandableActivities";
function Shop() {
  const dispatch = useDispatch();
  const SHOP_ID = 2;
  const visible = useSelector((state) => state.ui.modals[SHOP_ID].visible);

  const storeCollections = useSelector(getCollections());

  const [collections, setCollections] = useState("");

  useEffect(() => {
    dispatch(fetchCollections());
  }, []);
  //two use effects

  useEffect(() => {
    dispatch(getCollections());
    setCollections(storeCollections);
  }, [storeCollections]);


 const allCollectionIds = Object.keys(storeCollections.collections);
 let collectionIds = []
 let activityIds = []
 allCollectionIds.map((id) => {
   if (storeCollections.collections[id].activity){
     activityIds.push(id)
   }else{
     collectionIds.push(id)
   }
 })

  if (!visible) return null;
if (storeCollections){
    return (
      <>
        <div className={`shop-modal modal ${visible ? "" : "hidden"}`}>
          <ModalNavBar modalId={SHOP_ID} />
          <NavTierLabel name={"SHOP"} />
          <div className="shop-modal-page">
            <div className="activities-holder">
              <h2>Activities</h2>
              {activityIds.map((collection) => {
                return (
                  <ExpandableActivities
                    collectionId={collection}
                    key={collection}
                  />
                );
              })}
            </div>
            {collectionIds.map((collection) => {
              return (
                <ExpandableCollection
                  collectionId={collection}
                  key={collection}
                />
              );
            })}
          </div>
        </div>
      </>
    );
          }
}

export default Shop;
