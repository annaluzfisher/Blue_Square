import csrfFetch from "./csrf";
import { receiveReviews } from "./reviews";

const RECEIVE_ITEM = "RECEIVE_ITEM";
const RECEIVE_ERROR = "RECEIVE_ERROR";

const receiveError = (error) => ({
  type: RECEIVE_ERROR,
  error,
});

export const receiveItem = (item) => ({
  type: RECEIVE_ITEM,
  item,
});

export const getItem = (itemId) => (state) => {
  if (!state) return null;
  else if (!state.items) return null;
  else {
    return state.items[itemId];
  }
};

export const fetchItem = (itemId) => async (dispatch) => {
  const res = await csrfFetch(`/api/items/${itemId}`);
  if (res.ok) {
    const payload = await res.json();
    if (payload.item) {
      dispatch(addItemPayload(payload));
    } else if (payload.error) {
      dispatch(receiveError(true));
    }
  } else {
    dispatch(receiveError(true));
  }
};

export const addItemPayload = (payload) => {
  return (dispatch) => {
    dispatch(receiveItem(payload.item));
    dispatch(receiveReviews(payload.reviews));
  };
};

const itemReducer = (state = { error: false }, action) => {
  Object.freeze(state);
  let newState = { ...state };
  switch (action.type) {
    case RECEIVE_ITEM:
      action.item.price = (Math.round(action.item.price * 100) / 100).toFixed(
        2
      );
      newState[action.item.id] = action.item;
      newState.error = false;
      return { ...newState };
    case RECEIVE_ERROR:
      console.log(action.error);
      newState.error = action.error;
      return newState;

    default:
      return newState;
  }
};

export default itemReducer;
