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

<div class="main" style="margin: 0 auto; width: 40%">
    
    <form:form method="POST" action="/editprofile" modelAttribute="user">
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
			<input type="file" class="custom-file-input" id="customFile" path="userPhotoPath">
			<label class="custom-file-label" for="customFile">Choose file for user pic</label>
		</div>
        <input type="submit" value="Update"/>
    </form:form>
    </div>
    </div>
    
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
</body>
</html>