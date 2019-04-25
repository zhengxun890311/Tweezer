<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tweezer</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<!-- {fn:length(course.users)} -->
	<div class="container" style="background-color: white; min-width: 100%;">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light ">
			  <a class="navbar-brand home" href="/home"><i class="fas fa-home"></i> Home</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="/news"><i class="fas fa-bolt"></i> News <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/notifications"><i class="fas fa-bell"></i> Notifications</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/messages"><i class="fas fa-envelope"></i> Messages</a>
			      </li>
		  	      <li class="nav-item">
			        	<a class="nav-link" href="/home" style="margin-left: 95px;"><img id="tweezer-logo"src="/images/tweezer.png"></a>	        
			      </li>
			    </ul>
			    <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2 searchbar" type="search" placeholder="Search Tweezer" aria-label="Search">
			      	<a href="/editprofile"><i class="fas fa-user" style="margin-right: 10px;"></i></a>
			      <a href="/logout" class="btn btn-danger my-2 my-sm-0 tweez-btn">Log Out</a>
			    </form>
			  </div>
			</nav>
		</div>
	</div>
<!-- Top of profile and profile picture -->
    <div class="container" style="background-color: rgb(79,61,103); min-width: 100%; height: 200px;">
    	<div class="container">
	        <div class="justify-content-center">
	            <div class="profile_pic">
	                <img src="/${user.userPhotoPath}" alt="my_pic" class="me img-fluid shadow-sm p-1 mb-5 bg-white rounded-circle rounded" style= "max-height: 200px; max-width: 200px;">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col bio">
	                <h1></h1> 
	            </div>
	        </div>
    	</div>
    </div>
    <div class="row shadow-sm p-2 mb-5 bg-white rounded whitebar" style=" height: 60px; min-width: 100%;">
    	<div class="container links-bar">
    		<div class="row" style="width: 300px;">
				<p class="col-3 followers"><button type="button" class="btn badge-pill">Tweezes <span class="badge badge-dark">${fn:length(user.tweets)}</span></button></p>
				<p class="col-3 followers"><button type="button" class="btn badge-pill">Following <span class="badge badge-dark">${fn:length(user.userFollowing)}</span></button></p>
 				<p class="col-3 followers"><button type="button" class="btn badge-pill">Followers <span class="badge badge-dark">${fn:length(user.followers)}</span></button></p>
				<!-- <p class="followers">Moments</p> -->   		
    		</div>
    	</div>
    </div> 
<!-- Main content -->
    <div class="container">
    	<div class="row justify-content-space-between">
    		<div class="col-3 user-profile">
    			<h3 class="profile-info"><a href="/home">${user.firstName} ${user.lastName}</a></h3>
    			<p class="profile-info"><span class="grey-text"><a href="/users/${user.id}">@${user.username}</a></span></p>
    			
    			<fmt:formatDate value="${user.createdAt}" pattern="MMMM dd, yyyy" var="formattedDate"/>
    			<p class="profile-info"><i class="far fa-calendar-alt"></i><span class="grey-text"> Joined ${formattedDate}</span></p>
    			
 <!--   follow button -->
 				<c:forEach items="${loggedUser.getUserFollowing()}" var ="f">
 					<c:if test="${f.id == user.id}">
 						<c:set var="alreadyFollowing" value="true"/>
 					</c:if>
 				</c:forEach>
 				
 				<c:choose>
 					<c:when test="${loggedUser.id == user.id}">
 						<p> </p>

 						<br/>
 					</c:when>
 					<c:when test="${alreadyFollowing == true}">
 						<c:set var="alreadyFollowing" value="false"/>
 						<form:form method="POST" action="/unfollowUser" modelAttribute="unfollowUserObj">
		    				<input type="hidden" name="id" value="${user.id}">
		    				<input type="submit" value="unfollow" class="btn btn-outline-info">
		    			</form:form>
 					</c:when>
 					<c:otherwise>
		    			<form:form method="POST" action="/followUser" modelAttribute="followUserObj">
		    				<input type="hidden" name="id" value="${user.id}">
		    				<input type="submit" value="follow" class="btn btn-outline-info">
		    			</form:form>
		    		</c:otherwise>
		    	</c:choose>	
	    		<div class="">
	    			<c:forEach items="${user.tweets}" var="tweet">
	    				<c:if test ="${empty tweet.photo_path != true }">
	    					<a href="#${tweet.id}"><img src="/${tweet.photo_path}" class="tinypic"/></a>
	   					</c:if>
	    			</c:forEach>
	    		</div>
    		</div>
    		<div class="col-9 tweet-feed">
    			<div class="row tweet-title">
    				<p class="col-2">Tweezes</p>
    				<p class="col-9"><a href="#">Tweezes & replies</a></p>    			
    			</div>
   <!-- This is where the for-loop will go for tweets  -->	
   
			<!-- Modal -->
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
    		<c:forEach items="${user.tweets}" var="tweet">
   	    		<div class="row tweet">
    				<img src="/${user.userPhotoPath}" alt="user.photo" class="col-2 small-pic rounded-circle p-2 img-fluid  bg-white rounded">
    				<div class="col-8">

    					<fmt:formatDate value="${tweet.createdAt}" pattern="MMMM dd, yyyy hh:mmaa" var="formattedDateTweet"/>
	    				<p class="tweet-user-info"><a href="/users/${user.id}"><c:out value="${user.firstName} ${user.lastName} @${user.username}"/></a> • Posted: <c:out value="${formattedDateTweet}"/></p>
	    				<p class="tweet-text">${tweet.text}</p>
			 			<c:if test ="${empty tweet.photo_path != true }">
	    					<a href="/${tweet.photo_path}"><img src="/${tweet.photo_path}" class="tweet-photo" id="${tweet.id}"></a>
    					</c:if>
	    				<div class="row tweet-icons">
 		<!-- post reply -->
				<!-- Button trigger modal -->
							<button type="button" style="padding: 0; margin-left: 10px; margin-right: 30px;" class="btn reply-icon reply-button" data-toggle="modal" data-target="#exampleModalCenter" data-user="${loggedUser.id}" data-tweet="${tweet.id}">
								<span class="badge badge-light" style="width: 15px; padding: 0;"><i class="col-2 far fa-comment" style="padding:0; font-size: 1.5em;"> ${fn:length(tweet.replies)}</i></span>
							</button>
		    	<!-- like a tweet -->
	    					<form:form action="/like" method="post" modelAttribute="likeObj">
		    				
	    						<form:input type="hidden" path="tweet" value="${tweet.id}"/>
	    						<form:input type="hidden" path="user" value="${loggedUser.id}"/>
	<!--     						<input type="submit" value="like"> -->
			    				<button type="submit" style="border:0; padding:0px;"><span class="heart badge badge-light" style="width: 15px; padding: 0;"><i class="col-2 far fa-heart" style="padding:0; font-size: 1.5em;"> ${fn:length(tweet.likes)}</i></span></button> 
		    				
	    					</form:form>
    					</div>
    					<div class="row" style="display:absolute;">
	    					<div class="container">
		    					<div class="row" style="margin-left: 1px;">
		    						<div class="" style="display:inline-block;">
			    						<%-- <span class="badge badge-light">${fn:length(tweet.replies)}</span> --%>
			    						<%-- <span class="badge badge-light">${fn:length(tweet.likes)}</span> --%>
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
    	<!-- End of the for loops for tweets -->
    		</div>
    	</div>
    </div>
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
</body>
</html>