<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主畫面</title>
<style>
/* a, a:visited {
	text-decoration: none;
	color: black;
}
table{
	width:100%;
}
body {
	text-align: center;
} */
</style>
</head>
<body>
	<h3>員工登入</h3>
     <form action="<c:url value="AllApplyLogin.controller" />" method="post">
    <table>
	<tr>
		<td>ID : </td>
		<td><input type="text" name="username" value="${param.username}"></td>
		<td>${errors.username}</td>
	</tr>
	<tr>
		<td>PWD : </td>
		<td><input type="text" name="password" value="${param.password}"></td>
		<td>${errors.password}</td>
	</tr>
	<tr>
		<td>　</td>
		<td align="right"><input type="submit" value="Login"></td>
	</tr>
</table>
</form>

<<<<<<< HEAD
	<table>
		<tr>
			<td><a href="Apply/ApplyLogin.jsp">研發部門</a></td>
		</tr>
		<tr>
			<td><a href="Po/POLogin.jsp">採購部門</a></td>
		</tr>
		<tr>
			<td><a href="Inv/InvLogin.jsp">品管部門</a></td>
		</tr>
		<tr>
			<td><a href="Account/AccountLogin.jsp">財務部門</a></td>
		</tr>
	</table>
=======

<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td><a href="Apply/ApplyLogin.jsp">研發部門</a></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td><a href="Po/POLogin.jsp">採購部門</a></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td><a href="">品管部門</a></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td><a href="Account/AccountLogin.jsp">財務部門</a></td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
>>>>>>> branch 'master' of https://github.com/EEIT10301/PurchasingSystem.git
</body>
</html>