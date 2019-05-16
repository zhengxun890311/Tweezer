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
<title>Edit Profile</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/edit.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
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
	<!-- 		      <li class="nav-item">
			        <a class="nav-link" href="/notifications"><i class="fas fa-bell"></i> Notifications</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="/messages"><i class="fas fa-envelope"></i> Messages</a>
			      </li> -->
		  	      <li class="nav-item">
			        	<a class="nav-link" href="#" style="margin-left: 95px;"><img id="tweezer-logo"src="images/tweezer.png"></a>	        
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

    </div>

<div class="main" style="margin: 0 auto; width: 40%">
       	<div class="container">
	        <div class="justify-content-center" style="margin: 20px 0 0 -240px;">
	            <div class="prof-pic-crop">
	                <img src="/${user.userPhotoPath}" class="me prof-pic">
	            </div>
	        </div>
	        <div class="row">
	            <div class="col bio">
	                <h1></h1> 
	            </div>
	        </div>
    	</div>
    <form:form method="POST" action="/editprofile" enctype="multipart/form-data" modelAttribute="user">
    	<input type="hidden" name="id" value="${user.id}">
        <div class="form-group">
            <form:label path="firstName">First Name:</form:label>
            <form:input path="firstName" class="form-control" id="formGroupExampleInput"/>
        </div>
        <div class="form-group">
            <form:label path="lastName">Last Name:</form:label>
            <form:input path="lastName" class="form-control" id="formGroupExampleInput"/>
        </div>
        <div class="form-group">
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email" class="form-control" id="formGroupExampleInput"/>
        </div>
       
        
        <div class="form-group">
            <form:label path="birthday">Birthday:</form:label>
            <form:input type="date" path="birthday"/>
        </div>
        <div class="custom-file">
			<input id="myfile" name="myfile" type="file" path="userPhotoPath" class="custom-file-input" value="${user.userPhotoPath }">
			<label class="custom-file-label" for="customFile">Choose file for user pic</label>
			<div>
				<img id="player" src="${tweet.photo_path}" style="width: 20rem;">
			</div>
			<input type="submit" value="Update"/>
		</div>
        
    </form:form>
    </div>
    </div>
    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(function(){
		$("#player").hide();
		$("#myfile").change(function(){
			$("#player").show();
			var url = createURL(this.files[0]);
			if(url){
				$("#player").attr("src",url);
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
	})
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</body>
</html>