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

<form action="<c:url value="/Inv/item" />" method="post"> 

<table>
<tr><td>Part<td>Name</td><td>Amount</td>
<td>Date</td><td>Intr</td><td>InvPart</td>
<td>Spe</td><td>Amounts</td></tr>
<c:forEach var='ss' items='${ss}'>
	
	<tr><td>${ss.inv_Part_no}</td>
	<td>${ss.inv_Name}</td>
	<td>${ss.inv_Amount}</td>
	<td>${ss.inv__Date}</td>
	<td>${ss.inv_Intr}</td>
	<td>${ss.inv_Part}</td>
	<td>${ss.inv_Spe}</td>
	<td>${ss.inv_Amounts}</td></tr></p>

</c:forEach>
	</table>
	<input type="submit" value="查詢"><br>
</form>
</body>
</html>