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
<title>請購進度查詢</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- <input class="form-control" id="myInput" type="text" placeholder="Search"><br/> -->
<c:if test='${not empty noApplylist}'>
<h4>${noApplylist}</h4>
</c:if>
<c:if test='${not empty Applylists}'>
<table class="table table-striped table-hover">
<thead>
<tr>
<th class='text-center' colspan='6'>請購進度查詢</th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<th>請購單號</th>
<th>起單時間</th>
<th>申請部門</th>
<th>申請人</th>
<th></th>
</tr>
<c:forEach var='applylist' varStatus='vs' items='${Applylists}'>
<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
  <tr>
 <td>${applylist.app_id}</td>
 <td>${applylist.sig_date}</td>
 <td>${applylist.app_MainBean.employeeBean.emp_dep}</td>
 <td>${applylist.app_MainBean.employeeBean.emp_name} ${applylist.app_MainBean.employeeBean.emp_job}</td>
 <td> <Input type='submit' name='send' value='查詢請購進度'></td>
  <td><Input type='hidden' name='app_manger' value='${applylist.app_manger}'>
  <Input type='hidden' name='app_sta' value='${applylist.app_sta}'>
  <Input type='hidden' name='app_id' value='${applylist.app_id}'>
  <Input type='hidden' name='sig_date' value='${applylist.sig_date}'>
  <Input type='hidden' name='sig_sta' value='${applylist.sig_sta}'>
  <Input type='hidden' name='sig_sug' value='${applylist.sig_sug}'>
  <Input type='hidden' name='sig_rank' value='${applylist.sig_rank}'></td>
   </tr>
  </form>
</c:forEach>
  </tbody>
</table>

<c:if test='${not empty thispage}'>
第 ${thispage} 頁
</c:if>
<c:if test='${empty thispage}'>
第 1 頁
</c:if>
頁數:
<c:forEach var='i' begin='1' end='${pages}'>
<a href='toApplySignpropage.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a>
</c:forEach>
</c:if>
<script src="../js/app.js"></script>
</body>
</html>