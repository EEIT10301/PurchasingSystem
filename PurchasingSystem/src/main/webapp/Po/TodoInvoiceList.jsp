<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>

<style type="text/css">
#message{
color:red;
text-size:10px;
}

</style>
</head>
<body class="bg">
	<div class="right">
	<c:if test="${not empty successmeg}">
	<h2 id="message">請款單:${inv_id}${successmeg}</h2>
	</c:if>
	<c:if test="${not empty errormeg}">
	<h2 id="message">請款單${errormeg}</h2>
	</c:if>
	<c:if test="${empty list and empty listback}">
		<h2>目前無採購單需要請款</h2>
		<hr>
		<h2>無退回請款單</h2>
	</c:if>

	<c:if test="${not empty list}">
	<h2>待請款採購單</h2>

<table>
<tr>
		<th>採購單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
		<c:forEach var="row" items="${list}">

			<tr>
				<td>${row.po_id}</td>
				<td>${row.employeeBean.emp_name}</td>
				<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
				<td>$${row.total_price}</td>
				<td><a href="NewInvoiceForm.controller?poid=${row.po_id}">新增請款單</a></td>
			</tr>
		</c:forEach>
		</table>

	</c:if>
	<hr>

	<c:if test="${not empty listback}">
	<h2>退回請款單</h2>
<table>
		<c:forEach var="back" items="${listback}">
		<tr>
		<th>請款單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
			<tr>
				<td>${back.inv_id}</td>
				<td>${back.employeeBean.emp_name}</td>
				<td>${back.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>${back.total_price}</td>
				<td><a href="ShowReturnInvoiceForm.controller?poid=${back.po_id}">修改請款單</a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
<!-- 		<table> -->
<%-- 		<c:forEach var="back" items="${listback}"> --%>
<!-- 			<tr> -->
<%-- 				<td>${back.inv_id}</td> --%>

<%-- 				<td><a href="NewInvoiceForm.controller?poid=${back.po_id}">新增請款單</a></td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</table> -->
</div>
</body>
</html>