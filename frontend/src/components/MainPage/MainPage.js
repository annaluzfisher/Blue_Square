import "./mainpage.css";
import Masthead from "../Masthead/Masthead";

import ThemeComponent from "../ThemeComponent/ThemeComponenet";
import AngledCallout from "../AngledCallout";
import SuggestedItems from "../SuggestedItems";
import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import { getCollections } from "../../store/collections";

function MainPage() {
  const [campingId, setCampingId] = useState();
  const storeCollections = useSelector(getCollections());
  // const [equpmentId, setEquipmentId] = useState();
  const [winterId, setWinterId] = useState();
  // const [climbingId, setClimbingId] = useState();

  useEffect(() => {
    Object.values(storeCollections.collections).map((collection) => {
  
      if (collection.name === "Camping") setCampingId(collection.id);
      if (collection.name === "Winter") setWinterId(collection.id);

    });
  }, [storeCollections]);

  if (!storeCollections) return null;
  return (
    <>
      <div className="main-page">
        <Masthead
          promoTitle={"SKI & SNOW SALE"}
          imgUrl={"/BannerImages/masthead1.jpg"}
          winter={winterId}
        />
      </div>
      <div className="safety-alert"></div>
      <ThemeComponent />
      {/* <AngledCallout/> */}
  
      {campingId && (
        <SuggestedItems title={"SHOP ALL CAMPING"} collectionId={campingId} />
      )}
    </>
  );
}

export default MainPage;
