import "./createaccountform.css";
import { React, useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { createUser } from "../../../store/user";
import Button from "../../Buttons/Button";
import { Navigate, useNavigate } from 'react-router-dom'



function CreateAccountForm() {
  const dispatch = useDispatch();

  const [password, setPassword] = useState("");
  const [email, setEmail] = useState("");
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [companyName, setCompanyName] = useState("  ");
  const [mailingList, setMailingList] = useState('false');

  const [user, setUser] = useState({});
  const navigate = useNavigate();


  useEffect(() => {
    setUser({ email, password, firstName, lastName, companyName, mailingList });
  }, [email, password, firstName, lastName, companyName, mailingList]);



  const handleSubmit = (e) => {
    e.preventDefault();
    dispatch(createUser(user));
    navigate('/')
  };


  return (
    <div className="create-user-form-wrapper">
      <form onSubmit={handleSubmit}>
        <div className="names">
          <div className="input-container">
            <label>First Name*</label>
            <input
              type="text"
              value={firstName}
              onChange={(e) => setFirstName(e.target.value)}
              required
            />
          </div>
          <div className="input-container">
            <label>Last Name*</label>
            <input
              type="text"
              value={lastName}
              onChange={(e) => setLastName(e.target.value)}
              required
            />
          </div>
        </div>
        <div className="input-container">
          <label>Email Address*</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </div>
        <div className="input-container cn">
          <label>Company Name</label>
          <input
            type="text"
            value={companyName}
            onChange={(e) => setCompanyName(e.target.value)}
          />
        </div>

        <div className="input-container">
          <label>Password*</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </div>
        <div id="checkbox">
          <input
            type="checkbox"
            // checked="false"
            onChange={(e) => setMailingList(e.target.value)}
          />
          <div>I wish to receive Blue Square emails</div>
        </div>
        <Button type={"submit"} name={"SUBMIT"} />
      </form>
    </div>
  );
}

export default CreateAccountForm;
