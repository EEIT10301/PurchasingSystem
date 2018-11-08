<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待下單明細</title>
</head>
<body>
<%-- <h2>請購單編號:${signedOrderDetail.po_id}</h2> --%>
<h2>採購單編號:${pm.po_id}</h2>
	<h2>下單產品明細</h2>	
	<form action="<c:url value="/Po/signedOrderSubmit.controller" />" method="post">
<%-- 	<c:forEach var='signedOrderDetails' items='${signedOrderDetail}'> --%>

<%-- 		<p>廠商名稱: ${signedOrderDetails.pO_Vendor_InfoBean.vendor_name}</p> --%>
<%-- 		<p>料號: ${signedOrderDetails.pO_DetailBean.part_No}</p> --%>
<%-- 		<p>產品名稱: ${signedOrderDetails.pO_DetailBean.productListBean.pro_name}</p> --%>
<%-- 		<p>單價: ${signedOrderDetails.pO_DetailBean.quotation}</p> --%>
<%-- 		<p>總價: ${signedOrderDetails.pO_DetailBean.total_Price}</p> --%>
<%-- 		<p>總數量: ${signedOrderDetails.pO_DetailBean.total_Qty}</p> --%>
<%-- 		</c:forEach> --%>

		<c:forEach var='poDetail' items='${poDetail}'>
		<p>廠商名稱: ${poDetail.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</p>
		<p>料號: ${poDetail.part_No}</p>
		<p>產品名稱: ${poDetail.productListBean.pro_name}</p>
		<p>單價: ${poDetail.quotation}</p>
		<p>總價: ${poDetail.total_Price}</p>
		<p>總數量: ${poDetail.total_Qty}</p>
		</c:forEach>
		
<%-- 		<c:forEach var='po_Sign' items='${po_Sign}'> --%>
		<input type='hidden' name='po_manger' value='${po_Sign.po_manger}'>
		<input type='hidden' name='po_sta' value='${po_Sign.po_sta}'>
		<input type='hidden' name='po_id' value='${po_Sign.po_id}'>
		<input type='hidden' name='sig_date' value='${po_Sign.sig_date}'>
		<input type='hidden' name='sig_sta' value='${po_Sign.sig_sta}'>
		<input type='hidden' name='sig_sug' value='${po_Sign.sig_sug}'>
		<input type='hidden' name='sig_rank' value='${po_Sign.sig_rank}'>
<%-- 		</c:forEach> --%>
下單意見:<p><textarea rows="5" cols="50" name="signSug"></textarea></p>
預計出貨時間:<input type="datetime" name="shippingDate">
<p><input type="submit" name="send" value="送出">
		</form>



</body>
</html>