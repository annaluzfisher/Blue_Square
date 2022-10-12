import LazyImage from "./LazyImage";
import "./themecomponent.css";
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useState } from "react";
import { fetchCollections, getCollections } from "../../store/collections";

function ThemeComponenet() {
  const dispatch = useDispatch();
  const collections = useSelector(getCollections());

  const [campingId, setCampingId] = useState();
  const [equpmentId, setEquipmentId] = useState();
  const [winterId, setWinterId] = useState();
  const [climbingId, setClimbingId] = useState();
  useEffect(() => {
    if (!collections) {
      dispatch(fetchCollections());
    }

  }, [collections]);

  setTimeout(()=>{

    Object.values(collections?.collections).map((collection) => {
      if (collection.name === "Camping") setCampingId(collection.id);
      if (collection.name === "Winter") setWinterId(collection.id);
      if (collection.name === "Equipment") setEquipmentId(collection.id);
      if (collection.name === "Climbing") setClimbingId(collection.id);
    });

  },300)
 

if (!campingId) return null;
  return (
    <div className="theme-component">
      <LazyImage
        imageUrl="/BannerImages/image6.jpg"
        text={"Climbing"}
        collectionId={climbingId}
      />
      <LazyImage
        imageUrl="/BannerImages/camping.jpg"
        text={"CAMPING"}
        collectionId={campingId}
      />
      <LazyImage
        imageUrl="/BannerImages/snow.jpg"
        text={"SNOW"}
        collectionId={winterId}
      />
      <LazyImage
        imageUrl="/BannerImages/accessories.jpg"
        text={"EQUIPMENT"}
        collectionId={equpmentId}
      />
    </div>
  );
}

export default ThemeComponenet;
