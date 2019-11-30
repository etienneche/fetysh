window.addEventListener("scroll", function(event) {
  event.preventDefault();
  var top = this.scrollY;
  //console.log(top);
  var sLink = document.getElementsByClassName("sticky-bar")[0];
  if(top > 200){
   sLink.classList.add("highlight");
 }
 else{
  sLink.classList.remove('highlight');
}
}, false);
