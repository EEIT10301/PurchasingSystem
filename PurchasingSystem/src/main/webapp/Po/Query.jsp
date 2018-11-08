<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增詢價單</title>
</head>
<body>
	<%-- 	<form action="<c:url value="/Po/queryinsert.controller"/>" --%>
	<!-- 		method="post"> -->
	<%-- 		<c:if test="${not empty query}"> --%>
	<!-- 			<table border="1"> -->
	<!-- 				<tr> -->
	<!-- 					<th>採購單ID</th> -->
	<!-- 					<th>廠商</th> -->
	<!-- 					<th>總價</th> -->
	<!-- 					<th></th> -->
	<!-- 				</tr> -->
	<!-- 				<tr> -->
	<%-- 					<td><input type="hidden" name="po_ID" value="${query.po_id}">${query.po_id}</td> --%>

	<!-- 					<td><select name="vendor_ID"> -->
	<%-- 							<c:forEach var="queryVendor" items="${AllPO_Vendor1}"> --%>
	<%-- 								<option value="${queryVendor.vendor_id}">${queryVendor.vendor_name}</option> --%>
	<%-- 							</c:forEach> --%>
	<!-- 					</select></td> -->
	<!-- 					<td><input type="text" name="po_totalprice"></td> -->
	<!-- 				</tr> -->
	<!-- 			</table> -->
	<%-- 			<input type="hidden" name="po_sta" value="${po_sta}"> --%>
	<%-- 			<input type="hidden" name="po_id" value="${po_id}"> --%>
	<%-- 			<input type="hidden" name="po_manger" value="${po_manger}"> --%>
	<!-- 			<input type="submit" name="send" value="新增"> -->
	<%-- 		</c:if> --%>
	<!-- 	</form> -->

			
	<form action="<c:url value="/Po/queryinsert.controller"/>" method="post">
	<c:if test="${not empty query}">		
	<table border="1">					
				<tr>
					<th>採購單ID</th>
					<th>料號</th>
					<th>品名</th>
					<th>採購數量</th>
					<th>廠商</th>
					<th>單價</th>

				</tr>
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
					<td><input type="text" name="quotation"></td>				
				</tr>				
			</c:forEach>
			</table>			
			
			<input type="hidden" name="po_sta" value="${po_sta}">
			<input type="hidden" name="po_id" value="${po_id}">
			<input type="hidden" name="po_manger" value="${po_manger}">
			<input type="submit" name="send" value="新增">
						
			</c:if>
			</form>	
</body>
</html>