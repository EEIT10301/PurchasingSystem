<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>狀態查詢</title>
</head>
<body>
<c:if test='${not empty lists}'>
	<h3>請款單列表</h3>
	<table>
		<tr>
			<th>請款單單號</th>
		</tr>
		
		<c:forEach var="sta" items="${lists}">
		<tr>
			<td><a href="queryStatusIn.controller?invid=${sta.inv_id}">${sta.inv_id}</a></td>
		</tr>
		</c:forEach>
		
	</table>
	</c:if>
<c:if test='${not empty nolist}'>
${nolist}
</c:if>
</body>
</html>