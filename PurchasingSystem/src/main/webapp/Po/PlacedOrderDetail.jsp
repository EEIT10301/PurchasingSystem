<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待收貨單明細</title>
</head>
<body>
<h2>採購單編號:${pm.po_id}</h2>
<h2>收貨明細</h2>
<form action="<c:url value="/Po/receivedGoods.controller" />" method="post">
	<c:forEach var='poDetail' items='${poDetail}'>
	<p>料號: ${poDetail.part_No}</p>
	<p>產品名稱: ${poDetail.productListBean.pro_name}</p>
	<p>總數量: ${poDetail.total_Qty}</p>
	</c:forEach>
<%-- 	<c:forEach var='po_Sign' items='${po_Sign}'> --%>
		<input type='hidden' name='po_manger' value='${po_Sign.po_manger}'>
		<input type='hidden' name='po_sta' value='${po_Sign.po_sta}'>
		<input type='hidden' name='po_id' value='${po_Sign.po_id}'>
		<input type='hidden' name='sig_date' value='${po_Sign.sig_date}'>
		<input type='hidden' name='sig_sta' value='${po_Sign.sig_sta}'>
		<input type='hidden' name='sig_sug' value='${po_Sign.sig_sug}'>
		<input type='hidden' name='sig_rank' value='${po_Sign.sig_rank}'>
<%-- 	</c:forEach> --%>
收貨意見:<p><textarea rows="5" cols="50" name="signSug"></textarea></p>
實際收貨時間:<input type="datetime" name="shippingDate">
<p><input type="submit" name="send" value="確認收貨">
</form>	
</body>
</html>