import { createCart } from "./cart";
import csrfFetch from "./csrf";
import { receiveCurrentUser } from "./session";
const RECEIVE_USER = "RECEIVE_USER";
const DELETE_USER = "DELETE_USER";

export const receiveUser = (user) => ({
  type: RECEIVE_USER,
  user: user,
});

export const deleteUser = (userId) => ({
  type: DELETE_USER,
  userId,
});

export const createUser = (user) => async (dispatch) => {

  const result = await csrfFetch("/api/users", {
    method: "POST",
    body: JSON.stringify({user})
  })
  if (result.ok){
   const newUser = await result.json()
   dispatch(addCurrentUser(newUser))
  }else{
    const errors = await result.json();
    console.log('result', errors)

  }
    
};
export const reStoreUser = (userId) => async (dispatch) => {
  const res = await csrfFetch(`/api/users/${userId}`,{
    method: "GET",
  })
    .then((result) => result.json())
    .then((user) => dispatch(receiveUser(user)))
    .catch((error) => console.log("error from createUser action:", error));
};

export const addCurrentUser = (user) => {
    return dispatch => {
      dispatch(receiveUser(user));
      dispatch(receiveCurrentUser(user));
      dispatch(createCart(user));
    }
}

const userReducer = (state = {}, action) => {
  Object.freeze(state);
  const newState = { ...state };
  switch (action.type) {
    case RECEIVE_USER:
      return { ...newState, ...action.user };
    case DELETE_USER:
      delete newState[action.userId];
      return newState;
    default:
      return newState;
  }
};
export default userReducer;
