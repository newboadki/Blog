$(document).ready(function() {

	/* Animations to fade out and in again new content when ready. */
	$('.main-menu-link').each(function() {
        $(this).click(function(event) {

			event.preventDefault();

			var link = $(this).attr('href');
			var link_url = $(this).attr('href') + ".js"; // So rails interprets this as Ajax.
			$('.section_title h2').animate({opacity: 0.0}, 200,  
				function() {
					// Completion block
					$('.section_title h2').html("Loading...");
					$('.section_title h2').animate({opacity: 1.0}, 200);
					$('.section_title').addClass('is-loading');
			});
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
						$('.section_title').removeClass('is-loading');
					});
				});
	     });
	 });
});



/* Alternative for using link_to remote => true to trigger ajax. Downside we lose the capability to control animations
as this happens in the beforeSend, but the animation itself runs in another thread, therefore the actual ajax request is sent 
while the animation is in progress. therefore, when you start your animation in success, these two animations could be
potentially overlapping.

$(document).ready(function() {
	$('.main-menu-link').bind("ajax:beforeSend", function(evt, xhr, settings) {		
		$('#content').css('opacity', 0.0);
		$('.loading-hud').css('display', 'block');
		$('#content-area').removeClass('content-area-not-loading');
		$('#content-area').addClass('content-area-loading');		
	 });

	$('.main-menu-link').bind("ajax:success", function(evt, xhr, settings) {				
		var link = $(this).attr('href');
		history.pushState(null, "", link);
		$('#content-area').removeClass('content-area-loading');
		$('#content-area').addClass('content-area-not-loading'); 
		$('.loading-hud').css('display', 'none');
		$('#content').animate({opacity: 1.0}, 800);
	 });	
});*/
