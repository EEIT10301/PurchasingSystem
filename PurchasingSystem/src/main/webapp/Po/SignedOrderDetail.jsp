<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


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

<meta charset="UTF-8">
<title>待下單明細</title>
</head>
<body class="bg">
<%@ include file="../POIncludeforAcc.jsp"%>
	<%-- <h2>請購單編號:${signedOrderDetail.po_id}</h2> --%>
	<div class="right">
		<h2>採購單編號:${pm.po_id}</h2>
		<h2>下單產品明細</h2>
		<form action="<c:url value="/Po/signedOrderSubmit.controller" />"
			method="post">
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th width="200px">廠商名稱</th>
						<th width="200px">料號</th>
						<th width="200px">產品名稱</th>
						<th width="200px">總數量</th>
						<th width="200px">單價</th>
						<th width="200px">總價</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='poDetail' items='${poDetail}'>
						<tr>
							<td>${poDetail.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
							<td>${poDetail.part_No}</td>
							<td>${poDetail.productListBean.pro_name}</td>
							<td>${poDetail.total_Qty}</td>
							<td>${poDetail.quotation}</td>
							<td>${poDetail.total_Price}</td>
						</tr>
					</c:forEach>
					
						<%-- 		<c:forEach var='po_Sign' items='${po_Sign}'> --%>

				</tbody>
			</table>
						<input type='hidden' name='po_manger'
							value='${po_Sign.po_manger}'>
						<input type='hidden' name='po_sta'
							value='${po_Sign.po_sta}'>
						<input type='hidden' name='po_id'
							value='${po_Sign.po_id}'>
						<input type='hidden' name='sig_date'
							value='${po_Sign.sig_date}'>
						<input type='hidden' name='sig_sta'
							value='${po_Sign.sig_sta}'>
						<input type='hidden' name='sig_sug'
							value='${po_Sign.sig_sug}'>
						<input type='hidden' name='sig_rank'
							value='${po_Sign.sig_rank}'>

			<%-- 		</c:forEach> --%>
			
			<h3>請購需求交期:${appmain.app_GetDate}</h3>
			<div id="reason" class="col-md-6">
<label for="reason" >下單意見:</label>
<textarea rows="5" cols="50" name="signSug"></textarea> </div>
<div id="datetime" class="col-md-4" >
<label for="datetime" >實際收貨時間:</label><br> 
<input type="date" name="shippingDate" required>
<br>
<br>
<br>
<input type="submit" name="send" class='btn btn-white btn-sm' value="確認下單"></div>
		</form>
	</div>

	<script src="../js/app.js"></script>
</body>
</html>