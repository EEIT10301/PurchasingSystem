<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<script type="text/javascript">

		function tosend() {
			if(confirm("確定送出審核")){
				window.event.returnValue=true;
				alert("資料已送出");
			}
			else{
				window.event.returnValue=false;
				
			}
		}
		


</script>

<title>待收貨單明細</title>
</head>
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
		<tr>
			<td><input type='hidden' name='po_manger' value='${po_Sign.po_manger}'></td>
			<td><input type='hidden' name='po_sta' value='${po_Sign.po_sta}'></td>
			<td><input type='hidden' name='po_id' value='${po_Sign.po_id}'></td>
			<td><input type='hidden' name='sig_date' value='${po_Sign.sig_date}'></td>
			<td><input type='hidden' name='sig_sta' value='${po_Sign.sig_sta}'></td>
			<td><input type='hidden' name='sig_sug' value='${po_Sign.sig_sug}'></td>
			<td><input type='hidden' name='sig_rank' value='${po_Sign.sig_rank}'></td>
		</tr>
		</tbody>
		</table>
		
<%-- 	</c:forEach> --%>
收貨意見:<p><textarea rows="5" cols="50" name="signSug"></textarea></p>
實際收貨時間:<input type="datetime" name="shippingDate">
<p><input type="submit" name="send" value="確認收貨" onclick="tosend()">

</form>
</div>
<script src="../js/app.js"></script>	
</body>
</html>