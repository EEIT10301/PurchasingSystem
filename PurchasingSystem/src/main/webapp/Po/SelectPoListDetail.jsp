<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="Query.jsp" flush="false"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href='<c:url value="sendsc.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />'>
      新增詢價紀錄</a>
<a href='<c:url value="posendlistsign.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />'>
      送出審核</a> 
      
<c:if test="${not empty queryss}">
<c:forEach var="querysss" items="${queryss}">
<p>${querysss.po_ID}</p>
<p>${querysss.vendor_ID}</p>
<p>${querysss.po_querydate}</p>
<p>${querysss.po_totalprice}</p>
</c:forEach>
</c:if>



</body>
</html>