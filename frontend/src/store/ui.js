import { combineReducers } from "redux";

const TOGGLE_MODAL = "TOGGLE_MODAL";


export const toggleModal = (id) => ({
  type: TOGGLE_MODAL,
  id,
});


export const modalsReducer = (state = {}, action) => {
  Object.freeze(state);
  const newState = { ...state };
  switch (action.type) {
    case TOGGLE_MODAL:
      newState[action.id].visible
        ? (newState[action.id].visible = false)
        : (newState[action.id].visible = true);
      return { ...newState };
    default:
      return newState;
  }
};

export const preloadedModals = {
  ui: {
    modals: {
      1: {
        id: 1,
        visible: false,
      },
      2: {
        id: 2,
        visible: false,
      },
      3: {
        id: 3,
        visible: false,
      },
         4: {
        id: 4,
        visible: false,
      }
    },
  },
};
// 1 is navigation/burger   2 is shop  3 is searchpage 4 is you bought

const RECEIVE_STATUS = "RECEIVE_STATUS";

export const receiveStatus = (status) => ({
  type: RECEIVE_STATUS,
  status,
});

const loadingReducer = (state={}, action)=>{
  Object.freeze(state);
    const newState = { ...state };
  switch(action.type){
    case receiveStatus:
          // newState[action.loading].loaded
          //   ? (newState[action.id].loaded = false)
          //   : (newState[action.id].loaded = true);
      return newState
    default:
      return newState;
  }
}
const uiReducer = combineReducers({
  modals: modalsReducer,
  loading: loadingReducer,
});

export default uiReducer;
