import { storageUser } from "../index";

export const restoreCSRF = async () => {

  try {
    const result = await csrfFetch("/api/session");
    const token = result.headers.get("X-CSRF-Token");
    if (token) sessionStorage.setItem("X-CSRF-Token", token);
    let data = await result.json();
    restoreCurrentUser(data);
    return data;
  } catch (error) {

  }
};
export let tempCurrentUser;
export const restoreCurrentUser = (response) => {
  if (response.user) {
    sessionStorage.setItem("currentUser", JSON.stringify(response.user));
  } else {
    sessionStorage.setItem("currentUser", null);
  }
  tempCurrentUser = response;
};

const csrfFetch = async (url, options = {}) => {
  options.method ||= "GET";
  options.headers ||= {};
  if (options.method.toUpperCase() !== "GET") {
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";
    options.headers["X-CSRF-Token"] = sessionStorage.getItem("X-CSRF-Token");
  }
  const res = await fetch(url, options);
  if (res.status >= 400) throw res;
  return res;
};

export default csrfFetch;
