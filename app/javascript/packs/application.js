import "bootstrap";

require("trix")
require("@rails/actiontext")

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';


const eventsindex = document.getElementsByClassName('.events-index')

if (eventsindex){
  initMapbox();
}

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




