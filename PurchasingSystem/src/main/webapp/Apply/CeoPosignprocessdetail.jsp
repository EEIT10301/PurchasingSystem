<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../CeoInclude.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>總經理採購單審核</title>
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
<body>
<body class="bg">
<c:if test="${not empty thispro}">
<div class="right">
<div class='container'>
<h4 align="center" >採購單編號:${pomainlist.po_id}</h4><br/>
<h5 align="center">簽核中採購單</h5>
<table class="table table-striped table-hover">
<thead>
<tr>
<!-- <th class='text-center' colspan='6'></th> -->
<th>簽核人</th>
<th>職稱</th>
<th>申請人</th>
<th>採購預估總價格</th>
<th>詢價建議</th>
<th></th>
<th></th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<td><font color='red'>${user.emp_name}簽核中</font></td>
<td> ${user.emp_dep} ${user.emp_job}</td>
<td> ${pomainlist.employeeBean.emp_name}</td>
<td> ${pomainlist.total_price}</td>
<c:forEach var='posign' varStatus='vs' items='${posignprocess}'>
<c:if test="${posign.sig_rank==3}">
<td> ${posign.sig_sug} </td>
<td></td>
<td></td>
</c:if>
</c:forEach>
</tr>
<tr>
<th class='text-center' colspan='7'>採購單明細</th>
</tr>
<tr>
<th >料號</th>
<th >物料名稱</th>
<th >物料市場價格</th>
<th >物料採購價格</th>
<th >物料請購數量</th>
<th >物料採購數量</th>
<th >該項預估請購總金額</th>
</tr>
<c:forEach var='podetail' varStatus='vs' items='${podetail}'>
<tr>
<td>${podetail.part_No} </td>
<td>${podetail.productListBean.pro_name} </td>
<td> ${podetail.market_Price} </td>
<td>${podetail.total_Price} </td>
<td>${podetail.total_Qty} </td>
<td>${podetail.quotation} </td>
<td>${podetail.quotation*podetail.total_Price} 元整 </td>
</tr>
</c:forEach>
<tr>
<th class='text-center' colspan='7'>詢價紀錄</th>
</tr>
<tr>
<th></th>
<th></th>
<th >廠商名稱</th>
<th >詢價時間</th>
<th >詢價總價</th>
<th></th>
<th></th>
</tr>
<c:forEach var='poquerys' varStatus='vs' items='${poquery}'>
<tr>
<td></td>
<td></td>
<td> ${poquerys.pO_Vendor_InfoBean.vendor_name} </td>
<td> ${poquerys.po_querydate} </td>
<td> ${poquerys.po_totalprice} </td>
<td></td>
<td></td>
</tr>
</c:forEach>
<tr>
<th class='text-center' colspan='7'>選擇廠商</th>
</tr>
<tr>
<td class='text-center' colspan='7'>${pomainlist.pO_Vendor_InfoBean.vendor_name}</td>
</tr>
<tr>
<th class='text-center' colspan='5'>簽核流程</th>
<th ></th>
<th ></th>
</tr>
<tr>
<th>簽核順序</th>
<th>簽核情形</th>
<th>職稱</th>
<th>簽核時間</th>
<th>簽核建議</th>
<th></th>
<th></th>
<th></th>
</tr>

<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==3}">
<tr>
<td>1</td>
<td>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</td>
<td>${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</td>
<td>${posignpro.sig_date} </td>
<td>${posignpro.sig_sug} </td>
<td></td>
<td></td>
<td></td>
</tr>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==4}">
<tr>
<td>2</td>
<td>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</td>
<td>${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</td>
<c:if test="${not empty posignpro.sig_date}">
<td>${posignpro.sig_date} </td>
<td>${posignpro.sig_sug} </td>
<td></td>
<td></td>
<td></td>
</c:if>
</tr>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==5}">
<c:if test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}">
<tr>
<td>3</td>
<td>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</td>
<td>${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</td>
<c:if test="${not empty posignpro.sig_date}">
<td>${posignpro.sig_date} </td>
<td>${posignpro.sig_sug} </td>
<td></td>
<td></td>
<td></td>
</c:if>
<c:if test="${ empty posignpro.sig_date}">
<td> </td>
<td></td>
<td></td>
<td></td>
<td></td>
</c:if>
</tr>
</c:if>
</c:if>
</c:forEach>
</tbody>
</table>

<form action="<c:url value="/Po/POManagerSignertosigndetail.controller" />" method="post">
<Input type='hidden' name='po_manger' value='${thispro.po_manger}'>
<Input type='hidden' name='po_sta' value='${thispro.po_sta}'>
<Input type='hidden' name='po_id' value='${thispro.po_id}'>
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
</div>
</c:if>


</body>
</html>