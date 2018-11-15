<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../Invchkclude.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>庫存細項</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#submit {
	position: absolute;
	right: 700px;
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
}
.right{
	width:78%;
    float:left;
}
.search-form {
  text-align: right;
  input {
    border: none;
    padding: .5em;
    background: rgba(255,255,255,.5);
    color: #555;
  }
  button {
    @extend input;
  }
}

</style>
</head>
<body class="bg">
<div class="right">

<table class="table table-striped table-hover">
<thead>
<tr><td>產品名稱</td><td>驗收數量</td><td>入庫日期</td></tr>
</thead>
<c:forEach var="detail" items="${detailbean}" >
<tr>
<td>${detail.inv_Name}</td>
<td>${detail.inv_Amount}</td>
<td>${detail.inv__Date}</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>