
var button = document.getElementById("coracao"),
  count = 0;

if (button) {
  button.onclick = function() {
    count += 1;
    // button.innerHTML = count ;
  };
}


var button2 = document.getElementById("marca"),
  count = 0;
if (button2) {
  button2.onclick = function() {
    count += 1;
    // button2.innerHTML = "Want to try: " + count;
  };
}

// var button3 = document.getElementById("salva"),
//   count = 0;
// button3.onclick = function() {
//   count += 1;
//   //button2.innerHTML = "Saved to read later: " + count;
// };
