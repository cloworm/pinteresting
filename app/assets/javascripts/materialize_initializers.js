var ready = function() {
  $(".button-collapse").sideNav();

  $('.dropdown-button').dropdown({
    inDuration: 300,
    outDuration: 225,
    constrain_width: false, // Does not change width of dropdown to that of the activator
    hover: false, // Activate on hover
    gutter: 0, // Spacing from edge
    belowOrigin: true, // Displays dropdown below the button
    alignment: 'left' // Displays dropdown with edge aligned to the left of button
  });

  $('.collapsible').collapsible({
    accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
  });

  $('.tooltipped').tooltip({delay: 50});

  $('select').material_select();
};

$(document).ready(ready);

// Using document.ready with turbo-links http://stackoverflow.com/a/18770589
// $(document).on('page:load', ready); // jquery.turbolinks handles for us.

