$(document).ready(function () {


	$("section#shirts").isotope();

	$("nav a").on("click", function () {

		var color = $(this).attr("id");

		$("section#shirts").isotope({filter: "div."+color });

		event.preventDefault();
	});

// End of on CLick

	$("h1 a").on("click", function() {
		$("section#shirts").isotope({filter: "*"});

		event.preventDefault();
	});
}); 
// End of doc ready






