import "bootstrap";

// Star rating
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

require("trix")
require("@rails/actiontext")
// NAVBAR DROPDOWN

import { myFunction } from '../plugins/navbar_dropdown';

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();


window.addEventListener("scroll", function(event) {
  event.preventDefault();
  var top = this.scrollY;
  console.log("hello");
  var sLink = document.getElementsByClassName("sticky-bar")[0];
  if (!sLink) {
    return;
  }
  if(top > 200){
   sLink.classList.add("highlight");
 }
 else{
  sLink.classList.remove('highlight');
}
}, false);

// ELEVATOR //
import { Elevator } from '../plugins/elevator';
window.onload = function() {
  var elevator = new Elevator({
    mainAudio: 'https://freesound.org/people/chriskt715/sounds/399877/download/399877__chriskt715__sensationbaby.wav',
    endAudio: 'http://tholman.com/elevator.js/music/ding.mp3',
    duration: 5700,
    element: document.querySelector('.elevator-button')
    });

  const scrollTop = document.getElementById("scroll-to-top-button");
  if (scrollTop) {
    scrollTop.addEventListener("click", event => {
      event.preventDefault();
      elevator.elevate();
    });
  }
}

// Date picker
import "../plugins/flatpickr"




// const useredit = document.getElementsByClassName('.registrations-edit')

// if (useredit){
//   const tab1 = document.getElementById("link1")
//   const tab2 = document.getElementById("link2")
//   tab1.addEventListener('click', () => {
//     document.getElementById("try").style.display = "none"
//     document.getElementById("loved").style.display = "block"
//   })

//   tab2.addEventListener('click', () => {
// // evento de clicar Want to Try - id = test2
// document.getElementById("loved").style.display = "none"
// document.getElementById("try").style.display = "block"
// })
// }

// const articleshow = document.getElementsByClassName('.articles-show')

// if (articleshow) {
//   console.log("Hey there")
//   var button = document.getElementById("coracao")
//   count = 0;
//   button.onclick = function() {
//     count += 1;
//   }

//   var button2 = document.getElementById("marca")
//   count = 0;
//   button2.onclick = function() {
//     count += 1;
//   }

//   var button3 = document.getElementById("salva")
//   count = 0;
//   button2.onclick = function() {
//     count += 1;
//   }
// };




