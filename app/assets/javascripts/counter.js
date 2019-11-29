
var button = document.getElementById("clickme"),
  count = 0;
button.onclick = function() {
  count += 1;
  button.innerHTML = "Love article " + count + "&#9829;";
};


var button2 = document.getElementById("clickme2"),
  count = 0;
button2.onclick = function() {
  count += 1;
  button2.innerHTML = "Want to try " + count + "&#9829;";
};
