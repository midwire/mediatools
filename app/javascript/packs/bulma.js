// Load the burger menu and custom JS for Bulma

// $(document).ready(function() {
//   // Check for click events on the navbar burger icon
//   $(".navbar-burger").click(function() {
//
//       // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
//       $(".navbar-burger").toggleClass("is-active");
//       $(".navbar-menu").toggleClass("is-active");
//
//   });
// });

document.addEventListener("turbolinks:load", function() {
  // alert("Bulma Loaded");
  // console.log("bulma.js loading")

  var burger = document.querySelector('.navbar-burger');
  var menu = document.querySelector('.navbar-menu');

  if (burger !== null) {
    burger.addEventListener('click', function() {
        burger.classList.toggle('is-active');
        menu.classList.toggle('is-active');
    });
  }

});
