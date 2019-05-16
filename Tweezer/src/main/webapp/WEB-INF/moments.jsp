<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
				<a class="navbar-brand home" href="/home"><i class="fas fa-home"></i>
					Home</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="/news"><i
								class="fas fa-bolt"></i> News <span class="sr-only">(current)</span></a>
						</li>
						<!-- <li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-bell"></i> Notifications</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-envelope"></i> Messages</a></li> -->
						<li class="nav-item"><a class="nav-link" href="#"
							style="margin-left: 95px;"><img id="tweezer-logo"
								src="images/tweezer.png"></a></li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2 searchbar" type="search"
							placeholder="Search Tweezer" aria-label="Search"> <i
							class="fas fa-user" style="margin-right: 10px;"></i>
						<a href="/logout" class="btn btn-primary my-2 my-sm-0 tweez-btn">Log Out</a>
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
							<img id="profile_div_img" src="${user.userPhotoPath}"
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

				<div id="trend_div" style="background-color: white;padding:10px;overflow-y:scroll;max-height:450px;">
					<h3><span class="black-text">Trends for you</span></h3>
					
					<c:forEach items="${trends.response.results}" var='t' begin="1">
					<a href="${t.webUrl}"><c:out value="#${t.webTitle}"/></a><br>
					</c:forEach>
				</div>
				</div>
				
			
			<div class="col-6 tweet-feed">
				<!-- Main content -->
				
				<div id="tweet_div_content" class="row tweet-title" style="margin-left:0px;margin-right:0px;padding:5px;">
					<!-- <p class="col-9"> -->
						
						<h3 style="margin-bottom:20px">Most Recent News</h3>
						
					
					<c:forEach items="${news.response.results}" var="n">
					
					<div>
					<p style="font-weight:bold"><c:out value="${n.sectionName}"/></p>
					<c:set var="date" value="${n.webPublicationDate}"/>
					<p><c:out value="${date.split('T')[0]} ${date.split('T')[1].split('Z')[0].split(':')[0]}:${date.split('T')[1].split('Z')[0].split(':')[1]}"/><a href="${n.webUrl}"> <c:out value="${n.webTitle}"/></a></p>
					</div>
					</c:forEach>
					
				</div>
				</div>
				
   	 				
    		
			
<!-- 	This is the section for 'who to follow' -->
			<div class="col-3 user-profile">
				<h3>Who to Follow</h3>
				<c:forEach items="${whoToFollow}" var="u" begin="0" end="2">
				<div class="row" style="height: 80px; margin-bottom: 30px; margin-left: 2px;">
					<!-- <div class="col-3"> -->
		 				<c:if test="${empty u[1] != true}">
		    				<img src="${u[4]}" class="usericon col-3 rounded-circle p-1 img-fluid  bg-white rounded" style= "max-height: 200px;">
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

</body>
</html>