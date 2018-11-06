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
<h2>請款單單號:${bean.inv_id}</h2>
<table>
<tr>
	<th>流程順序</th>
	<th>流程</th>
	<th>承辦人ID</th>
	<th>簽核意見</th>
	<th>流程狀態</th>
	<th>簽核時間</th>	
</tr>
<c:forEach var="statusone" items="${stat}">
<tr>
	<td>${statusone.sig_Rank}</td>
	<td>${statusone.account_Sta}</td>
	<td>${statusone.account_Manger}</td>
	<td>${statusone.sig_Sug}</td>
	<td>${statusone.sig_Sta}</td>
	<td>${statusone.sig_Date}</td>
</tr>
</c:forEach>
</table>
</body>
</html>