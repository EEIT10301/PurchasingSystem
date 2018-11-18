<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script type="text/javascript">
 function forward(){
	if(confirm("確定送出此單據? "))
	{
		window.event.returnValue=true;
		}
		else
		{
 		alert("單據送出取消");
 		window.event.returnValue=false;
 		}
 }
 </script>

 <title>待收貨單明細</title>
 </head>
 <%@ include file="../POIncludeforAcc.jsp"%>
 <body class="bg">
 
 <div class="right">	
 <h2>採購單編號:${pm.po_id}</h2>
 <h2>收貨明細</h2>
 <form action="<c:url value="/Po/receivedGoods.controller" />" method="post">
 	<table id="myTable" class="table table-striped table-hover">
 	<thead>
 			<tr>
 				<th width="800px">料號</th>
 				<th width="800px">產品名稱</th>
 				<th width="1200px">總數量</th>
 			</tr>
 	</thead>
 	<tbody>
 	<c:forEach var='poDetail' items='${poDetail}'>	
 	<tr>
 		<td>${poDetail.part_No}</td>
 		<td>${poDetail.productListBean.pro_name}</td>
 		<td>${poDetail.total_Qty}</td>
 	</tr>
 	</c:forEach>
 <%-- 	<c:forEach var='po_Sign' items='${po_Sign}'> --%>
 		</tbody>
 		</table>
 		
 <%-- 	</c:forEach> --%>
 <br>
 <div id="reason" class="col-md-6">
 <label for="reason" >收貨意見:</label>
 <textarea rows="5" cols="50" name="signSug"></textarea> </div>
 <div id="datetime" class="col-md-4" >
 <label for="datetime" >實際收貨時間:</label><br> 
 <input type="date" name="shippingDate" required>
 <br>
 <br>
 <br>
 <input type="submit" name="send" class='btn btn-white btn-sm' value="確認收貨" onclick="forward()"></div>
 
 			<input type='hidden' name='po_manger' value='${po_Sign.po_manger}'>
 			<input type='hidden' name='po_sta' value='${po_Sign.po_sta}'>
 			<input type='hidden' name='po_id' value='${po_Sign.po_id}'>
 			<input type='hidden' name='sig_date' value='${po_Sign.sig_date}'>
 			<input type='hidden' name='sig_sta' value='${po_Sign.sig_sta}'>
 			<input type='hidden' name='sig_sug' value='${po_Sign.sig_sug}'>
 			<input type='hidden' name='sig_rank' value='${po_Sign.sig_rank}'>		
 
 
 </form>
 </div>
	
	<script src="../js/app.js"></script>
</body>
</html>