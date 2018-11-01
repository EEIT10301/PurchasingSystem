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

	<h2>待請款採購單</h2>
	<c:if test="${empty list}">
		<h2>目前無採購單需要請款</h2>
	</c:if>

	<c:if test="${not empty list}">

		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.po_id}</td>
				<td>${row.emp_id}</td>
				<td>${row.vendor_ID}</td>
				<td>$${row.total_price}</td>
				<td>${row.employeeBean.emp_name}</td>
				<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
				<td><a href="../Account/Insertinvoiceform.jsp">新增請款單</a></td>
			</tr>
		</c:forEach>
	</c:if>
</body>
</html>