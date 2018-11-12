<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>驗收系統</title>
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
		<h3>${sendok}</h3>
		<c:if test="${user.emp_level==1 }">
			<a href="selectInvchk.controller">待驗收清單</a>
			<a href="CheckBean">驗收成功清單</a>
			<a href="">驗收失敗清單</a>
		</c:if>
		<c:if test="${user.emp_level==2 }">
			<a href="sendEmployee.controller">待分派清單</a>
		</c:if>
		<a href="item?pageNo=1">查詢目前庫存</a>
</body>
</html>