function setClearTheme() {
	setColoredThemeForElement($('#header'));
	setColoredThemeForElement($('.header-column'));
	setColoredThemeForElement($('.horizontal_menu'));
	setClearThemeForElement($('.section-title'));
	setClearThemeForElement($('#content-area'));
	setClearThemeForElement($('.footer'));
}

function setColoredTheme() {
	setClearThemeForElement($('#header'));
	setClearThemeForElement($('.header-column'));
	setClearThemeForElement($('.horizontal_menu'));
	setColoredThemeForElement($('.section-title'));
	setColoredThemeForElement($('#content-area'));
	setColoredThemeForElement($('.footer'));
}

function setClearThemeForElement(element) {
		element.removeClass("with-colored-background");
		element.addClass("with-clear-background");
}

function setColoredThemeForElement(element) {
	element.removeClass("with-clear-background");
	element.addClass("with-colored-background");
}


$(document).ready(function() {
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

							// Add callback handlers for articles links, they did not have handlers
							// attached when document loaded most likely, unless user loaded that page using the URL.

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
