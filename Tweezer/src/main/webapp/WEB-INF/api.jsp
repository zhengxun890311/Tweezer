<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

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
						<li class="nav-item active"><a class="nav-link" href="#"><i
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
					<div id="div2" style="background-color: #00A4ED" class="profile_pic">
						
						
						<a href="/editprofile">
							<img id="profile_div_img" src="${user.userPhotoPath}" alt="my_pic"
								class="me rounded-circle img-fluid shadow-sm p-1 mb-5 bg-white rounded">
						</a>
						<div id="profile_div_name">
							<h6><c:out value="${user.firstName}"/></h6>
						</div>
						<div id="profile_div_id">
							<font size="2">@<c:out value="${user.username}"/></font>
						</div>
						
						<div id="profile_div_tweets">
							<a style="text-decoration: none;" href="#">
								<div style="color:#657786">Tweets</div>
								<div>20</div>
							</a>
						</div>
						<div id="profile_div_following">
							<a style="text-decoration: none;" href="#">
								<div style="color:#657786">Following</div>
								<div>2</div>
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
<%--    	 		<c:forEach items="${follow}" var="t">
   	 			<c:out value="${t[0]}"/>
   	 		</c:forEach>	 --%>	
   	 				
   	 				
    		<c:forEach items="${allTweets}" var="t">
    			<c:set var="id" value="${t[5]}"/>
    			<c:set var="str" value="${str}"/>
    			<c:if test="${fn:contains(str, id)}">
    			
   	    		<div class="row tweet" style="margin-left:0px;margin-right: 0px;">
    	    			<c:if test="${empty t[1] != true}">
    					<img src="${t[1]}" alt="user.photo" class="col-2 small-pic rounded-circle p-2 img-fluid  bg-white rounded">
    				</c:if>
    				<div class="col-8"> 
	    				
	    				
	    				
    					<fmt:formatDate value="${t[4]}" pattern="MMMM dd, yyyy hh:mmaa" var="formattedDateTweet"/>
	    				<p class="tweet-user-info"><a href="/users/${t[5]}"><c:out value="${t[6]} ${t[7]} @${t[8]}"/></a> • Posted: <c:out value="${formattedDateTweet}"/></p>
    			
	    				
	    				
	    				<p class="tweet-text">${t[3]}</p>
	    				
  						<c:if test ="${empty t[7]!= true }">
							<a href="${t[7]}"><img src="${t[7]}" class="tweet-photo"></a>
						</c:if>
	    				
	    				<div class="row tweet-icons">
	    	<!-- post reply -->
	    					<i class="col-2 far fa-comment">
	    					<form:form method="post" action="/homeReply" modelAttribute="replyObj">
	    						<input type="hidden" name="tweet" value="${t[2]}">
	    						<input type="hidden" name="user" value="${loggedUser.id}">
	    						<form:input path="text"/>
	    						<input type="submit" value="reply">
	    					</form:form>
	    					</i> <c:out value="${t[0]}"/>
	    	<!-- like a tweet -->
	    					<span class="heart"><i class="col-2 far fa-heart"></i><c:out value="${t[1]}"/></span>
    					</div>
    				</div>
    			</div>
    			</c:if>
   			</c:forEach>
			</div>
			
<!-- 	This is the section for 'who to follow' -->
			<div class="col-3 user-profile">
			<h3>Who to Follow</h3>
			<c:forEach items="${whoToFollow}" var="u" begin="0" end="2">
<%-- 				<c:if test="${empty u[1] != true}">
    				<img src="${u[4]}" alt="user.photo" class="col-2 small-pic rounded-circle p-2 img-fluid  bg-white rounded">
    			</c:if> --%>
    			<a href="/users/${u[0]}"><c:out value="${u[1]} ${u[2]} @${u[3]}"/></a>
    			<form:form method="POST" action="/whoToFollow" modelAttribute="followUserObj">
		   			<input type="hidden" name="id" value="${u[0]}">
	 				<input type="submit" value="follow" class="btn btn-outline-info">
		    	</form:form>
    				
			</c:forEach>
			
<!-- 			I left this section in case you wanted to use the code for something else. Delete if not needed anymore! -->
				<h3 class="profile-info"><c:out value="${user.firstName}"/></h3>
				<p class="profile-info">
					<span class="grey-text">@<c:out value="${user.username}"/></span>
				</p>
				<p class="profile-info">
					<i class="far fa-calendar-alt"></i><span class="grey-text">
					<fmt:formatDate value="${user.createdAt}" pattern="MMMM yyyy" var="formattedDate"/>
						Joined <c:out value="${formattedDate}"/></span>
				</p>
				
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
</body>
</html>