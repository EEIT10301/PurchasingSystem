<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢請款單</title>
</head>
<body class="bg">
	<%@ include file="../includeA.jsp"%>
	<c:if test="${not empty invoiceData}">
		<div class="right">
			<br>
			<h3>廠商帳款清單>請款單明細</h3>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>申請人</th>
						<th>所屬部門</th>
						<th>請款金額</th>
						<th>付款方式</th>
						<th>憑證日期</th>
						<th>憑證圖檔</th>
					</tr>
				</thead>
				<tbody id='myTable'>
					<tr>
						<td>${invoiceData.employeeBean.emp_name}</td>
						<td>${invoiceData.employeeBean.emp_dep}</td>
						<td>$${invoiceData.total_price}</td>
						<td>${invoiceData.pO_MainBean.pO_Vendor_InfoBean.payment_method}</td>
						<fmt:formatDate value="${invoiceData.recript_date}" pattern="yyyy/MM/dd" var="date"/>
					<td>${date}</td>
					<td><a href="..${invoiceData.recript_pic}" target="_blank">${picName}</a></td>
				</tr>
			</tbody>
		</table>
		</div>
	</c:if>
<script src="../js/app.js"></script>
</body>
</html>