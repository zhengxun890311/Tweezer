<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tweezer</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/homeStyle.css">

</head>
<body>
	<div class="container top-part"
		style="background-color: white; min-width: 100%;">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light ">
				<a class="navbar-brand home" href="#"><i class="fas fa-home"></i>
					Home</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="/moments"><i
								class="fas fa-bolt"></i> Moments <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-bell"></i> Notifications</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-envelope"></i> Messages</a></li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="margin-left: 95px;"><img id="tweezer-logo"
								src="images/tweezer.png"></a></li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2 searchbar" type="search"
							placeholder="Search Tweezer" aria-label="Search"> <i
							class="fas fa-user" style="margin-right: 10px;"></i>
						<a href="/logout" class="btn btn-danger my-2 my-sm-0 tweez-btn">Log Out</a>
					</form>
				</div>
			</nav>
		</div>
	</div>
	
	<div class="container">
		<div class="row justify-content-space-between">
			<div class="col-3 user-profile">
				<div id="profile_div" style="background-color: white">
					<div id="div2" class="profile_pic">
						
						
						<a href="/editprofile">
							<img id="profile_div_img" src="${user.userPhotoPath}" alt="my_pic"
								class="me rounded-circle img-fluid shadow-sm p-1 mb-5 bg-white rounded">
						</a>
						<div id="profile_div_name">
							<h6><c:out value="${user.firstName}"/></h6>
						</div>
						<div id="profile_div_id">
							<a style="text-decoration: none; color:grey;" href="/users/${user.id}"><font size="2">@<c:out value="${user.username}"/></font></a>
						</div>
						
						<div id="profile_div_tweets">
							<a style="text-decoration: none;" href="/users/${user.id}">
								<div style="color:#657786">Tweezes</div>
								<div>${fn:length(user.tweets)}</div>
							</a>
						</div>
						<div id="profile_div_following">
							<a style="text-decoration: none;" href="#">
								<div style="color:#657786">Following</div>
								<div>${fn:length(user.userFollowing)}</div>
							</a>
						</div>
					</div>
				</div>
				
<!-- 		This is the section for 'Trends'	 -->	

				<div id="trend_div" style="background-color: white;padding:10px;">
					<h3><span class="black-text">Trends for you</span></h3>
					
					<c:forEach items="${trends.response.results}" var='t' begin="1">
					<a href="${t.webUrl}"><c:out value="${t.webTitle}"/></a> | 
					</c:forEach>
				</div>
				
			
			<div class="col-6 tweet-feed">
				<!-- Main content -->
				<form:form action="/createTweet" method="post" enctype="multipart/form-data"
					modelAttribute="tweetObj">
					<input type="hidden" name="user" path="user" value="${user.id}">
					<div style="text-align: right;">
						<input type="file" name="myfile" path="video_path" id="myfile"class="hidden photo-upload" style="display: none;"src="${tweetObj.video_path}"/>
						<label for="myfile" class="photo-upload"><h3><i class="far fa-image"></i></h3></label>					
					</div>
					
						<form:textarea style="max-height:200px;" id="tweetText" class="form-control" path="text" placeholder="What's the Tweez?"/>
					
