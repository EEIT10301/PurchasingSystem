<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="Apply.service.*"%>
<%@ page import="Apply.model.*"%>
<%@ page import="Apply.dao.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test='${not empty noApplylist}'>
<h2>${noApplylist}</h2>
</c:if>
<c:if test='${not empty Applylists}'>
<c:forEach var='applylist' varStatus='vs' items='${Applylists}'>
<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
 <p>請購單號 :${applylist.app_id}</p>
 <p>起單時間 :${applylist.sig_date}</p>
<%--  <c:forEach var='applylistss' varStatus='vs' items='${Applylists}'> --%>
<%--  <c:if test='${applylistss.sig_rank==1 and applylist.app_id == applylistss.app_id}'> --%>
<%--  <p>申請時間 :${applylistss.sig_date}</p> --%>
<%--  </c:if> --%>
<%--  </c:forEach> --%>
 <Input type='hidden' name=app_manger value='${applylist.app_manger}'><P/>
  <Input type='hidden' name='app_sta' value='${applylist.app_sta}'><P/>
  <Input type='hidden' name='app_id' value='${applylist.app_id}'><P/>
  <Input type='hidden' name='sig_date' value='${applylist.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${applylist.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${applylist.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${applylist.sig_rank}'><P/>
  <Input type='submit' name='send' value='查詢請購進度'>
  </form>
</c:forEach>
<p>
頁數:
<c:forEach var='i' begin='1' end='${pages}'>
<a href='toApplySignpropage.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a>
</c:forEach>
<p>
</c:if>



</body>
</html>