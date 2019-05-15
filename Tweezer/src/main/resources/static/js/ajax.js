$(document).ready(function() {
	$(".view-home-replies").click(function(e) {
		e.preventDefault();
		var url = $(this).attr("href");
		$.get(url, function(data) {
			console.log(data);
			
			var html = "<a href='#' class='hide-home-replies'>Hide replies</a><div style='padding: 15px'>";
			
			for (var i=0; i < data.length; i++){
				html += `<div><a href="/users/${data[i][1]}">${data[i][2]} ${data[i][3]}</a> replied: ${data[i][5]}</div>`;
			}
			
			html += "</div>";
			
			$('.show-home-replies').show();
			$('.show-home-replies').html(html);
			$('.view-home-replies').hide();
		})
	})
	
	$(document).on('click', '.hide-home-replies', e => {
		e.preventDefault();
		$('.show-home-replies').hide();
		$('.view-home-replies').show();
		
	})

})