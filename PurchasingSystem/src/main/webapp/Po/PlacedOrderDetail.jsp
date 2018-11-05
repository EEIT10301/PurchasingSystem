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
<form action="<c:url value="/Po/signedOrderSubmit.controller" />" method="post">
	<c:forEach var='poDetail' items='${poDetail}'>
	<p>料號: ${poDetail.part_No}</p>
	<p>產品名稱: ${poDetail.productListBean.pro_name}</p>
	<p>總數量: ${poDetail.total_Qty}</p>
	</c:forEach>
</form>	
</body>
</html>