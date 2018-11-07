<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢廠商款項</title>
</head>
<body>

<a href="ShowAccountPayableList.controller">查詢廠商帳款明細</a>

	<c:if test="${not empty allPayableList}">
		<h2>廠商帳款清單</h2>
		<table>
			<tr>
				<th>帳款對帳單號</th>
				<th>請款單單號</th>
				<th>廠商名稱</th>
				<th>廠商結帳週期</th>
				<th>應付款項金額</th>
				<th>產生日期</th>
				<th>支票號碼</th>
				<th>匯款帳號</th>
				<th>預計付款日</th>
				<th>付款狀況</th>
				<th>實付金額</th>
			</tr>
			<c:forEach var="row" items="${allPayableList}">
				<tr>
					<td>${row.accoutpayable_no}</td>
					<c:if test="${not empty row.inv_id}">
					<td><a href="ShowInvoice.controller?invid=${row.inv_id}">${row.inv_id}</a></td>
					</c:if>
					<c:if test="${empty row.inv_id}">
					<td>尚未請款</td>
					</c:if>
					<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
					<td>${row.pO_Vendor_InfoBean.payment_term}</td>
					<td>$${row.amount_Payable}</td>
					<td>${row.booking_Date}</td>
					<td>${row.cheque_no}</td>
					<td>${row.pO_Vendor_InfoBean.vendor_acc}</td>
					<td>${row.except_Payment_Date}</td>
					<td>${row.payable_Status}</td>
					<td>$${row.amount_Paid}</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>