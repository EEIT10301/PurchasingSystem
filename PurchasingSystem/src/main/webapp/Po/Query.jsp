<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增詢價單</title>
</head>
<body>
<form action="" method="get">
<c:if test="${not empty query}">
<table border="1">
<tr>
<th>採購單ID</th>
<th>廠商</th>
<th>總價</th>
</tr>
<tr>
<td>${query.po_id}</td>
<td></td>
<td><input></td>
</tr>
</table>
</c:if>
</form>
</body>
</html>