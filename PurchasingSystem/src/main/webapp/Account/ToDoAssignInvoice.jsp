<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>財務系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}

#message{
color:red;
text-size:10px;
}
</style>
</head>

<body class="bg">
<%@ include file="../includeA.jsp" %>
	<c:if test="${not empty dispatchsuccessmeg}">
		<h2 id="message">${dispatchsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty dispatcherrormeg}">
		<h2 id="message">${dispatcherrormeg}</h2>
	</c:if>
	<c:if test="${empty list}">
	<div class="right">
	<h3>待分派請款單</h3><br>
		<h4>尚無待分派請款單</h4>
	</div>
	</c:if>
	
	<c:if test="${not empty list}">
		<div class="right">
		<h3>待分派請款單</h3>
	<br>
		<table class="table table-striped table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">請款單單號</th>
					<th scope="col">承辦人姓名</th>
					<th scope="col">廠商名稱</th>
					<th scope="col">總金額</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="assign" items="${list}">
					<tr>
						<td>${assign.inv_id}</td>
						<td>${assign.employeeBean.emp_name}</td>
						<td>${assign.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						<td>$${assign.total_price}</td>
						<td><a
							href="AccSignInvoiceForm.controller?invid=${assign.inv_id}"><button type="button" class="btn btn-primary btn-sm">分派請款單</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</c:if>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>