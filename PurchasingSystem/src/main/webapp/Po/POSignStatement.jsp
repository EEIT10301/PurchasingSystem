<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../POInclude.jsp"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購單狀態</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="../css/POcss.css">
</head>
<body class="bg">



<div class="right">
<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>

<c:if test="${not empty POList}">
<h2>採購單狀態</h2>
<table class="table table-striped table-hover" id="myTable">


<tr>
<th>採購單號</th>
<th>開始時間</th>
</tr>
<c:forEach  var="POLists" items="${POList}">

<tr>
<td><a href="<c:url value="/Po/POSignStatementDetail.controller?po_id=${POLists.po_id}"/>">${POLists.po_id}</a></td>
<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${POLists.sig_date}"/></td>


<td><Input type='hidden' name=po_manger value='${POLists.po_manger}'></td>
<td><Input type='hidden' name='po_sta' value='${POLists.po_sta}'></td>
<td><Input type='hidden' name='po_id' value='${POLists.po_id}'></td>
<td><Input type='hidden' name='sig_date' value='${POLists.sig_date}'></td>
<td><Input type='hidden' name='sig_sta' value='${POLists.sig_sta}'></td>
<td><Input type='hidden' name='sig_sug' value='${POLists.sig_sug}'></td>
<td><Input type='hidden' name='sig_rank' value='${POLists.sig_rank}'></td>
</tr>
</c:forEach>



</table>
</c:if>
</div>







<%-- <c:if test="${not empty POList}"> --%>
<%-- <c:forEach  var="POLists" items="${POList}"> --%>
<%-- <form action="<c:url value="/Po/POSignStatementDetail.controller"/>" method="post"> --%>

<%-- <p>採購單號 :${POLists.po_id}</p> --%>
<%-- <p>產生時間 :${POLists.sig_date}</p> --%>
<%--   <Input type='hidden' name=po_manger value='${POLists.po_manger}'><P/> --%>
<%--   <Input type='hidden' name='po_sta' value='${POLists.po_sta}'><P/> --%>
<%--   <Input type='hidden' name='po_id' value='${POLists.po_id}'><P/> --%>
<%--   <Input type='hidden' name='sig_date' value='${POLists.sig_date}'><P/> --%>
<%--   <Input type='hidden' name='sig_sta' value='${POLists.sig_sta}'><P/> --%>
<%--   <Input type='hidden' name='sig_sug' value='${POLists.sig_sug}'><P/> --%>
<%--   <Input type='hidden' name='sig_rank' value='${POLists.sig_rank}'><P/> --%>
<!--   <Input type='submit' name='send' value='查詢採購進度'> -->
<!-- </form> -->
<%-- </c:forEach> --%>
<%-- </c:if> --%>


<%-- <c:if test='${not empty thispage}'> --%>
<%-- 第 ${thispage} 頁 --%>
<%-- </c:if> --%>

<%-- <c:if test='${empty thispage}'> --%>
<!-- 第 1 頁 -->
<%-- </c:if> --%>
<%-- <c:forEach var='i' begin='1' end='${pages}'> --%>
<%-- <a href='POSignStatement.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a> --%>
<%-- </c:forEach> --%>


</body>
<script src="../js/app.js"></script>
</html>