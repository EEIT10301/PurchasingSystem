<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>查詢請款單</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.left{
	width:12%;
float:left;

}
.f {
	/* 方格排列 */
	display: inline-block;
	width: 6rem;
	height: 6.5rem;
	text-align: center;

}

.imgp {
	padding: 10px;
}
.card-text{
	font-size:11px;
}
.right {
	width: 87%;
	float: left;
	font-size: 15px;
}
</style>
</head>
<body class="bg">
<%@ include file="../includeA.jsp" %>
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
					<td><fmt:formatDate pattern="yyyy/MM/dd" value="${invoiceData.recript_date}" /></td>
					<td><a href="..${invoiceData.recript_pic}" target="_blank">${picName}</a></td>
				</tr>
			</tbody>
		</table>
		</div>
	</c:if>
<script src="../js/app.js"></script>
</body>
</html>