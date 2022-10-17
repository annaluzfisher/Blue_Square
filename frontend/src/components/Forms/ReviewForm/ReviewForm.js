import "./reviewform.css";
import { React, useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import Button from "../../Buttons/Button";
import Star from "../../Star";
import {
  createReview,
  updateReview,
  deleteReview,
} from "../../../store/reviews";
import Errors from "../../Errors";
import { useParams } from "react-router-dom";
import { getCurrentUser } from "../../../store/session";
import BeatLoader from "react-spinners/BeatLoader";
import { fetchItem } from "../../../store/item";


function ReviewForm({
  review = { title: "", content: "", name: "" },
  patch,
 formLoading,
}) {

  const [title, setTitle] = useState(review.title);
  const [content, setContent] = useState(review.content);
  const [name, setName] = useState(review.name);
  const [userId, setUserId] = useState(review.userId);

  const [rating, setRating] = useState(review.rating || 5);
  const [reviewId, setReviewId] = useState(review.id);
  const currentUser = useSelector(getCurrentUser);
  const dispatch = useDispatch();
  const [errors, setErrors] = useState("");
  const { itemId } = useParams();



 useEffect(()=>{
   if (currentUser) {
     setUserId(currentUser.id);
     setName(currentUser.firstName + " " + currentUser.lastName[0] + ".");
   } 
 },[currentUser,formLoading])




  useEffect(() => {
    setErrors("");
    setTitle(review.title);
    setContent(review.content);
    setRating(5);
    setName(review.name);
  }, [itemId, patch]);

  const handleClick = (i) => {
    setRating(i);
  };
  const validate = (string) => {
    if (string.length > 50 && string.length < 299) {
      return true;
    } else {
      setErrors(
        "Make sure all required fields are filled out... Review must be at least 50 characters, not over 299"
      );
      return false;
    }
  };

  const handleDelete = () => {
    if (review.title === "" || review.content === "") {
    } else {
    dispatch(deleteReview(review.id))
    dispatch(fetchItem(itemId))
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (validate(content)) {
      setErrors();
      if (!patch) {
        dispatch(
          createReview({ title, rating, content, name, userId, itemId })
        );
      } else {
        dispatch(
          updateReview(
            { title, rating, content, name, userId, itemId },
            review.id
          )
        );
      }

      // setTitle("");
      // setContent("");
      // setRating(5);
      // setName("");
    } else {
      setErrors(
        "Uh oh! Make sure all required fields are filled out... Review must be at least 50 characters, not over 299"
      );
    }
  };

  return (
    <>
      <div className="review-form-container">
        {formLoading ? (
          <form>
            <BeatLoader
              className="form-loader"
              color="#CD4C1D"
              speedMultiplier={0.5}
            />
          </form>
        ) : (
          <>
            <form onSubmit={(e) => handleSubmit(e)}>
              <label>
                <span>{"*"}</span>
                <span>Indicates a required field</span>
              </label>
              <label>
                <span>{"*"}</span>
                <label>Score</label>
              </label>
              <div className="form-stars-container">
                {[1, 2, 3, 4, 5].map((i) => {
                  if (i <= rating) {
                    return (
                      <Star
                        key={i}
                        filled={true}
                        value={i}
                        onClick={() => handleClick(i)}
                      />
                    );
                  } else {
                    return (
                      <Star
                        key={i}
                        filled={false}
                        value={i}
                        onClick={() => handleClick(i)}
                      />
                    );
                  }
                })}
              </div>
              <label>
                <span>{"*"}</span>
                <label>Title</label>
              </label>
              <input
                type="text"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                required
              />
              <label>
                <span>{"*"}</span>
                <label>Review</label>
              </label>
              <input
                type="textarea"
                value={content}
                onChange={(e) => setContent(e.target.value)}
                required
              />
              <label>
                <span>{""}</span>
                <label>Use your name</label>
              </label>
              <input
                type="text"
                value={name}
                onChange={(e) => setName(e.target.value)}
              />
              {patch ? (
                <div className="rf-button-container">
                  <Button type={"submit"} name={"UPDATE"} />
                  <div color={"black"} name={"Delete"} onClick={handleDelete}>
                    DELETE
                  </div>
                </div>
              ) : (
                <div className="button-err-holder">
                  <Button
                    className="post"
                    color={"black"}
                    type={"submit"}
                    name={"POST"}
                  />
              {errors && <Errors errors={errors} />}
                </div>
              )}
            </form>
          </>
        )}
      </div>
    </>
  );
}

export default ReviewForm;
