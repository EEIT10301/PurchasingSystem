<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../AppInclude.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待簽核請購單</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#thead{
font-size: 36px;
}

#submit {
	position: absolute;
	right: 700px;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}
</style>
</head>
<body class="bg">
<div class="right">
<c:if test="${not empty thispro}">
<div class='container'>
<h4 align="center" >請購單編號:${appmain.app_id}</h4><br/>
<h3 align="center">簽核中請購單</h3>
<table class="table table-striped table-hover">
<thead>
<tr>
<!-- <th class='text-center' colspan='6'></th> -->
<th>簽核人</th>
<th>職稱</th>
<th>申請人</th>
<th>請購預估總金額</th>
<th>提案意見</th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<td><font color='red'>${user.emp_name}簽核中</font></td>
<td> ${user.emp_dep} ${user.emp_job}</td>
<td>${appmain.employeeBean.emp_name}</td>
<td> ${appmain.app_price}</td>

<c:forEach var='appsign' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsign.sig_rank==1}">
<td>${appsign.sig_sug} </td>
</c:if>
</c:forEach>
</tr>
<tr>
<th class='text-center' colspan='5'>請購商品明細</th>
</tr>
<tr>
<th >料號</th>
<th >物料名稱</th>
<th >物料平均價格</th>
<th >物料請購數量</th>
<th >該項預估請購總金額</th>
</tr>
<c:forEach var='appdetail' varStatus='vs' items='${appDetail}'>
<tr>
<td>${appdetail.part_no} </td>
<td>${appdetail.productListBean.pro_name} </td>
<td>${appdetail.pro_price} </td>
<td>${appdetail.app_amount} </td>
<td>${appdetail.app_amount*appdetail.pro_price} 元整 </td>
</tr>
</c:forEach>
<tr>
<th class='text-center' colspan='5'>簽核流程</th>
</tr>
<tr>
<th>簽核順序</th>
<th>簽核情形</th>
<th>職稱</th>
<th>簽核時間</th>
<th>簽核建議</th>
</tr>
<tr>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==1}">
<td>1</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<td>${appsignpro.sig_date} </td>
<td>${appsignpro.sig_sug} </td>
</c:if>
</c:forEach>
</tr>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==2}">
<tr>
<td>2</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<c:if test="${not empty appsignpro.sig_date}">
<td>${appsignpro.sig_date} </td>
<td>${appsignpro.sig_sug} </td>
</c:if>
</tr>
</c:if>
</c:forEach>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<tr>
<c:if test="${appsignpro.sig_rank==3}">
<td>3</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<c:if test="${not empty appsignpro.sig_date}">
<td>${appsignpro.sig_date} </td>
<td>${appsignpro.sig_sug} </td>
</c:if>
</c:if>
</tr>
</c:forEach>
</tbody>
</table>
<form action="<c:url value="/Apply/applysignss.controller" />" method="post">
<Input type='hidden' name='app_manger' value='${thispro.app_manger}'>
<Input type='hidden' name='app_sta' value='${thispro.app_sta}'>
<Input type='hidden' name='app_id' value='${thispro.app_id}'>
<Input type='hidden' name='sig_date' value='${thispro.sig_date}'>
<Input type='hidden' name='sig_sta' value='${thispro.sig_sta}'>
<Input type='hidden' name='sig_sug' value='${thispro.sig_sug}'>
<Input type='hidden' name='sig_rank' value='${thispro.sig_rank}'>
簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
</textarea><font color="red">${error.plz}</font><p>
<Input type='submit' name='send' value='${sendsubmit1}'>
<Input type='submit' name='send' value='${sendsubmit2}'>
</form>
</div>
</c:if>


<c:if test="${not empty nothispro}">
<div class='container'>

