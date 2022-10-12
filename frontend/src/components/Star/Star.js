import { FaStar } from "react-icons/fa";
import './star.css'
function Star({ filled, onClick }) {
  return <FaStar color={filled ? "#CD4C1D" : "lightgray"} onClick={onClick} />;
}

// export const Stars = ({num}) => {
//       {
//         [1, 2, 3, 4, 5].map((i) => {
//           if (i <= num ){
//             return <Star filled={true} />;
//           } else {
//             return <Star filled={false} />;
//           }
//         });
//       }
// }

export default Star;
