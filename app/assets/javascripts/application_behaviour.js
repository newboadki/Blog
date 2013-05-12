$(document).ready(function() {

	/* Animations to fade out and in again new content when ready. */
	$('.main-menu-link').each(function() {
        $(this).click(function(event) {

			event.preventDefault();

			var link_url = $(this).attr('href') + ".js"; // So rails interprets this as Ajax.
			$('#content').animate({opacity: 0.25}, 400,  
				function() {
    				// Animation complete.    				
					$.ajax({
						url: link_url,
					}).done(function ( data ) {							
						$('#content').animate({opacity: 1.0}, 400);						
					});
				});
	     });
	 });
}); 


/*$(document).ready(function() {
  function filterPath(string) {
  return string
    .replace(/^\//,'')
    .replace(/(index|default).[a-zA-Z]{3,4}$/,'')
    .replace(/\/$/,'');
  }
  var locationPath = filterPath(location.pathname);
  var scrollElem = scrollableElement('html', 'body');
 
  $('a[href*=#]').each(function() {
    var thisPath = filterPath(this.pathname) || locationPath;
    if (  locationPath == thisPath
    && (location.hostname == this.hostname || !this.hostname)
    && this.hash.replace(/#/,'') ) {
      var $target = $(this.hash), target = this.hash;
      if (target) {
        var targetOffset = $target.offset().top;
        $(this).click(function(event) {
          event.preventDefault();
          $(scrollElem).animate({scrollTop: targetOffset}, 400, function() {
            location.hash = target;
          });
        });
      }
    }
  });
 
  // use the first element that is "scrollable"
  function scrollableElement(els) {
    for (var i = 0, argLength = arguments.length; i <argLength; i++) {
      var el = arguments[i],
          $scrollElement = $(el);
      if ($scrollElement.scrollTop()> 0) {
        return el;
      } else {
        $scrollElement.scrollTop(1);
        var isScrollable = $scrollElement.scrollTop()> 0;
        $scrollElement.scrollTop(0);
        if (isScrollable) {
          return el;
        }
      }
    }
    return [];
  }
 
});

function ringTheBell() {
	smoothScrollTo(document.getElementById('main-menu').offsetTop);
}
*/


