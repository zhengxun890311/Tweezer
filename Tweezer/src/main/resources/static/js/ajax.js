$(document).ready(function() {
	$(".view-home-replies").click(function(e) {
		e.preventDefault();
		var url = $(this).attr("href");
		$.get(url, function(data) {
			console.log(data);
		})
	})
})