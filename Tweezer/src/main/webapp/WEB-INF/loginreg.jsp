<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Registration/Login Page</title>
    <link href="https://fonts.googleapis.com/css?family=Marcellus" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/homePageStyle.css">
</head>
<body>
<div id="bg">
	<img id="backgr" src="images/tweezer-bg.png" alt="background">
</div>
<div class="container main">
	<div class="row">
		<div class="col-6 register-half">
			<div class="row login">
				<div class="container">
				    <form method="post" action="/login" style="display: inline-block;">
			            <input type="text"  name="email" class="col-4 form-control form-control-sm"/>
			            <input type="password" name="password" placeholder="*******" class="col-4 form-control form-control-sm"/>
						<input type="submit" value="Log In" class="login-btn badge-pill"/>
				    </form>  			
				</div>
				<p><c:out value="${error}"/></p>
			</div>
			<div class="row">
				<div class="col-10">
					<img id="tweezer-logo"src="images/tweezer.png">
					<h4><span class="main-font">Join Tweezer today.</span></h4>
			    	<p><form:errors path="userObj.*"/></p>
					<button class="register-btn badge-pill">Sign Up</button>
					<div>
					    <form:form method="POST" action="/registration" modelAttribute="userObj">
						<span id="register-form" style="display: none;">
							<div class="row">
								<div class="col-4 ">
						            <p><form:label path="firstName">First Name:</form:label></p>
						            <p><form:label path="lastName">Last Name:</form:label></p>
						            <p><form:label path="username">Username:</form:label></p>
						            <p><form:label path="email">Email:</form:label></p>
						            <p><form:label path="birthday">Birthday:</form:label></p>
						            <p><form:label path="password">Password:</form:label></p>
						            <p><form:label path="passwordConfirmation">Password Confirmation:</form:label></p>
								</div>
								<div class="col-8 form-group">
							        <p>
							            <form:input path="firstName" class="form-control form-control-sm" placeholder="Enter First Name"/>
							        </p>
							        <p>
							            <form:input path="lastName" class="form-control form-control-sm" placeholder="Enter Last Name"/>
							        </p>
							        <p>
							            <form:input id="username" path="username" class="form-control form-control-sm" placeholder="Enter a Username"/>
							        </p>
							        <p>
							            <form:input id="email" type="email" path="email" class="form-control form-control-sm" placeholder="Enter Your Email"/>
							        </p>
							        <p>
							            <form:input id="birthday" type="date" path="birthday" class="form-control form-control-sm"/>
							        </p>
							        <p>
							            <form:password path="password" class="form-control form-control-sm" placeholder="Password"/>
							        </p>
							        <p>
							            <form:password path="passwordConfirmation" class="form-control form-control-sm" placeholder="Confirm Your Password"/>
							        </p>
							        <input type="submit" value="Register" class="register-btn badge-pill"/>
								</div>
							</div>
						</span>
					    </form:form>				
					</div>
				</div>
			</div>
	    </div>
	</div>
</div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script>
	$(document).ready(function(){
		var date = new Date();
		var year = date.getFullYear()-13;
		var month = ''+(date.getMonth()+1);
		var day = ''+date.getDate();
		if(month.length<2){
			month="0"+month;
		}
		if(day.length<2){
			day="0"+day;
		}
		var date = [year, month, day].join('-');
		$("#birthday").attr("max",date);
	})
</script>
</body>
</html>