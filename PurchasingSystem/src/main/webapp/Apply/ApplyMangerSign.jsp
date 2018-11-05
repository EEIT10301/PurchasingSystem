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

<title>Insert title here..11111.</title>
</head>
<body>
<c:if test='${not empty noApplylist}'>
<h2>${noApplylist}</h2>
</c:if>

<c:if test='${not empty Applylists}'>
<h3>待簽核表單</h3>
<c:forEach var='applylist' varStatus='vs' items='${Applylists}'>

 <p>請購單號 :${applylist.app_id}</p>
 <p>請購項目 :${applylist.app_MainBean.pro_cate}</p>
 <p>請購金額 :${applylist.app_MainBean.app_price}</p>

<a href='ApplySignnerdetail.controller?app_manger=${applylist.app_manger}&app_sta=${applylist.app_sta}&app_id=${applylist.app_id}&send=sendok'>
開始簽核</a>
 <c:forEach var='applylistone' varStatus='vs' items='${Applylistsone}'>
 <c:if test='${applylist.app_id == applylistone.app_id}'>
   <p>前一位簽核時間: ${applylistone.sig_date}<P>
   <br>
 </c:if>
 </c:forEach>
</c:forEach>

</c:if>

<c:if test='${not empty nosend}'>
<h3>退回表單</h3>
<c:forEach var='nosends' varStatus='vs' items='${nosend}'>

 <p>請購單號 :${nosends.app_id}</p>
 <p>請購項目 :${nosends.app_MainBean.pro_cate}</p>
 <p>請購金額 :${nosends.app_MainBean.app_price}</p>
<a href='ApplySignnerdetail.controller?app_manger=${nosends.app_manger}&app_sta=${nosends.app_sta}&app_id=${nosends.app_id}&send=nosend'>
開始簽核</a> 

  <p>前一位退回時間: ${nosends.sig_date}<P>
    <br>
</c:forEach>
</c:if>
<p>
頁數:
<c:forEach var='i' begin='1' end='${pages}'>
<a href='toApplySignnerdetailpages.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a>
</c:forEach>
<p>

</body>
</html>