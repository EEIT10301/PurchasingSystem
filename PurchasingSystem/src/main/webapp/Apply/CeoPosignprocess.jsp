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
<title>總經理待簽核頁面</title>
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

<c:if test='${not empty nopolist}'>
<h2>${nopolist}</h2>
</c:if>
<c:if test='${not empty PO_SignSend}'>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th class='text-center' colspan='5'>待簽核表單</th>
</tr>
</thead>
<tbody >
<tr>
<th>採購單號</th>
<th>採購項目</th>
<th>採購總金額</th>
<th>前一位簽核時間</th>
<th></th>
</tr>
<c:forEach var='polists' varStatus='vs' items='${PO_SignSend}'>
<tr>
 <td>${polists.po_id}</td>
 <td>${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
 <td>${polists.pO_MainBean.total_price}</td>

 <c:forEach var='polistone' varStatus='vs' items='${PO_SignSendRank}'>
 <c:if test='${polists.po_id == polistone.po_id}'>
  <td> ${polistone.sig_date}</td>
 </c:if>
 </c:forEach>
<td><a href='<c:url value="ceoPOManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=sendok" />'>  
<button id='' class='btn btn-default' value='已結案'>
開始簽核</button></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>

<script src="../js/app.js"></script>
</div>
</div>

</body>
</html>