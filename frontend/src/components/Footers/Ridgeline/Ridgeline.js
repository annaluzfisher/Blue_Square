import "./ridgeline.css";

function Ridgeline() {


const observer = new IntersectionObserver((entries) => {
 entries.forEach((entry) => {
   if (entry.isIntersecting) {
        entry.target.classList.add('reveal-animation');

   }
 });
});




  return (
    <div className="ridgeline-container">
      <div className="image-container">
        <img src="/BannerImages/ridgeline.png" />
        <div className="image-cover" ></div>
      </div>
      { (document?.querySelectorAll("image-cover").length > 0 ) && observer?.observe(document?.querySelectorAll("image-cover"))}
    </div>
  );
}

export default Ridgeline;
