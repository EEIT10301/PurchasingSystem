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

<title>待簽核請購單</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
<c:if test='${not empty noApplylist}'>
<h2>${noApplylist}</h2>
</c:if>

<c:if test='${not empty Applylists}'>
<table class="table table-striped table-hover">
<thead>
<tr>
<th>待簽核表單</th>
<th></th>
<th></th>
<th></th>
<th></th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<th>請購單號</th>
<th>請購項目</th>
<th>請購金額</th>
<th>前一位簽核時間</th>
<th></th>
</tr>
<c:forEach var='applylist' varStatus='vs' items='${Applylists}'>
<tr>
 <td>${applylist.app_id}</td>
 <td>${applylist.app_MainBean.pro_cate}</td>
 <td>${applylist.app_MainBean.app_price}</td>

 <c:forEach var='applylistone' varStatus='vs' items='${Applylistsone}'>
 <c:if test='${applylist.app_id == applylistone.app_id}'>
  <td> ${applylistone.sig_date}</td>
 </c:if>
 </c:forEach>
<td><a href='ApplySignnerdetail.controller?app_manger=${applylist.app_manger}&app_sta=${applylist.app_sta}&app_id=${applylist.app_id}&send=sendok'>
開始簽核</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>

<c:if test='${not empty nosend}'>
<table class="table table-striped table-hover">
<thead>
<tr>
<th>退回表單</th>
<th></th>
<th></th>
<th></th>
<th></th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<th>請購單號</th>
<th>請購項目 </th>
<th>請購金額 </th>
<th>前一位退回時間</th>
<th></th>
</tr>
<c:forEach var='nosends' varStatus='vs' items='${nosend}'>
<tr>
<td>${nosends.app_id}</td>
 <td>${nosends.app_MainBean.pro_cate}</td>
 <td>${nosends.app_MainBean.app_price}</td>
<td>${nosends.sig_date}</td>
<td><a href='ApplySignnerdetail.controller?app_manger=${nosends.app_manger}&app_sta=${nosends.app_sta}&app_id=${nosends.app_id}&send=nosend'>
開始簽核</a></td>
 </tr>
</c:forEach>
</tbody>
</table>
</c:if>

<p>
<c:if test='${not empty thispage}'>
第 ${thispage} 頁
</c:if>
<c:if test='${empty thispage}'>
第 1 頁
</c:if>
頁數:
<c:forEach var='i' begin='1' end='${pages}'>
<a href='toApplySignnerdetailpages.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a>
</c:forEach>
<p>
<script src="../js/app.js"></script>
</body>
</html>