<!-- 					<input id="success_btn" class="btn btn-success" type="submit" placeholder="What's happening"
						value="Tweet" /> -->
					<div style="text-align: right; margin-top: 5px; margin-bottom: 5px;">
						<button id="success_btn" class="btn btn-primary my-2 my-sm-0 tweez-btn" type="submit">Tweez</button>
					</div>
						
				</form:form>
				<div id="tweet_div_content" class="row tweet-title" style:"margin-left:0px;margin-right:0px">
					<p class="col-2">Tweezes</p>
					<p class="col-9">
						<a href="#">Tweezes & replies</a>
					</p>
				</div>
					
   	 		<!-- PLACEHOLDER TEXT BELOW -->
   	 				
    		<c:forEach items="${followingTweets}" var="t">
   	    		<div class="row tweet" style="margin-left:0px;margin-right: 0px;">
   	    			<c:if test="${empty t[1] != true}">
    					<img src="${t[1]}" alt="user.photo" class="col-2 small-pic rounded-circle p-2 img-fluid  bg-white rounded">
    				</c:if>
    				<div class="col-8">
	    				
    					<fmt:formatDate value="${t[6]}" pattern="MMMM dd, yyyy hh:mmaa" var="formattedDateTweet"/>
	    				<p class="tweet-user-info"><a href="/users/${t[0]}"><c:out value="${t[2]} ${t[3]} @${t[4]}"/></a> • Posted: <c:out value="${formattedDateTweet}"/></p>
    			
	    				
	    				
	    				<p class="tweet-text">${t[5]}</p>
	    				
 						<c:if test ="${empty t[7]!= true }">
							<a href="${t[7]}"><img src="${t[7]}" class="tweet-photo"></a>
						</c:if>
	    				
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
					    			<div class="modal-header">
						      			<h5 class="modal-title" id="exampleModalCenterTitle">Reply to <c:out value="${user.username}"/>'s Tweez</h5>
							  			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    		<span aria-hidden="true">&times;</span></button>
									</div>
								    <div class="modal-body">				
			   						 <form:form method="post" action="/userReply" modelAttribute="replyObj">
			    						<input id="modal-tweetId" type="hidden" name="tweet"/>
			    						<input id="modal-userId" type="hidden" name="user"/>
			    						<form:input path="text" class="form-control"/>
								    </div>
								    <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
								        <input type="submit" class="btn btn-success tweez-btn" value="Reply">
									</form:form>
							        </div>
								</div>
							</div>
						</div>
	    				<div class="row tweet-icons">
	    	<!-- post reply -->
		    		<!-- Button trigger modal -->
						<button type="button" class="btn reply-icon reply-button" data-toggle="modal" data-target="#exampleModalCenter" data-user="${loggedUser.id}" data-tweet="${tweet.id}">
						  <i class="col-2 far fa-comment" style="padding:0;"></i>
						</button>
	    	<!-- like a tweet -->
	    				<span class="heart" style="padding-top: 7px;"><i class="col-2 far fa-heart" style="padding-left:10px;"></i></span>
    					</div>
    					<div class="row" style="display:absolute;">
	    					<div class="container">
		    					<div class="row" style="margin-left: 1px;">
		    						<div class="" style="display:inline-block;">
			    						<span class="badge badge-light">"{fn:length(t[replies])}"</span>
		    						</div>
	  							    <div class="" style="margin-left: 19px; display:inline-block;">
			    						<%-- <span class="badge badge-light">${fn:length(tweet.replies)}</span> --%>
		    						</div>
		    					</div>
	    					</div>
    					</div>
    				</div>
    			</div>
   			</c:forEach>
			</div>
			
<!-- 	This is the section for 'who to follow' -->
			<div class="col-3 user-profile">
				<h3>Who to Follow</h3>
				<c:forEach items="${whoToFollow}" var="u" begin="0" end="2">
				<div class="row" style="height: 80px; margin-bottom: 30px; margin-left: 2px;">
					<!-- <div class="col-3"> -->
		 				<c:if test="${empty u[1] != true}">
		    				<img src="${u[4]}" alt="user.photo" class="usericon col-3 rounded-circle p-1 img-fluid  bg-white rounded" style= "max-height: 200px;">
		    			</c:if>
					<!-- </div> -->
					<div class="col-8">
		    			<a href="/users/${u[0]}"><c:out value="${u[1]} ${u[2]}"/></a>
		    			<p style="margin-bottom: 0;"><a href="/users/${u[0]}"><c:out value="@${u[3]}"/></a></p>
		    			<form:form method="POST" action="/whoToFollow" modelAttribute="followUserObj">
				   			<input type="hidden" name="id" value="${u[0]}">
			 				<input type="submit" value="follow" class="btn btn-outline-info">
				    	</form:form>
					</div>
				</div>
				</c:forEach>
    				
				
			</div>
		</div>
	</div>
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#success_btn").hide();
			$("#iframe").hide();
			$("#player").hide();
			$("#myfile").hide();
			
			$("#tweetText").on('focus',function(){
				$("#success_btn").show();
 				/* $("#iframe").show(); */
				/* $("#myfile").show(); */
			});
		})
		
		
		$("#myfile").change(function(){
			$("#player").show();
			var url = createURL(this.files[0]);
			if(url){
				$("#iframe").attr("src",url);
			}
		})
		function createURL(file){
			var url=null;
			if(window.createObjectURL!=undefined){
				url=window.createObjectURL(file);
			}
			else if(window.URL!=undefined){
				url=window.URL.createObjectURL(file);
			}
			else if(window.webkitURL!=undefined){
				url=window.webkitURL.createObjectURL(file);
			}
			
			return url;
		}
		
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/main.js"></script>
</body>
</html>