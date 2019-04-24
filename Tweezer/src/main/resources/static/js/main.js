$(document).ready(function() {
	
	$('.heart').click(function(){
		$(this).addClass("redheart animation");
	});
	
	$('.register-btn').click(function(){
		$(this).hide();
		$('#register-form').slideDown("slow");
	})
	
	$('.reply-button').click(function() {
		var userId = $(this).attr('data-user');
		var tweetId = $(this).attr('data-tweet');
		
		$("#modal-userId").val(userId);
		$("#modal-tweetId").val(tweetId);
	})
});