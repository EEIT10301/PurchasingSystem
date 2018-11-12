<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>待審核採購單</title>
</head>
<body class="bg">
<c:if test='${not empty nopolist}'>
<h2>${nopolist}</h2>
</c:if>

<c:if test='${not empty PO_SignSend}'>
<h3>待簽核表單</h3>
<div class="right">
<table id="myTable" class="table table-striped table-hover">
<thead>
	<tr>
		<th>採購單號</th>
		<th>廠商名稱</th>
		<th>採購金額</th>
		<th>主管簽核時間</th>
	</tr>
</thead>
<tbody>
<c:forEach var='polists' varStatus='vs' items='${PO_SignSend}'>
<tr>
	<td>${polists.po_id}</td>
	<td>${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
	<td>${polists.pO_MainBean.total_price}</td>
 	<c:forEach var='polistone' varStatus='vs' items='${PO_SignSendRank}'>
 	<c:if test='${polists.po_id == polistone.po_id}'>
   	<td>${polistone.sig_date}</td>
   	<br>
 	</c:if>
	</c:forEach>
<td><a href='<c:url value="POManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=sendok" />'>
     開始簽核</a></td>	
</tr>
 </c:forEach>
</tbody>
</table>
</div>
</c:if>

<c:if test='${not empty PO_SignBack}'>
<h3>退回表單</h3>
<div class="right">
<table id="myTable" class="table table-striped table-hover">
<thead>
	<tr>
		<th>採購單號</th>
		<th>廠商名稱</th>
		<th>採購金額</th>
		<th>主管簽核時間</th>		
	</tr>
</thead>
<tbody>
<c:forEach var='polists' varStatus='vs' items='${PO_SignBack}'>
<tr>
<td>${polists.po_id}</td>
<td>${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
<td>${polists.pO_MainBean.total_price}</td>
 	<c:forEach var='polistone' varStatus='vs' items='${PO_SignBackRank}'>
 	<c:if test='${polists.po_id == polistone.po_id}'>
   	<td>前一位退回時間: ${polistone.sig_date}</td>
   	<br>
 	</c:if>
 	</c:forEach>
	<td><a href='<c:url value="POManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=nosend" />'>
     開始簽核</a></td>
 </tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>

<!-- <p> -->
<%-- <c:if test='${not empty thispage}'> --%>
<%-- 第 ${thispage} 頁 --%>
<%-- </c:if> --%>
<%-- <c:if test='${empty thispage}'> --%>
<!-- 第 1 頁 -->
<%-- </c:if> --%>
<!--   頁數:  -->
<%-- <c:forEach var='i' begin='1' end='${pages}'> --%>
<%-- <a href='POManagerSignerpages.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a> --%>
<%-- </c:forEach> --%>
<!-- <p> -->
<script src="../js/app.js"></script>
</body>
</html>