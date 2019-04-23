<?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="container"
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
							placeholder="Search Tweezer" aria-label="Search"><i
							class="fas fa-user" style="margin-right: 10px;"></i>
						<button class="btn btn-primary my-2 my-sm-0 tweez-btn"
							type="submit">Tweez</button>
					</form>
				</div>
			</nav>
		</div>
	</div>
</body>
</html>