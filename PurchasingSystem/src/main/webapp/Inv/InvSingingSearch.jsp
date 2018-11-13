<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>驗證流程查看</title>
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
	margin: 30px;
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
		<tr>
			<th>驗收單號</th>
			<th>採購單號</th>
			<th>驗收人員</th>
			<th>驗收金額</th>
			<th>入庫狀態</th>
			<th>驗收金額</th>
			<th>產品廠商</th>
			<th>驗收狀態</th>
		</tr>	
		</thead>
		<c:forEach var="check" items="${checkBean}">
			<tr>
				<td>${check.chk_Id}</td>
				<td>${check.po_ID}</td>
				<td>${check.emp_ID}</td>
				<td>${check.chk_Money}</td>
				<td>${check.chk_Comment}</td>
				<td>${check.total_price}</td>
				<td>${check.vender_ID}</td>
				<td><a href="singstatus?ChPK=${check.chk_Id}">查看細項</a></td>			
							</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>