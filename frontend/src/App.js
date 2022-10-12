import { Routes, Route, Navigate, useLocation } from "react-router-dom";
import MainPage from "./components/MainPage";
import NavBar from "./components/NavBar/NavBar";
import { useEffect } from "react";
import { storageUser } from ".";
import { removeCurrentUser, receiveCurrentUser } from "./store/session";
import { useDispatch } from "react-redux";
import { tempCurrentUser } from "./store/csrf";
import { useState } from "react";
import React from "react";
import CreateAccount from "../src/components/CreateAccount/CreateAccount";
import CartPage from "./components/CartPage";
import ItemShowPage from "./components/ItemShowPage";
import NotFound from "./components/NotFound";
import RequireLogin from "./components/CartPage/RequireLogin/RequireLogin";
import SearchResults from "./components/SearchResults/SearchResults";
import Footer from "./components/Footers/Footer/Footer";
import CategoryShowPage from "./components/CategoryShowPage";
import CollectionShowPage from "./components/CollectionShowPage";

function App() {
  const dispatch = useDispatch();
  const [currentUser, setCurrentUser] = useState(tempCurrentUser);

  useEffect(() => {
    if (storageUser === null) {
      dispatch(removeCurrentUser());
    } else {
      dispatch(receiveCurrentUser(tempCurrentUser));
    }
  }, [currentUser]);

  return (
    <>
      <div className="app" id="app">
        <NavBar />
        <Routes>
          <Route path="/Create-Account" element={<CreateAccount />} />

          <Route path="/" element={<MainPage />} />

          <Route path="/Cart/:userId" element={<CartPage />} />

          <Route path="/Cart" element={<RequireLogin />} />

          <Route path="/Items/:itemId" element={<ItemShowPage />} />

          <Route path="/Category/:categoryId" element={<CategoryShowPage />} />
          <Route
            path="/Collection/:collectionId"
            element={<CollectionShowPage />}
          />
            <Route path="/Search/:query" element={<SearchResults />} />
          <Route
            path="/404"
            element={<NotFound imgUrl={"BannerImages/notfound.jpg"} />}
          />
          <Route path="*" element={<Navigate to="/404" replace />} />
        </Routes>

        <Footer />
      </div>
    </>
  );
}

export default App;
