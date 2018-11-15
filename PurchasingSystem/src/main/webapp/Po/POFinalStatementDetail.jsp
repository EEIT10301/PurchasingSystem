<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢結案請款單細項</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
</head>
<body class="bg">
<div class="right">

<h2>請購單編號:${appMainDone.app_id}</h2>
<table class="table table-striped table-hover" id="myTable">
<tr>
<th width="200px">請購單編號</th>
<th width="200px">請購人員</th>
<th>請購總價</th>
</tr>

<tr>
<td>${appMainDone.app_id}</td>
<td>${appMainDone.employeeBean.emp_name}</td>
<td>${appMainDone.app_price}</td>
</tr>


</table>






<h2>請購清單</h2>
<table class="table table-striped table-hover" id="myTable">
<tr>
<th width="200px">料號</th>
<th width="200px">材料項目</th>
<th>材料名稱</th>
<th>材料規格</th>
<th>數量</th>
<th>預估單價</th>
</tr>


<c:forEach var="appDetailDone" items="${appDetailDone}" varStatus="status">
<tr>
<td width="200px">${appDetailDone.part_no}</td>
<td width="200px">${appDetailDone.productListBean.pro_cate}</td>
<td width="300px">${appDetailDone.productListBean.pro_name}</td>
<td>${appDetailDone.productListBean.pro_spe}</td>
<td>${appDetailDone.app_amount}</td>
<td>${appDetailDone.pro_price}</td>
</tr>

</c:forEach>





</table>








<h2>請購簽核流程</h2>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th width="200px">簽核人</th>
<th width="200px">簽核時間</th>
<th width="200px">簽核情形</th>
<th width="200px">簽核建議</th>
</tr>
</thead>

<c:forEach var="applyDone" items="${applyDone}">

<tr>
<td>${applyDone.sig_rank}</td>
<td>${applyDone.app_sta}</td>
<td>${applyDone.employeeBean.emp_name}</td>
<td>
<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${applyDone.sig_date}"/>
</td>
<td>${applyDone.sig_sta}</td>
<td>${applyDone.sig_sug}</td>

</tr>


</c:forEach>

</table>





















<h2>採購單編號:${pomainDone.po_id}</h2>
<table class="table table-striped table-hover" id="myTable">
<tr>
<th width="200px">採購單編號</th>
<th width="200px">採購人員</th>
<th width="300px">採購廠商</th>
<th>採購總價</th>
</tr>

<tr>
<td>${pomainDone.po_id}</td>
<td>${pomainDone.employeeBean.emp_name}</td>
<td>${pomainDone.pO_Vendor_InfoBean.vendor_name}</td>
<td>${pomainDone.total_price}</td>
</tr>


</table>





<h2>採購清單</h2>
<table class="table table-striped table-hover" id="myTable">

<tr>
<th width="200px">料號</th>
<th width="200px">材料項目</th>
<th>材料名稱</th>
<th>材料規格</th>
<th>請購數量</th>
<th>預估價格</th>
<th>實際採購數量</th>
<th>實際採購價格</th>
<th>該物料總價格</th>
</tr>

<c:forEach var="podetailDone"  items="${podetailDone}" varStatus="status">
<tr>
<td>${podetailDone.part_No}</td>
<td>${podetailDone.productListBean.pro_cate}</td>
<td>${podetailDone.productListBean.pro_name}</td>
<td>${podetailDone.productListBean.pro_spe}</td>
<td>${podetailDone.total_Qty}</td>
<td>${podetailDone.market_Price}元</td>
<td>${podetailDone.quotation}</td>
<td>${podetailDone.total_Price}元</td>
<td>${podetailDone.total_Price*podetailDone.quotation}元</td>

</tr>

</c:forEach>
</table>






<h2>採購簽核流程</h2>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th width="200px">簽核人</th>
<th width="200px">簽核時間</th>
<th width="200px">簽核情形</th>
<th width="200px">簽核建議</th>
</tr>
</thead>

<c:forEach var="poDone" items="${poDone}">

<tr>
<td>${poDone.sig_rank}</td>
<td>${poDone.po_sta}</td>
<td>${poDone.employeeBean.emp_name}</td>
<td>

<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${poDone.sig_date}"/>
</td>
<td>${poDone.sig_sta}</td>
<td>${poDone.sig_sug}</td>

</tr>


</c:forEach>

</table>







<h2>驗收簽核流程</h2>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th width="200px">簽核人</th>
<th width="200px">簽核時間</th>
<th width="200px">簽核情形</th>
<th width="200px">簽核建議</th>
</tr>
</thead>

<c:forEach var="InvDone" items="${InvDone}">

<tr>
<td>${InvDone.sig_Rank}</td>
<td>${InvDone.inv_Sta}</td>
<td>${InvDone.employeeBean.emp_name}</td>
<td>
<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${InvDone.sig_Date}"/>
</td>
<td>${InvDone.sig_Sta}</td>
<td>${InvDone.sig_Sug}</td>

</tr>


</c:forEach>

</table>






<h2>請款簽核流程</h2>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th width="200px">簽核人</th>
<th width="200px">簽核時間</th>
<th width="200px">簽核情形</th>
<th width="200px">簽核建議</th>
</tr>
</thead>

<c:forEach var="ACCDone" items="${ACCDone}">

<tr>
<td>${ACCDone.sig_Rank}</td>
<td>${ACCDone.account_Sta}</td>
<td>${ACCDone.employeeBean.emp_name}</td>
<td>
<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ACCDone.sig_Date}"/>
</td>
<td>${ACCDone.sig_Sta}</td>
<td>${ACCDone.sig_Sug}</td>

</tr>


</c:forEach>

</table>











		</div>
		<script src="../js/app.js"></script>
</body>
</html>