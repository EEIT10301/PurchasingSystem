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
input[type=reset]{
margin-right:40px;
}
</style>
</head>
<body class="bg-light" style="margin-top:150px">
	<div class="mx-auto" style="width: 300px">

		<div class="text-center" style="font-family:微軟正黑體;">
			<h3>員工登入</h3>
		</div>
		<form action="<c:url value="AllApplyLogin.controller" />"
			method="post">
			<div class="form-group" style="font-family:微軟正黑體;">
				<label for="exampleInputEmail1">帳號</label> <input type="text"
					class="form-control" name="username" value="${param.username}"
					id="exampleInputEmail1" aria-describedby="emailHelp"
					placeholder="請輸入你的email" required>
				<p>${errors.username}</p>
			</div>
			<div class="form-group" style="font-family:微軟正黑體;">
				<label for="exampleInputPassword1">密碼</label> <input
					type="password" class="form-control" name="password"
					value="${param.password}" id="exampleInputPassword1"
					placeholder="請輸入你的密碼 " required>
				<p>${errors.password}</p>
			</div>
			<div class="text-center" style="font-family:微軟正黑體;">
				<input class="btn btn-primary" type="reset" value="重新輸入">
				<input class="btn btn-primary" type="submit" value="登入">
			</div>
		</form>
	</div>
	<%--      <form action="<c:url value="AllApplyLogin.controller" />" method="post"> --%>
	<!--     <table> -->
	<!-- 	<tr> -->
	<!-- 		<td>ID : </td> -->
	<%-- 		<td><input type="text" name="username" value="${param.username}"></td> --%>
	<%-- 		<td>${errors.username}</td> --%>
	<!-- 	</tr> -->
	<!-- 	<tr> -->
	<!-- 		<td>PWD : </td> -->
	<%-- 		<td><input type="password" name="password" value="${param.password}"></td> --%>
	<%-- 		<td>${errors.password}</td> --%>
	<!-- 	</tr> -->
	<!-- 	<tr> -->
	<!-- 		<td>　</td> -->
	<!-- 		<td align="right"><input type="submit" value="Login"></td> -->
	<!-- 	</tr> -->
	<!-- </table> -->

	<!-- </form> -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>