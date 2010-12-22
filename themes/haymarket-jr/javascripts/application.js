// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
	$("a.print_page").click( function() {
		$("#food_menu").printElement({
			pageTitle: 'Haymarket Brewery'
		});
		
		return(false);
	});
	$("a.print_beer_menu").click( function() {
		$(".beer_menu").printElement({
			pageTitle: 'Haymarket Brewery'
		})
		
		return(false);
	})
});