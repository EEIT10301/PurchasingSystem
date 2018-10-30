<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${nouser}
<form action="<c:url value="/Apply/ApplyLogin.controller" />" method="post">
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
</body>
</html>