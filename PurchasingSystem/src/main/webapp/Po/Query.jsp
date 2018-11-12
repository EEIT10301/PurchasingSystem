<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增詢價單</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style type="text/css">
#thead{
font-size: 36px;
}

#submit {
	position: absolute;
	right: 700px;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}
</style>


</head>
<body class="bg">
	
<div class="right">
	<form action="<c:url value="/Po/queryinsert.controller"/>" method="post">
	<c:if test="${not empty query}">		
	<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
	<table class="table table-striped table-hover" id="myTable">				
				<thead>
				<tr>
					<th>採購單ID</th>
					<th>料號</th>
					<th>品名</th>
					<th>採購數量</th>
					<th>廠商</th>
					<th>單價</th>
				</tr>
				</thead>
				<tbody id='myTable'>
				<c:forEach var="pODetailBean" items="${allPO_Deatil}">
				<tr>
					<td><input type="hidden" name="po_ID" value="${query.po_id}">${query.po_id}</td>
					<td><input type="hidden" name="part_No" value="${pODetailBean.part_No}">${pODetailBean.part_No}</td>					
					<td><input type="hidden" name="pro_name" value="${pODetailBean.productListBean.pro_name}">${pODetailBean.productListBean.pro_name}</td>
					<td><input type="hidden" name="total_Qty" value="${pODetailBean.total_Qty}">${pODetailBean.total_Qty}</td>					
					
					<td><select name="vendor_ID">
							<c:forEach var="queryVendor" items="${AllPO_Vendor1}">
								<option value="${queryVendor.vendor_id}">${queryVendor.vendor_name}</option>
							</c:forEach>
					</select></td>
					<td><input type="text" name="po_totalprice"></td>
				</tr>				
			</c:forEach>
			</tbody>
			</table>			
			
			<input type="hidden" name="po_sta" value="${po_sta}">
			<input type="hidden" name="po_id" value="${po_id}">
			<input type="hidden" name="po_manger" value="${po_manger}">
			<input id="submit" type="submit" name="send" value="新增">
						
			</c:if>
			</form>	
			</div>
		<script src="../js/app.js"></script>
</body>
</html>