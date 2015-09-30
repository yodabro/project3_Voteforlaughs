// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require materialize-sprockets
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $(".button-collapse").sideNav();
  // GOOGLE MAPS STUFF HERE
  var input = document.getElementById('event_location');
  var input1 = document.getElementById('city_location');
  var options = {
    types: ['(cities)'],
    componentRestrictions: {country: 'US'}
  };
  autocomplete = new google.maps.places.Autocomplete(input, options);
  autocomplete = new google.maps.places.Autocomplete(input1, options);

  // This gives function to the lever allowing the user to decide if they will log into the user table or comedian table.
  $("#check_user + .lever").click( function(){
   if( $("#check_user").is(':checked') ){
      $('#un').attr('name', 'user[username]').attr('placeholder', 'Logging in as User');
      $('#pw').attr('name', 'user[password]');

    } else {
      $('#un').attr('name', 'comedian[username]').attr('placeholder', 'Logging in as Comedian');
      $('#pw').attr('name', 'comedian[password]');
    }
  });

  $('#user_check').click( function (){
    $('#un').attr('name', 'user[username]').attr('placeholder', 'Logging in as User');
    $('#pw').attr('name', 'user[password]');
  });

  $('#comedian_check').click( function (){
    $('#un').attr('name', 'comedian[username]').attr('placeholder', 'Logging in as Comedian');
    $('#pw').attr('name', 'comedian[password]');
  });

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

  $('.modal-trigger').leanModal({
      dismissible: true, // Modal can be dismissed by clicking outside of the modal
      opacity: .5, // Opacity of modal background
      in_duration: 300, // Transition in duration
      out_duration: 200, // Transition out duration
    }
  );

   $(document).on("click",".vote",function(){
     var form = $(this).closest("form");
     form.submit();
   });

  $('.parallax').parallax();
  $('.collapsible').collapsible();
  $(".dropdown-button").dropdown();

  $('#event_time').timepicker({ 'scrollDefault': 'now' });



  // var images = ['schumer', 'tosh', 'glover', 'burress', 'penn', 'colbert'];
  // var image = images[Math.floor(Math.random() * images.length)];
  // $('#headline').addClass(image);
});
