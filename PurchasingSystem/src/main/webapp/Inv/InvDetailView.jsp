<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>庫存細項</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<table class="table table-striped table-hover">
<thead>
<tr><td>產品名稱heheh</td><td>驗收數量</td><td>入庫日期</td></tr>
</thead>
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