
import './reviewshow.css'
import { useEffect, useState } from "react";
import { deleteReview, getReview } from '../../../store/reviews';
import Star from '../../Star';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from "react-redux";
import { useRef } from 'react'

function ReviewShow({reviewId}) {

  const review = useRef()
const storeReview = useSelector(getReview(reviewId));
review.current = storeReview
  const currentUser = useSelector((state) => state.session.user);
  const dispatch = useDispatch();
const {itemId} = useParams
useEffect(()=>{

  review.current = storeReview

},[reviewId,storeReview,currentUser,itemId])

if(!review.current) return null;
  return (
    <div className="review-show-container">
      <div>
        <div className="r-b-holder">
          <div>
            <span>{review.current.name || "Anonymous"}</span>{" "}
            {review.current.userId && <span>Verfied Buyer</span>}
          </div>
       
        </div>
        <div className="stars-container">
          {[1, 2, 3, 4, 5].map((i) => {
            if (i <= review.current.rating) {
              return <Star key={i} filled={true} />;
            } else {
              return <Star key={i} filled={false} />;
            }
          })}
        </div>
        <h2>{review.current.title}</h2>
        <p>{review.current.content}</p>
       
      </div>
    </div>
  );
}

export default ReviewShow