$(document).on('ready', function() {
  if ($('body.journal_entries').length) {
    
    $('.date-picker input[type="submit"]').hide();
    $('.date-picker').on('change', function() {
      $(this).submit();
    });

    window.onbeforeunload = function() {
      return "You have unsaved changes!";
    };

  }
});