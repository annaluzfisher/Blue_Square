import './footer.css'
import Logo from '../../Buttons/Logo'
import Ridgeline from '../Ridgeline';
import {Link} from 'react-router-dom'

function Footer() {
  return (
    <>
      <Ridgeline />
      <Logo color={"white"} />
      <div className="footer-container">
        <div className="footer-spacer"></div>
        <div className='text'>
          <p>
            This webiste was inspired by{" "}
            <a href="https://www.blackdiamondequipment.com/en_US/">
              www.blackdiamondequipment.com.
            </a>
          </p>
          <p>
            The gear they sell and the sports the support are a huge part of my
            life. As a developer, I couldn't think of a better website to
            replicate to showcase my skills. This project was made with Rails
            and React/Redux. This is my sandbox for exploring new technologies
            so look out for new features as time passes. All cover images are of
            me and my friends playing oustisde and being human.
          </p>
        </div>

        <div className="links-box" id='links-box'>
          <a href="https://github.com/annaluzfisher">
            <i className="fa-brands fa-github-alt"></i>
          </a>
          <a href="https://www.linkedin.com/in/anna-luz-fisher-599862245/">
            <i className="fa-brands fa-linkedin"></i>
          </a>
          <a href="https://www.instagram.com/weliketoexplore/">
            <i className="fa-brands fa-instagram"></i>
          </a>
        </div>
      </div>
    </>
  );
}

export default Footer