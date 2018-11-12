<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>待收貨採購單</title>
</head>
<body class="bg">
	<c:if test='${not empty noPlacedOrderList}'>
		<h2>${noApplylist}</h2>
	</c:if>

	<c:if test='${not empty placedOrderList}'>
		<div class="right">
		<h3>待收貨表單</h3>
		<table id="myTable" class="table table-striped table-hover">
		<thead>
			<tr>
				<th width="200px">採購單號</th>
				<th width="200px">出貨時間</th>
			</tr>		
		</thead>
		<tbody>
		<c:forEach var='placedOrderList' items='${placedOrderList}'>
		<form action="<c:url value="/Po/placedOrderDetail.controller"/>"method="post">
		<tr>
			<td>${placedOrderList.po_id}</td>
			<td>${placedOrderList.pO_MainBean.shipping_Date}</td>
<%-- 			<c:forEach var='placedOrderListInfo' items='${placedOrderListInfo}'> --%>
<%-- 			<c:if test='${placedOrderListInfo.po_id == placedOrderListInfo.po_id}'> --%>
<%-- 			<p>出貨時間:${placedOrderListInfo.sig_date}</p> --%>
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
			
			<td><input type='hidden' name='po_manger' value='${placedOrderList.po_manger}'></td>
			<td><input type='hidden' name='po_sta' value='${placedOrderList.po_sta}'></td>
			<td><input type='hidden' name='po_id' value='${placedOrderList.po_id}'></td>
			<td><input type='hidden' name='sig_date' value='${placedOrderList.sig_date}'></td>
			<td><input type='hidden' name='sig_sta' value='${placedOrderList.sig_sta}'></td>
			<td><input type='hidden' name='sig_sug' value='${placedOrderList.sig_sug}'></td>
			<td><input type='hidden' name='sig_rank' value='${placedOrderList.sig_rank}'></td>
			<td><input type="submit" value="收貨" id="submit"></td>
	</tr>
	</form>
	</c:forEach>
	</tbody>
	</table>
	</div>
	</c:if>
	<script src="../js/app.js"></script>
</body>
</html>