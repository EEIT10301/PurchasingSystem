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
<h2>請購單編號:${signedOrderDetail.po_id}</h2>
	<h2>下單產品明細</h2>
	<c:forEach var='signedOrderDetail' items='${signedOrderDetail.pO_DetailBean}'>
		<p>料號: ${signedOrderDetail.part_no}</p>
		<p>料號: ${signedOrderDetail.productListBean.pro_name}</p>
<%-- 		<p>產品平均單價: ${signedOrderDetail.pro_price}</p> --%>
<%-- 		<p>請購數量: ${signedOrderDetail.app_amount}</p> --%>
<%-- 		<p>該項總金額: ${signedOrderDetail.app_amount*partlist.pro_price}元整</p> --%>
	</c:forEach>
</body>
</html>