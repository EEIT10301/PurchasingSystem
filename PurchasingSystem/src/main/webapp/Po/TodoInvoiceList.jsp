<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <%@ include file="../POInclude.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	 crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	 crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	 crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
#message{
color:red;
text-size:10px;
}
.right {
	width: 75%;
	float: left;
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}


.right {
	width: 75%;
	float: right;
	text-align: center;
	height: 1500px;
}

.nav nav-tabs {
	width: 75%;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}


.f {
	/* 方格排列 */
	display: inline-block;
	width: 200px;
	height: 50px;
	margin-bottom: 5px;
}

.imgp {
	/* 	padding: 0px; */
	/* 	font-size: 11px; */
	/* 	margin-right:10px; */
	float: left;
	height: 35px;
	width: 30px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family: 微軟正黑體;
	font-size: 19px;
}

span {
	margin-left: 1px;
}
</style>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
		<c:if test="${not empty successmeg}">
			<h2 id="message">請款單:${inv_id}${successmeg}</h2>
		</c:if>
		<c:if test="${not empty errormeg}">
			<h2 id="message">請款單${errormeg}</h2>
		</c:if>
		
	<div class="right">
	<c:if test="${empty list and empty listback}">
		<h2>待請款採購單</h2>
			<hr>
			<table class="table table-striped table-hover">
				<thead class="thead-light">
					<tr>
						<th>採購單單號</th>
						<th>承辦人姓名</th>
						<th>廠商名稱</th>
						<th>總金額</th>
						<th></th>
					</tr>
				</thead>
			</table>	
			<p>目前無採購單需要請款</p>
			<hr>
		<h2>退回請款單</h2>
		<hr>
			<table class="table table-striped table-hover">
				<thead class="thead-light">
					<tr>
						<th>採購單單號</th>
						<th>承辦人姓名</th>
						<th>廠商名稱</th>
						<th>總金額</th>
						<th></th>
					</tr>
				</thead>
			</table>	
			<p>無退回請款單需要處理</p>
		</c:if>
		<c:if test="${not empty list}">
			<h2>待請款採購單</h2>
			<hr>
			<table class="table table-striped table-hover">
				<thead class="thead-light">
					<tr>
						<th>採購單單號</th>
						<th>承辦人姓名</th>
						<th>廠商名稱</th>
						<th>總金額</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${list}">
						<tr>
							<td>${row.po_id}</td>
							<td>${row.employeeBean.emp_name}</td>
							<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
							<td>$${row.total_price}</td>
							<td><a href="NewInvoiceForm.controller?poid=${row.po_id}"><button type="button" class="btn btn-primary btn-sm">新增請款單</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<hr>
		<c:if test="${not empty listback}">
			<h2>退回請款單</h2>
			<table class="table table-striped table-hover">
				<thead class="thead-light">
					<tr>
						<th>請款單單號</th>
						<th>承辦人姓名</th>
						<th>廠商名稱</th>
						<th>總金額</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="back" items="${listback}">
						<tr>
							<td>${back.inv_id}</td>
							<td>${back.employeeBean.emp_name}</td>
							<td>${back.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
							<td>${back.total_price}</td>
							<td><a href="ShowReturnInvoiceForm.controller?poid=${back.po_id}"><button type="button" class="btn btn-primary btn-sm">修改請款單</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
	<script src="../js/app.js"></script>
</body>
</html>