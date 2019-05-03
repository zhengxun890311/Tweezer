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
	
//	$('.view-replies').click(function(){
//		$(this).hide();
//		$('.hide-replies').show();
//		$('.reply-box').slideDown("slow");
//	})
	
	$('.hide-replies').click(function(){
		$(this).hide();
		$('.view-replies').show();
		$('.reply-box').slideUp("fast");
	})
	
	$('.view-replies').click(function(){
		var tweetId = $(this).attr('data-tweet');
		$(this).hide();
		console.log("toast")
		
		console.log($(this).parent().parent().parent().siblings());
		
		var replyBoxes = $(this).parent().parent().parent().siblings();
		
//		replyBoxes.slideDown("fast");
		$('.hide-replies').show();
		$('.reply-box').slideDown("fast");
	})
});