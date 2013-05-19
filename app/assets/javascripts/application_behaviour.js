$(document).ready(function() {

	/* Animations to fade out and in again new content when ready. */
	$('.main-menu-link').each(function() {
        $(this).click(function(event) {

			event.preventDefault();

			var link = $(this).attr('href');
			var link_url = $(this).attr('href') + ".js"; // So rails interprets this as Ajax.
			$('#content').animate({opacity: 0.0}, 200,  
				function() {
    				// Animation complete.   

					$.ajax({
						url: link_url,
						beforeSend: function ( xhr ) {
    						$('.loading-hud').css('display', 'block');
    						$('#content-area').removeClass('content-area-not-loading');
    						$('#content-area').addClass('content-area-loading');
  						}
					}).done(function ( data ) {	
						history.pushState(null, "", link);
						$('#content-area').removeClass('content-area-loading');
    					$('#content-area').addClass('content-area-not-loading'); 
						$('.loading-hud').css('display', 'none');
						$('#content').animate({opacity: 1.0}, 400);
					});
				});
	     });
	 });
});