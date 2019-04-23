<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tweezer</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">

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
			        <a class="nav-link" href="/moments"><i class="fas fa-bolt"></i> Moments <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/notifications"><i class="fas fa-bell"></i> Notifications</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/messages"><i class="fas fa-envelope"></i> Messages</a>
			      </li>
		  	      <li class="nav-item">
			        	<a class="nav-link" href="#" style="margin-left: 95px;"><img id="tweezer-logo"src="images/tweezer.png"></a>	        
			      </li>
			    </ul>
			    <form class="form-inline my-2 my-lg-0">
			      <input class="form-control mr-sm-2 searchbar" type="search" placeholder="Search Tweezer" aria-label="Search">
			      <i class="fas fa-user" style="margin-right: 10px;"></i>
			      <button class="btn btn-primary my-2 my-sm-0 tweez-btn" type="submit"> Tweez</button>
			    </form>
			  </div>
			</nav>
		</div>
	</div>
<!-- Top of profile and profile picture -->
    <div class="container" style="background-color: rgb(0,164,237); min-width: 100%; height: 200px;">
    	<div class="container">
	        <div class="justify-content-center">
	            <div class="profile_pic">
	                <img src="images/me.jpg" alt="my_pic" class="me rounded-circle img-fluid shadow-sm p-1 mb-5 bg-white rounded">
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
				<p class="followers">Tweezes</p>
				<p class="followers">Following</p>
				<p class="followers">Lists</p>
				<p class="followers">Moments</p>    		
    		</div>
    		<div class="row">
<!--     		<p class="col">19</p>
				<p class="col">2</p>
				<p class="col">0</p>
				<p class="col">18</p>  -->
    		</div>
    	</div>
    </div> 
<!-- Main content -->
    <div class="container">
    	<div class="row justify-content-space-between">
    		<div class="col-3 user-profile">
    			<h3 class="profile-info"><a href="/home">${user.firstName} ${user.lastName}</a></h3>
    			<p class="profile-info"><span class="grey-text"><a href="/users/${user.id}">@${user.username}</a></span></p>
    			<p class="profile-info"><i class="far fa-calendar-alt"></i><span class="grey-text"> Joined ${user.createdAt}</span></p>
    		</div>
    		<div class="col-9 tweet-feed">
    			<div class="row tweet-title">
    				<p class="col-2">Tweezes</p>
    				<p class="col-9"><a href="#">Tweezes & replies</a></p>    			
    			</div>
   <!-- This is where the for-loop will go for tweets  -->	
   	 		<!-- PLACEHOLDER TEXT BELOW -->		
    		<c:forEach items="${user.tweets}" var="tweet">
   	    		<div class="row tweet">
    				<img src="/images/me.jpg" alt="user.photo" class="col-2 small-pic rounded-circle p-2 img-fluid  bg-white rounded">
    				<div class="col-8">
	    				<p class="tweet-user-info"><a href="/users/${user.id}">${user.firstName} ${user.lastName} ${user.username}</a> * Posted: {tweet.createdAt}</p>
	    				<p class="tweet-text">${tweet.text}</p>
	    				<div class="row tweet-icons">
	    					<i class="col-2 far fa-comment"></i>
	    					<span class="heart"><i class="col-2 far fa-heart"></i></span>
    					</div>
    				</div>
    			</div>
   			</c:forEach>
    	<!-- End of the for loops for tweets -->
    		</div>
    	</div>
    </div>
    
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>