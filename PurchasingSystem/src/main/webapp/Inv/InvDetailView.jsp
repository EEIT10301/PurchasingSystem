<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>庫存細項</title>
<style>
table, td {
	border: 3pX solid skyblue;
}
</style>
</head>
<body>

<table>
<tr><td>產品名稱</td><td>驗收數量</td><td>入庫日期</td></tr>
<c:forEach var="detail" items="${detailbean}" >
<tr>
<td>${detail.inv_Name}</td>
<td>${detail.inv_Amount}</td>
<td>${detail.inv__Date}</td>
</tr>
</c:forEach>
</table>
</body>
</html>