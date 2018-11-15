<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>主畫面</title>
<style>

body {
  	font-family: 'Lato', sans-serif;
  	font-weight: 400;
  	font-size: 16px;
  	line-height: 1.7;
  	background-image: url("images/worldwide-occupier-services.jpg");
  	background-repeat: no-repeat;
  	background-size: cover;
}

/* .header { */
/*   	height: 100vh; */
/*   	background-image:  */
/*  	  linear-gradient(to right bottom,   */
/*       rgba(0, 0, 0, 0.3),  */
/*       rgba(30, 0, 0, 0.3)),  */
/*      url('https://images.unsplash.com/photo-1495464101292-552d0b52fe41?auto=format&fit=crop&w=1350&q=80'); */
  
/* 	background-size: cover; */
/*   	background-position: top; */
/*   	position: relative; */

/*   	clip-path: polygon(0 0, 100% 0, 100% 75vh, 0 100%); */
/* } */

.brand-box {
  	position: absolute;
  	top: 40px;
  	left: 40px;
}

.brand { font-size: 20px; }

.text-box {
  	position: absolute;
  	top: 50%;
  	left: 50%;
  	transform: translate(-50%, -50%);
  	text-align: center;
}

.heading-primary {
  	text-transform: uppercase;
  	backface-visibility: hidden;
  	margin-bottom: 30px;
}

.heading-primary-main {
  	display: block;
  	font-size: 26px;
  	font-weight: 400;
  	letter-spacing: 5px;
}

.heading-primary-sub {
  	display: block;
  	font-size: 18px;
  	font-weight: 700;
  	letter-spacing: 7.4px;
}

.btn:link,
.btn:visited {
  	text-transform: uppercase;
  	text-decoration: none;
  	padding: 10px 20px;
  	display: inline-block;
  	border-radius: 100px;
  	transition: all .2s;
  	position: relative;
}

.btn:hover {
  	transform: translateY(-3px);d
  	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
  	transform: translateY(-1px);
  	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.btn-white {
	font-size: 14px;
	margin-left:30px;
	margin-right:30px;
}


</style>
</head>
<body>

	<div class="text-box">
		<h1 class="heading-primary">
			<span class="heading-primary-main">員工登入</span>
		</h1>
		<form action="<c:url value="AllApplyLogin.controller" />"
			method="post">
			<div class="form-group" style="font-family:微軟正黑體;">
				<label for="exampleInputEmail1">帳號</label> <input type="text"
					class="form-control" name="username" size="30px" value="${param.username}"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="請輸入你的email" required>
				<p>${errors.username}</p>
			</div>
			<div class="form-group" style="font-family:微軟正黑體;">
				<label for="exampleInputPassword1">密碼</label> <input
					type="password" class="form-control" name="password" size="30px"
					value="${param.password}" id="exampleInputPassword1"
					placeholder="請輸入你的密碼 " required>
				<p>${errors.password}</p>
			</div>
			<div class="text-center" style="font-family:微軟正黑體;">
				<input class="btn btn-white btn-animated" type="reset" value="重新輸入">
				<input class="btn btn-white btn-animated" type="submit" value="登入">
			</div>
		</form>
	</div>
</body>
</html>