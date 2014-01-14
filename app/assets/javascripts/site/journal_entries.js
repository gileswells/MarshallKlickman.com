$(document).on('ready', function() {
  if ($('body.journal_entries').length) {
    
    $('.date-picker input[type="submit"]').hide();
    $('.date-picker').on('change', function() {
      $(this).submit();
    });
  }
});



// Prevent loss of unsaved form data
//------------------------------------------------------------------------------------------------//

var formHasChanged = false;
var submitted = false;

$(document).on('change keyup', 'form input, form select, form textarea', function (e) {
    formHasChanged = true;
});

$(document).ready(function () {
  
  window.onbeforeunload = function (e) {
    if (formHasChanged && !submitted) {
      var message = "You have not saved your changes.", e = e || window.event;
      if (e) {
        e.returnValue = message;
      }
      return message;
    }
  }
  
  $("form").submit(function() {
    submitted = true;
  });

});