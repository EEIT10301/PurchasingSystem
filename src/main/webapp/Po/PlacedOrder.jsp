<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待收貨採購單</title>
</head>
<body>
	<c:if test='${not empty noPlacedOrderList}'>
		<h2>${noApplylist}</h2>
	</c:if>

	<c:if test='${not empty placedOrderList}'>
		<h3>待收貨表單</h3>
	
	<c:forEach var='placedOrderList' items='${placedOrderList}'>
		<form action="<c:url value="/Po/placedOrderDetail.controller"/>"
			method="post">
			<p>採購單號:${placedOrderList.po_id}</p>
			<p>出貨時間:${placedOrderList.pO_MainBean.shipping_Date}</p>
<%-- 			<c:forEach var='placedOrderListInfo' items='${placedOrderListInfo}'> --%>
<%-- 			<c:if test='${placedOrderListInfo.po_id == placedOrderListInfo.po_id}'> --%>
<%-- 			<p>出貨時間:${placedOrderListInfo.sig_date}</p> --%>
<%-- 			</c:if> --%>
<%-- 			</c:forEach> --%>
			
			<input type='hidden' name='po_manger' value='${placedOrderList.po_manger}'>
			<input type='hidden' name='po_sta' value='${placedOrderList.po_sta}'>
			<input type='hidden' name='po_id' value='${placedOrderList.po_id}'>
			<input type='hidden' name='sig_date' value='${placedOrderList.sig_date}'>
			<input type='hidden' name='sig_sta' value='${placedOrderList.sig_sta}'>
			<input type='hidden' name='sig_sug' value='${placedOrderList.sig_sug}'>
			<input type='hidden' name='sig_rank' value='${placedOrderList.sig_rank}'>
			<input type="submit" value="收貨">
		</form>
	</c:forEach>
	</c:if>
</body>
</html>