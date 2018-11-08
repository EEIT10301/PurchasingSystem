<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購單狀態</title>
</head>
<body>
<c:if test="${not empty POLists}">
<c:forEach  var="POLists" items="${POLists}">
<form action="<c:url value="/Po/POSignStatementDetail.controller"/>" method="post">

<p>採購單號 :${POLists.po_id}</p>
<p>起單時間 :${POLists.sig_date}</p>
  <Input type='hidden' name='po_manger' value='${POLists.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${POLists.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${POLists.po_id}'><P/>
  <Input type='hidden' name='sig_date' value='${POLists.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${POLists.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${POLists.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${POLists.sig_rank}'><P/>
  <Input type='submit' name='send' value='查詢採購進度'>
</form>
</c:forEach>
</c:if>


<c:if test='${not empty thispage}'>
第 ${thispage} 頁
</c:if>

<c:if test='${empty thispage}'>
第 1 頁
</c:if>
<c:forEach var='i' begin='1' end='${pages}'>
<a href='POSignStatement.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a>
</c:forEach>


</body>
</html>