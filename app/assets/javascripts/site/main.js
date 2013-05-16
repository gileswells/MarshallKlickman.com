(function($) {
    $('html').addClass('js');

    // Hide dat address bar
    setTimeout(function(){ window.scrollTo(0, 1); }, 0);

    var setPageContentOffset = function() {
      var headerHeight = $('header').outerHeight();

      $('.page-content').css('margin-top', headerHeight);
    }

    var addScrollingShadow = function() {
      var paddingTrigger = parseInt($('.page-content').css('padding-top'), 10);

      if ($(window).scrollTop() >= paddingTrigger) {
        $('header').addClass('has-shadow');
      } else {
        $('header.has-shadow').removeClass('has-shadow');
      }
    }

    // Call functions on page load
    setPageContentOffset();
    addScrollingShadow();

    // Bind functions to specific events
    $(window).on('resize', setPageContentOffset);
    $(window).on('scroll', addScrollingShadow);
    $(window).on('touchmove', addScrollingShadow);

})(jQuery);