<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here....</title>
<c:if test="${empty user}">
	<%
		request.setAttribute("nouser", "登入過期請重新登入");
			request.getRequestDispatcher("/Inv/InvLogin.jsp").forward(request, response);
	%>
</c:if>
</head>
<body>
	<a href='InvLogout.controller'>登出</a>
	<h3>員工 ${user.emp_id}/${user.emp_name}/${user.emp_level}</h3>
	<c:if test="${user.emp_level==1 }">
	<a href="">待驗收清單</a>
	<a href="">已驗收清單</a>
	</c:if>
	<c:if test="${user.emp_level==2 }">
	<a href="">待分派</a>
	</c:if>
</body>
</html>