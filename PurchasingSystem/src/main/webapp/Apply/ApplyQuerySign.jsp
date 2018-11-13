<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="Apply.service.*"%>
<%@ page import="Apply.model.*"%>
<%@ page import="Apply.dao.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ include file="../AppInclude.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請購單進度查詢</title>
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
<div class='container'>
	<h3 align="center">請購進度查詢</h3><br/>
<table class="table table-striped table-hover">
<thead>
<tr>
<th class='text-center' colspan='6'><h3>請購單</h3></th>
</tr>
</thead>
<tbody id="myTable">
<tr>
<th>請購單號</th>
<th>請購部門</th>
<th>請購同仁</th>
<th>請購項目</th>
<th>請購總價</th>
<th>追交期限</th>
</tr>
<tr>
<td>${app_Main.app_id}</td>
<td>${app_Main.employeeBean.emp_dep}</td>
<td>${app_Main.employeeBean.emp_name}${app_Main.employeeBean.emp_job}</td>
<td>${app_Main.pro_cate}</td>
<td>${app_Main.app_price}</td>
<td>${app_Main.app_GetDate}</td>
</tr>
<tr>
<th>請購料號</th>
<th>請購物料名稱</th>
<th>請購數量</th>
<th>請購預估價格</th>
<th>該項物料預估請購價格</th>
<th></th>
</tr>
<c:forEach var='queryapp' varStatus='vs' items='${app_Main.appDetailBean}'> 
 <tr>
<td>${queryapp.part_no}</td>
<td>${queryapp.productListBean.pro_name}</td>
<td>${queryapp.app_amount}</td>
<td>${queryapp.pro_price}</td>
<td>${queryapp.pro_price*queryapp.app_amount}</td>
<td></td>
</tr>
 
</c:forEach>
<tr>
<th class='text-center' colspan='6'><h3>簽核進度</h3></th>
</tr> 
<tr>
<th>請購流程</th>
<th>簽核人</th>
<th>簽核順序</th>
<th>簽核時間</th>
<th>進度</th>
<th>簽核意見</th>
</tr>
<c:forEach var='queryapp' varStatus='vs' items='${queryprocess}'>
<c:if test="${queryapp.sig_sta == '簽核中'  or queryapp.sig_sta == '退回中' }">

<tr>
<td><font color="red">${queryapp.app_sta}</font></td>
<td><font color="red">${queryapp.employeeBean.emp_name}</font></td>
<td><font color="red">${queryapp.sig_rank}</font></td>
<td><font color="red">${queryapp.sig_date}</font></td> 
<td><font color="red">${queryapp.sig_sta}</font></td>
<td><font color="red">${queryapp.sig_sug}</font></td> 
 </tr>
 
</c:if>

<c:if test="${queryapp.sig_sta != '簽核中'  and queryapp.sig_sta != '退回中' }">

<tr>
<td><font color="black">${queryapp.app_sta}</font></td>
<td><font color="black">${queryapp.employeeBean.emp_name}</font></td>
<td><font color="black">${queryapp.sig_rank}</font></td>
<td><font color="black">${queryapp.sig_date}</font></td> 
<td><font color="black">${queryapp.sig_sta}</font></td>
<td><font color="black">${queryapp.sig_sug}</font></td>
  </tr>

</c:if>

</c:forEach>


<!-- 詢價中 簽核中 分派中 下單中 出貨中  請款中 驗收中-->

<c:if test="${not empty queryprocesspo}">
<tr>
<th>採購流程</th>
<th>簽核人</th>
<th>簽核順序</th>
<th>簽核時間</th>
<th>進度</th>
<th>簽核意見</th>
</tr>
<c:forEach var='queryapppo' varStatus='vs' items='${queryprocesspo}'>
<c:choose>
<c:when test="${queryapppo.sig_sta == '簽核中'  or queryapppo.sig_sta == '退回中'  or queryapppo.sig_sta == '詢價中'  or queryapppo.sig_sta == '分派中'  or queryapppo.sig_sta == '下單中' or queryapppo.sig_sta == '出貨中'  or queryapppo.sig_sta == '驗收中'  or queryapppo.sig_sta == '請款中'}">
<tr>
<td><font color="red">${queryapppo.po_sta}</font></td>
<td><font color="red">${queryapppo.employeeBean.emp_name}</font></td>
<td><font color="red">${queryapppo.sig_rank}</font></td> 
<td><font color="red">${queryapppo.sig_date}</font></td> 
<td><font color="red">${queryapppo.sig_sta}</font></td>
<td><font color="red">${queryapppo.sig_sug}</font></td> 
</tr>

</c:when>
<c:otherwise>
<tr>
<td><font color="black">${queryapppo.po_sta}</font></td>
<td><font color="black">${queryapppo.employeeBean.emp_name}</font></td>
<td><font color="black">${queryapppo.sig_rank}</font></td>
<td><font color="black">${queryapppo.sig_date}</font></td>
<td><font color="black">${queryapppo.sig_sta}</font></td>
<td><font color="black">${queryapppo.sig_sug}</font></td>  
</tr>
  </c:otherwise>
  </c:choose>
</c:forEach>
</c:if>
</tbody>
</table>
<script src="../js/app.js"></script>
</div>
</div>
</body>
</html>