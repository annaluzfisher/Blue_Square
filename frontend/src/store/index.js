import { createStore, combineReducers, applyMiddleware, compose } from "redux";

import thunk from "redux-thunk";
import sessionReducer  from "./session";
import userReducer from "./user";
import uiReducer from "./ui";
import itemReducer from "./item";
import collectionsReducer from "./collections";
import cartReducer from "./cart";
import reviewsReducer from "./reviews";
import resultsReducer from "./search";

const rootReducer = combineReducers({
  ui: uiReducer,
  user: userReducer,
  session: sessionReducer,
  items: itemReducer,
  collections: collectionsReducer,
  cart: cartReducer,
  reviews: reviewsReducer,
  results: resultsReducer
});

let enhancer;

if (process.env.NODE_ENV === "production") {
  enhancer = applyMiddleware(thunk);
} else {
  const logger = require("redux-logger").default;
  const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
  enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

const configureStore = (preloadedState) => {
  return createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore;