<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<c:if test="${empty list and listback}">
		<h2>目前無採購單需要請款</h2>
		<hr>
		<h2>無退回請款單</h2>
	</c:if>

	<c:if test="${not empty list}">
	<h2>待請款採購單</h2>
<table>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.po_id}</td>
				<td>${row.emp_id}</td>
				<td>${row.employeeBean.emp_name}</td>
				<td>${row.vendor_ID}</td>
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
				<td>${back.inv_id}</td>
				<td>${back.emp_id}</td>
				<td>${back.pO_MainBean.pO_Vendor_InfoBean.vendor_id}</td>
				<td>${back.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>${back.total_price}</td>
				<td><a href="NewInvoiceForm.controller?invid=${back.inv_id}">修改請款單</a></td>
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
</body>
</html>