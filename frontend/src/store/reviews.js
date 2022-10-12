
import csrfFetch from "./csrf";

import { fetchItem } from "./item";

const RECEIVE_REVIEW = "RECEIVE_REVIEW";
const DELETE_REVIEW = "DELETE_REVIEW";
const RECEIVE_REVIEWS = "RECEIVE_REVIEWS";

export const receiveReviews = (reviews) => ({
  type: RECEIVE_REVIEWS,
  reviews,
});

const receiveReview = (review) => ({
  type: RECEIVE_REVIEW,
  review,
});

const removeReview = (reviewId) => ({
  type: DELETE_REVIEW,
  reviewId
})

export const getReview = (reviewId) => (state) => {
  if (!state.reviews) return null;
  else if (!state.reviews[reviewId]) return null;
  else {
    return state.reviews[reviewId];
  }
};

 export const getAllReviews = (state) => {
    if (!state) return null;
    if (!state.reviews) return [];
    else {
      return Object.values(state.reviews);
    }
  }



export const createReview = (review) => async (dispatch) => {
  const res = await csrfFetch(`/api/reviews`, {
    method: "POST",
    body: JSON.stringify({ review }),
  });
  if (res.ok) {
    const review = await res.json();

    dispatch(receiveReview(review))
       dispatch(fetchItem(Object.values(review)[0].itemId));
  }
};

export const updateReview = (review,reviewId) => async (dispatch) => {
  const res = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "PATCH",
    body: JSON.stringify({ review }),
  });
  if (res.ok) {
    const review = await res.json();
    dispatch(receiveReview(review));
    dispatch(fetchItem(Object.values(review)[0].itemId));
 
  }
};
export const deleteReview = (reviewId) => async (dispatch) => {
  const res = await csrfFetch(`/api/reviews/${reviewId}`, {
    method: "DELETE",
  });
  if (res.ok) {
    dispatch(removeReview(reviewId))

   
  } else {
    console.log("error in delete review", res);
  }
};
const reviewsReducer = (state = {}, action) => {
  Object.freeze(state);
 let newState = { ...state };

  switch (action.type) {
    case RECEIVE_REVIEWS:
   
      newState = {...newState,...action.reviews };
      return newState;
    case RECEIVE_REVIEW:
      return {...newState,...action.review}
    case DELETE_REVIEW:
        delete newState[action.reviewId]
        return newState
    default:
      return newState;
  }
};
export default reviewsReducer;