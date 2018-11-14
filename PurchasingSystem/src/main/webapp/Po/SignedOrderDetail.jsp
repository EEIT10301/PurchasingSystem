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
					<tr>
						<%-- 		<c:forEach var='po_Sign' items='${po_Sign}'> --%>
						<td><input type='hidden' name='po_manger'
							value='${po_Sign.po_manger}'></td>
						<td><input type='hidden' name='po_sta'
							value='${po_Sign.po_sta}'></td>
						<td><input type='hidden' name='po_id'
							value='${po_Sign.po_id}'></td>
						<td><input type='hidden' name='sig_date'
							value='${po_Sign.sig_date}'></td>
						<td><input type='hidden' name='sig_sta'
							value='${po_Sign.sig_sta}'></td>
						<td><input type='hidden' name='sig_sug'
							value='${po_Sign.sig_sug}'></td>
						<td><input type='hidden' name='sig_rank'
							value='${po_Sign.sig_rank}'></td>
					</tr>


				</tbody>
			</table>

			<%-- 		</c:forEach> --%>
			
			<h3>請購需求交期:${appmain.app_GetDate}</h3>
			
			下單意見:
			<p>
				<textarea rows="5" cols="50" name="signSug"></textarea>
			</p>
			預計出貨時間:<input type="date" name="shippingDate">
			<p>
				<input type="submit" name="send" class='btn btn-default' value="送出">

		</form>
	</div>

	<script src="../js/app.js"></script>
</body>
</html>