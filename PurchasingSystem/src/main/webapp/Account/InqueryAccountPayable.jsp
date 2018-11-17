	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>查詢廠商款項</title>
<style>

#xls{
float: right;
margin-right:30px;
}

#pdf{
float: right;
margin-right:30px;
}

</style>
</head>
<%@ include file="../includeA.jsp" %>
<body class="bg">

	<c:if test="${not empty allPayableList}">
		<div class="right">
	<br>
			<h3>廠商帳款清單</h3>
			<input class="form-control" id="myInput" type="text"
				placeholder="Search"><br />
				<div class="text-right">
				<form action="ShowInvoice.xls" enctype="multipart/form-data"
					method="post" id="xls">
					<input class="btn btn-white btn-sm" type="submit" value="下載Excel檔"></input>
				</form>
				<form action="ShowInvoice.pdf" enctype="multipart/form-data"
					method="post" id="pdf">
				   <input class="btn btn-white btn-sm" type="submit" value="下載Pdf檔"></input>
				</form>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>帳款對帳單號</th>
						<th>請款單單號</th>
						<th width="130px">廠商名稱</th>
						<th width="50px">廠商結帳週期</th>
						<th>應付金額</th>
						<th>帳款日期</th>
						<th width="50px">支票號碼</th>
						<th>匯款帳號</th>
						<th>預計付款日</th>
						<th width="50px">付款狀況</th>
						<th width="50px">實付金額</th>
					</tr>
				</thead>
				<tbody id='myTable'>
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
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${row.booking_Date}" /></td>
							<td>${row.cheque_no}</td>
							<td>${row.pO_Vendor_InfoBean.vendor_acc}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${row.except_Payment_Date}" /></td>
							<td>${row.payable_Status}</td>
							<td>$${row.amount_Paid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</c:if>

	<script src="../js/app.js"></script>
</body>
</html>