<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty appmain}">
		<h2>${pomain.po_id}</h2>
		<form action="" method="post">
			<c:forEach var="pomaindetail" items="${pomain.pO_DetailBean}">
			<p>料號:${pomaindetail.part_No}</p>
			<p>市價:${pomaindetail.market_Price}</p>
			<p>總數量:${pomaindetail.total_Qty}</p>
			</c:forEach>
		</form>
	</c:if>
	<c:if test="${not empty appmain}">
		<h2>${pomain.po_id}</h2>
		<form action="" method="post">
			<c:forEach var="pomaindetail" items="${pomain.pO_DetailBean}">
			<p>料號:${pomaindetail.part_No}</p>
			<p>市價:${pomaindetail.market_Price}</p>
			<p>總數量:${pomaindetail.total_Qty}</p>
			</c:forEach>
		</form>
	</c:if>
</body>
</html>