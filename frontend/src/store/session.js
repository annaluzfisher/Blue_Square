import csrfFetch from "./csrf";
// import { storageUser } from "../index";

const RECEIVE_CURRENT_USER = "users/RECEIVE_CURRENT_USER";
const REMOVE_CURRENT_USER = "users/REMOVE_CURRENT_USER";

export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user,
});

export const removeCurrentUser = () => ({
  type: REMOVE_CURRENT_USER,
});

export const getCurrentUser = (state) => {
  if (!state) return null;
  else if (!state.session.user) return null;
  else {
    return state.session.user
  }
};

export const loginUser = (user) => async (dispatch) => {
  try {
  const res = await csrfFetch("/api/session", {
    method: "POST",
    body: JSON.stringify({ user }),
  })
  if (res.ok){
    const userData = await res.json()
    dispatch(receiveCurrentUser(userData))
    return false
  } }
  catch {
   return true
  }

};

//this is no passed first and then isn't being triggered to re-render!
const storageUser = sessionStorage.getItem('currentUser')

export const logoutUser = () => async (dispatch) => {

  csrfFetch("/api/session", {
    method: "DELETE",
  }).then(() => dispatch(removeCurrentUser()));

};

let initialState;
if (storageUser) {

  initialState = { user: JSON.parse(storageUser) };
} else {
  initialState = { user: null };
}

const sessionReducer = (state = initialState, action) => {

  Object.freeze(state);
  let newState = { ...state };
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
   
      return { ...newState, ...action.user };
    case REMOVE_CURRENT_USER:
   
      newState = { user: null };
      return newState;
    default:
      return newState;
  }
};

export default sessionReducer;

