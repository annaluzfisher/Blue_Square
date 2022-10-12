import "./loginform.css";
import { useDispatch, useSelector } from "react-redux";
import { loginUser } from "../../../store/session";
import { useState, useEffect } from "react";
import Button from "../../Buttons/Button/Button";
import Errors from "../../Errors";
import { toggleModal } from "../../../store/ui";

function LogInForm() {
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [user, setUser] = useState({});
  const [errors, setErrors] = useState("");
  const demoUser = {email: 'demo@email.com', password: 'password' }
  const NAVIDATION_ID = 1;

  const areValid = (email, password) => {
    if (email.length < 5) {
      setErrors("Please Enter a valid email address");
    }
    if (password.length < 6) {
      setErrors("Password must be at least 6 characters");
    } else {
      return true;
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (areValid(email, password)) {
      let errors;
      errors = dispatch(loginUser(user));
      if (errors) {
        setTimeout(() => {
          setErrors("Incorrect Email or Password. Please try again.");
        }, 1000);
      }
    }
  };

  useEffect(() => {
    setUser({ email, password });
  }, [email, password]);

 const demoSubmit = (e) => {
  e.preventDefault();
  dispatch(loginUser(demoUser))
 }
  return (
    <>
      <div className="login-form-wrapper">
        <span>Login To Your Account</span>
        <form onSubmit={handleSubmit}>
          <label>Email Address*</label>
          <input
            type="email"
            placeholder="your_email@internet.com..."
            value={email.email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <label>Password*</label>
          <input
            type="password"
            placeholder="password..."
            value={password.password}
            onChange={(e) => setPassword(e.target.value)}
          />
          {errors && <Errors errors={errors} />}

          <Button name={"SUBMIT"} type={"submit"}  />
        </form>
        <div className="lower-form">
          <span>Haven't been down this trail before?</span>
          <div className="login-buttons-container">
            <Button
              localPath="Create-Account"
              name={"REGISTER"}
              primary={'secondary'}
            />
            <form onSubmit={demoSubmit}>
              <Button name={"DEMO USER"} type={"submit"}/>
            </form>
          </div>
        </div>
      </div>
    </>
  );
}

export default LogInForm;
