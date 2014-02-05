/* ***** HELPERS *************************************** */

function rowClassOfElement(element)  {	
	if((element == null) || (element.length == 0)) {
		return;
	}

	var classList = element.attr('class').split(/\s+/);
	var result = null;

	$.each( classList, function(index, classItem) {
		var regex = /row-[0-9]+/;
	
	    if (classItem.match(regex)) {
	    	result = classItem;
	    }
	});

	return result;	
}

function arrowXOffsetOfSelectedAppLink(row) {
	var icon = $(".app-link-highlighted");
	var arrow = $(".arrow-up" + "." + row);
	var iconWidth = icon.width();
	var arrowWidth = arrow.width();
	var iconXOffset = icon.position().left;
	var arrowLeftOffset = iconXOffset + (iconWidth / 2.0) - (arrowWidth / 2.0);

	return arrowLeftOffset;
}

function descriptionForApp(app) {
	// app is a <a></a> element. Contains the link to an app. 	
	// Given an app we need to construct a dash-separated string with the name of the image
	var imageElement = app.find('img'); // Name of the image for getting the desc from the DOM archive to avoid retrieving it from the server
	var imageName = imageElement.attr('src');	

	/* !! This works in production not in development, because in production images have this structure <name>-<weirdNumber>.png */
	var components_separated_by_slash = imageName.split("/");
	var lastComponent_separated_by_slash = components_separated_by_slash[components_separated_by_slash.length - 1];

	var components_separated_by_dash = lastComponent_separated_by_slash.split("-");
	var firstComponent_separated_by_dash = components_separated_by_dash[0];	
	var imageId = firstComponent_separated_by_dash;

	/* For Debugging; replace the above lines for the below equivalent
	var components_separated_by_dot = lastComponent_separated_by_slash.split(".");
	var firstComponent_separated_by_dot = components_separated_by_dot[0];
	var imageId = firstComponent_separated_by_dot;*/

	// Then we need to find the element inside the description archive with that string as the id	
	return $("#" + imageId).html();
}

function moveArrow(row) {	
	var arrow = $(".arrow-up");
	var selectedApp = $(".app-link-highlighted");
	var appDescription = descriptionForApp(selectedApp);	
	var appDescriptionPlaceHolder = $(".app-description-placeholder");
	arrow.animate( {left:arrowXOffsetOfSelectedAppLink(row)}, 400, function() {		
		appDescriptionPlaceHolder.html(appDescription);
	});

}

function openExpansionRow(expansionRow) {
	expansionRow.removeClass('app-description-row-hidden');
	expansionRow.addClass('app-description-row-visible');
	expansionRow.animate( {height:150}, 500, function() {
		var rowClass = rowClassOfElement(expansionRow);
		moveArrow(rowClass);
	});
}

function closeExpansionRow(expansionRow) {
	expansionRow.animate( {height:0}, 500, function(){
		expansionRow.removeClass('app-description-row-visible');
		expansionRow.addClass('app-description-row-hidden');
	});
}



function toogleExpansionRow(expansionRow) {
	if (expansionRow.hasClass('app-description-row-hidden')) {
		openExpansionRow(expansionRow);		
	} else {
		closeExpansionRow(expansionRow);
	}
}

function addExpandableRowBehaviourToAppLinks() {
	$('.app-link').each(function() {
		$(this).click(function(event) { // This is the rutine to expend/collapse the rows of applications.

			event.preventDefault();

			var currentlySelectedAppLink = $(".app-link-highlighted");
			var rowOfCurrentlySelectedLink = rowClassOfElement(currentlySelectedAppLink);
			var isCurrentLinkSelected = $(this).hasClass('app-link-highlighted');
			var rowClass = rowClassOfElement($(this));
			var currentLinkExpansionRow = $(".expansion-row" + "." + rowClass);

			if (isCurrentLinkSelected) {
				// We close its expansion row
				closeExpansionRow(currentLinkExpansionRow);

				// Remove the selected
				currentlySelectedAppLink.removeClass('app-link-highlighted');

			} else if (rowClass == rowOfCurrentlySelectedLink) { // if the clicked icon is in the same row as the currently selected one
				// Don't close the row

				// Remove the currently highlighted
				currentlySelectedAppLink.removeClass("app-link-highlighted");

				// Add the newly selected app link
				$(this).addClass("app-link-highlighted");

				// Move the arrow and populate description placeholder
				moveArrow(rowClass);

			} else { // If the clicked icon is in a different row than the currently selected one

				// // Remove the currently highlighted
				 currentlySelectedAppLink.removeClass("app-link-highlighted");

				// Add the newly selected app link
				$(this).addClass("app-link-highlighted");

				// Open and close expansion rows
				$('.expansion-row').each(function() {
					var currentRowClass = rowClassOfElement($(this));

					if (currentRowClass == rowClass) {
						toogleExpansionRow($(this));
					} else {				
						closeExpansionRow($(this));
					}
				});
			}
		});
	});
}