function applyWhiteTheme() {
	$('.section-title').removeClass("black-theme");
	$('.section-title').addClass("white-theme");
	$('#content-area').removeClass("black-theme");
	$('#content-area').addClass("white-theme");
	$('#header').removeClass("black-theme");
	$('#header').addClass("white-theme");	
}

function applyBlackTheme() {
	$('.section-title').removeClass("white-theme");
	$('.section-title').addClass("black-theme");
	$('#content-area').removeClass("white-theme");
	$('#content-area').addClass("black-theme");
	$('#header').removeClass("white-theme");
	$('#header').addClass("black-theme");
}


$(document).ready(function() {


	var home = document.querySelector('.home');
	home.classList.remove('hidden');

	var apps = document.querySelector('.apps');
	apps.classList.remove('hidden');

	var blog = document.querySelector('.blog');
	blog.classList.remove('hidden');

	/* Animations to fade out and in again new content when ready. */
	$('.main-menu-link').each(function() {
		var linkElement = $(this);
        $(this).click(function(event) {

			event.preventDefault();
			
			var link = $(this).attr('href');
			var link_url = $(this).attr('href') + ".js"; // So rails interprets this as Ajax.
			
			// Fade out the section title
			$('.section-title h2').animate({opacity: 0.0}, 200,  
				function() {
					// Change text to Loading and animate it back 
					$('.section-title h2').html("Loading...");
					$('.section-title h2').animate({opacity: 1.0}, 200);
					$('.section-title').addClass('is-loading');
			});
			
			// Fade out the content
			$('#content').animate({opacity: 0.0}, 200,  
				function() {
    				// Make ajax request when complete
					$.ajax({
						url: link_url,
						beforeSend: function ( xhr ) {							
    						$('.loading-hud').css('display', 'block');
  						}
					}).done(function ( data ) {	
						
						// Choose theme
						if (linkElement.hasClass("apply-black-theme")) {
							applyBlackTheme();
						} else if (linkElement.hasClass("apply-white-theme")) {
							applyWhiteTheme();
						}
						
						// Show the content back						
						history.pushState(null, "", link);
						$('.loading-hud').css('display', 'none');						
						$('#content').animate({opacity: 1.0}, 400);
						$('.section-title').removeClass('is-loading');
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
