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

<c:if test="${empty listtodosign and BackInvoiceSign}">
		<h2>目前無請款單需要簽核</h2>
		<hr>
		<h2>無退回請款單</h2>
	</c:if>

<c:if test="${not empty listtodosign}">
<h2>待簽核請款單</h2>
<table>
<tr>
		<th>請款單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
		<c:forEach var="show" items="${listtodosign}">

			<tr>
				<td>${show.inv_id}</td>
				<td>${show.employeeBean.emp_name}</td>
				<td>${show.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>$${show.total_price}</td>
				<td><a href="SignInvoiceForm.controller?invid=${show.inv_id}">查看</a></td>
			</tr>
		</c:forEach>
		</table>
		<hr>
		<c:if test="${not empty BackInvoiceSign}">
		<h2>被退回請款單</h2>
<table>
<tr>
		<th>請款單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
		<c:forEach var="show2" items="${BackInvoiceSign}">

			<tr>
				<td>${show2.inv_id}</td>
				<td>${show2.employeeBean.emp_name}</td>
				<td>${show2.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>$${show2.total_price}</td>
				<td><a href="SignInvoiceFormBack.controller?invid=${show2.inv_id}">查看</a></td>
			</tr>
		</c:forEach>
		</table>
		</c:if>

	</c:if>

</body>
</html>