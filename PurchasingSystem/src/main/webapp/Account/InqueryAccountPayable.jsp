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

	<c:if test="${empty allpayablelist }">
		<h2>目前無廠商帳款明細</h2>
	</c:if>

	<c:if test="${not empty allpayablelist}">
		<h2>廠商帳款清單</h2>
		<table>
			<tr>
				<th>帳款對帳單號</th>
				<th>請款單單號</th>
				<th>廠商名稱</th>
				<th>應付款項金額</th>
				<th>產生日期</th>
				<th>支票號碼</th>
				<th>匯款帳號</th>
				<th>預計付款日</th>
				<th>付款狀況</th>
				<th>實付金額</th>
			</tr>
			<c:forEach var="row" items="${allpayablelist}">
				<tr>
					<td>${row.po_id}</td>
					<td><a href="NewInvoiceForm.controller?poid=${row.po_id}">新增請款單</a></td>
					<td>${row.po_id}</td>
					<td>${row.employeeBean.emp_name}</td>
					<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
					<td>$${row.total_price}</td>
					<td>$${row.total_price}</td>
					<td>$${row.total_price}</td>
					<td>$${row.total_price}</td>
					<td>$${row.total_price}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>