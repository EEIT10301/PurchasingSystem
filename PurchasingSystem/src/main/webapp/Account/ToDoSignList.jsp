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
<title>財務系統</title>
</head>

	<%@ include file="../includeA.jsp" %>
<body class="bg">
<c:if test="${not empty sendsuccessmeg}">
		<h2 id="message">${sendsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty senderrormeg}">
		<h2 id="message">${senderrormeg}</h2>
	</c:if>
	<c:if test="${not empty returnsuccessmeg}">
		<h2 id="message">${returnsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty returnerrormeg}">
		<h2 id="message">${returnerrormeg}</h2>
	</c:if>
<div class="right">
				<br>
	<c:if test="${empty list}">
			<h3>待審核請款單</h3>
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
			</table>
		<h4>目前無請款單需要簽核</h4>
	</c:if>
	<c:if test="${not empty list}">
				<br>
				<h3>待審核請款單</h3>
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
				<c:forEach var="sign" items="${list}">
					<tr>
						<td>${sign.inv_id}</td>
						<td>${sign.employeeBean.emp_name}</td>
						<td>${sign.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						<td>$${sign.total_price}</td>
						<c:if test="${user.emp_level==2}">
							<td><a href="AccSignInvForm.controller?invid=${sign.inv_id}"><button type="button" class="btn btn-white btn-sm">審核請款單</button></a></td>
						</c:if>
						<c:if test="${user.emp_level==1}">
							<td><a
								href="AccSignInvlevel1.controller?invid=${sign.inv_id}"><button type="button" class="btn btn-white btn-sm">審核請款單</button></a></td>
						</c:if>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${user.emp_level==1 and empty listback}">
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
			</table>

		<h4>無退回請款單需要處理</h4>
		
	</c:if>

	<c:if test="${not empty listback}">
				
	
	<hr>
	<br>
		<h2>被退回請款單</h2>
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
				<c:forEach var="show2" items="${listback}">
					<tr>
						<td>${show2.inv_id}</td>
						<td>${show2.employeeBean.emp_name}</td>
						<td>${show2.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						<td>$${show2.total_price}</td>
						<td><a href="ReturnSignInv.controller?invid=${show2.inv_id}"><button type="button" class="btn btn-white btn-sm">審核請款單</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</c:if>
</div>
	
</body>
</html>