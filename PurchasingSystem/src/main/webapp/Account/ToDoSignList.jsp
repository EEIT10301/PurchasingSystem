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
	<h3>待簽核請款單</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<button type="button" class="btn">登出</button>
	<br>
	<hr>
	<c:if test="${empty list}">
	<h3>尚無待簽核請款單</h3>
	</c:if>
		<c:if test="${not empty list}">
			<table>
		<tr>
		<th>請款單單號</th>
		<th>承辦人姓名</th>
		<th>廠商名稱</th>
		<th>總金額</th>
		</tr>
				<c:forEach var="sign" items="${list}">
			<tr>
				<td>${sign.inv_id}</td>
				<td>${sign.employeeBean.emp_name}</td>
				<td>${sign.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>${sign.total_price}</td>
				<c:if test="${user.emp_level==2}">   
				<td><a href="AccSignInvForm.controller?invid=${sign.inv_id}">查看</a></td>
				</c:if>
				<c:if test="${user.emp_level==1}">
				<td><a href="AccSignInvlevel1.controller?invid=${sign.inv_id}">查看</a></td>
				</c:if>
		</c:forEach>

			</table>
			</c:if>
</body>
</html>