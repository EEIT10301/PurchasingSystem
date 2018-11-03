<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>財務系統</title>
<style>
.btn {
	background-color: #e7e7e7;
	color: black;
}

a, a:visited {
	text-decoration: none;
	color: black;
}


</style>
</head>

<body>
<h3>待分派清款單</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<button type="button" class="btn">登出</button>
	<br>
	<hr>
	<c:if test="${empty list}">
	<h3>尚無待分派請款單</h3>
	</c:if>
		<c:if test="${not empty list}">
			<table>
		<tr>
		<th>請款單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
				<c:forEach var="assign" items="${list}">
			<tr>
				<td>${assign.inv_id}</td>
				<td>${assign.employeeBean.emp_name}</td>
				<td>${assign.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>${assign.total_price}</td>
				<td><a href="NewInvoiceForm.controller?invid=${assign.inv_id}">查看</a></td>
			</tr>
		</c:forEach>

			</table>
			</c:if>

</body>
</html>