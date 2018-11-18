<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增詢價單</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <style type="text/css"> -->

<!-- </style> -->


</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">	
<div class="right">
	<h3>待詢價採購單</h3><span style="color:red; font-size:20px;">${errors.error}</span>
	<form action="<c:url value="/Po/queryinsert.controller"/>" method="post">
	<c:if test="${not empty query}">		
	
	<select name="vendor_ID">
	<c:forEach var="queryVendor" items="${AllPO_Vendor1}">
	<c:set var="ven" value="ven001"></c:set>
	<c:if test="${queryVendor.vendor_id != ven}">	
	<option value="${queryVendor.vendor_id}">${queryVendor.vendor_name}</option>
	</c:if>
	</c:forEach>
 	</select>
 	
	<table class="table table-striped table-hover" id="myTable">				
				<thead>
				<tr>
					<th>採購單ID</th>
					<th>料號</th>
					<th>品名</th>
					<th>採購數量</th>
					
<!-- 					<th>廠商</th> -->
<!-- 					<th>請購單價</th> -->
<!-- 					<th>請購數量</th> -->
					<th>詢價單價</th>
				</tr>
				</thead>
				<tbody id='myTable'>
				<c:forEach var="pODetailBean" items="${allPO_Deatil}">
				<tr>
					<td><input type="hidden" name="po_ID" value="${query.po_id}">${query.po_id}</td>
					<td><input type="hidden" name="part_No" value="${pODetailBean.part_No}">${pODetailBean.part_No}</td>					
					<td><input type="hidden" name="pro_name" value="${pODetailBean.productListBean.pro_name}">${pODetailBean.productListBean.pro_name}</td>
					<td><input type="hidden" name="total_Qty" value="${pODetailBean.total_Qty}">${pODetailBean.total_Qty}</td>	
									
<%-- 					<td><input type="hidden" name="pro_price" value="${appDetailQuery.pro_price}">${appDetailQuery.pro_price}</td>					 --%>
<%-- 					<td><input type="hidden" name="app_amount" value="${appDetailQuery.app_amount}">${appDetailQuery.app_amount}</td> --%>
<!-- 					<td><select name="vendor_ID"> -->
<%-- 							<c:forEach var="queryVendor" items="${AllPO_Vendor1}"> --%>
<%-- 								<option value="${queryVendor.vendor_id}">${queryVendor.vendor_name}</option> --%>
<%-- 							</c:forEach> --%>
<!-- 					</select></td> -->
					<td><input type="text" name="po_totalprice" required></td>
					<td>${errors.po_totalprice}</td>
				</tr>				
			</c:forEach>
			</tbody>
			</table>			
			
			<input type="hidden" name="po_sta" value="${po_sta}">
			<input type="hidden" name="po_id" value="${po_id}">
			<input type="hidden" name="po_manger" value="${po_manger}">
<!-- 			<input id="submit" type="submit" name="send" value="新增"> -->
			<button id='submit' class='btn btn-default' value=''>新增</button>
						
			</c:if>
			</form>	
			</div>
		<script src="../js/app.js"></script>
</body>
</html>