<h4 align="center">退回中請購單 </h4><br/>
<h4 align="center">請購單編號:${appmain.app_id} </h4><br/>
<table class="table table-striped table-hover">
<thead>
<tr>
<!-- <th class='text-center' colspan='6'></th> -->
<th>簽核人</th>
<th>職稱</th>
<th>退回人</th>
<th>職稱</th>
<th>退回時間</th>
<th>退回意見</th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<td><font color='red'>${user.emp_name} 修改中</font></td>
<td>${user.emp_dep} ${user.emp_job}</td>
<td>${nobeforepro.employeeBean.emp_name}</td>
<td>${nobeforepro.employeeBean.emp_dep} ${nobeforepro.employeeBean.emp_job}</td>
<td>${nobeforepro.sig_date}</td>
<td>${nobeforepro.sig_sug}</td>
</tr>
<tr>
<!-- <th class='text-center' colspan='6'></th> -->

<th>申請人</th>
<th>申請人職稱</th>
<th>請購項目</th>
<th>請購單預估總價格</th>
<th>追交期</th>
<th>提案內容</th>
</tr>
<tr>
<td>${appmain.employeeBean.emp_name}</td>
<td>${appmain.employeeBean.emp_dep} ${appmain.employeeBean.emp_job}</td>
<td>${appmain.pro_cate}</td>
<td>${appmain.app_price}</td>
<td>${appmain.app_GetDate}</td>
<c:forEach var='appsign' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsign.sig_rank==1}">
<td>${appsign.sig_sug} </td>
</c:if>
</c:forEach>
</tr>

<tr>
<th class='text-center' colspan='5'>請購商品明細</th>
<th></th>
</tr>
<tr>
<th >料號</th>
<th >物料名稱</th>
<th >物料平均價格</th>
<th >物料請購數量</th>
<th >該項預估請購總金額</th>
<th></th>
</tr>
<c:forEach var='appdetail' varStatus='vs' items='${appDetail}'>
<tr>
<td>${appdetail.part_no} </td>
<td>${appdetail.productListBean.pro_name} </td>
<td>${appdetail.pro_price} </td>
<td>${appdetail.app_amount} </td>
<td> ${appdetail.app_amount*appdetail.pro_price} 元整 </td>
<td></td>
</tr>
</c:forEach>
<tr>
<th class='text-center' colspan='5'>簽核流程</th>
<th></th>
</tr>
<tr>
<th>簽核順序</th>
<th>簽核情形</th>
<th>職稱</th>
<th>簽核時間</th>
<th>簽核建議</th>
<th></th>
</tr>
<tr>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==1}">
<td>1</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<td>${appsignpro.sig_date} </td>
<td>${appsignpro.sig_sug} </td>
<td></td>
</c:if>
</c:forEach>
</tr>
<tr>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==2}">
<td>2</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<c:if test="${not empty appsignpro.sig_date}">
<td>${appsignpro.sig_date} </td>
<td>${appsignpro.sig_sug} </td>
<td></td>
</c:if>
</c:if>
</c:forEach>
</tr>
<tr>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==3}">
<c:if test="${appsignpro.sig_sta=='未簽核' or appsignpro.sig_sta=='簽核中'}">
<td>3</td>
<td>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</td>
<td>${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</td>
<c:if test="${not empty appsignpro.sig_date}">
<td> ${appsignpro.sig_date}</td>
<td>${appsignpro.sig_sug} </td>
<td></td>
</c:if>
</c:if>
</c:if>
</c:forEach>
</tr>
</tbody>
</table>

<form action="<c:url value="/Apply/applysignss.controller" />" method="post">
<Input type='hidden' name='app_manger' value='${nothispro.app_manger}'>
<Input type='hidden' name='app_sta' value='${nothispro.app_sta}'>
<Input type='hidden' name='app_id' value='${nothispro.app_id}'>
<Input type='hidden' name='sig_date' value='${nothispro.sig_date}'>
<Input type='hidden' name='sig_sta' value='${nothispro.sig_sta}'>
<Input type='hidden' name='sig_sug' value='${nothispro.sig_sug}'>
<Input type='hidden' name='sig_rank' value='${nothispro.sig_rank}'>
簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
</textarea><font color="red">${error.plz}</font><p>
<Input type='submit' name='send' value='${sendsubmit1}'>
<Input type='submit' name='send' value='${sendsubmit2}'>
</form>
</div>
</c:if>

<script src="../js/app.js"></script>
</div>
</body>
</html>