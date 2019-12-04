import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery';

const initStarRating = () => {
  $('#rating-stars').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
