<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<style type="text/css">
input, select {
	display: block;
}
</style>
</head>

<body>
	<h1>請款單</h1>
	<a href='Polist.controller'>回上一頁</a>
	<form method="post"
		action="<c:url value="/Po/onloadimage.controller"/>"
		enctype="multipart/form-data" id="fileupload">
		<input type="hidden" value="${poid}" name="poid"> <input
			type="hidden" value="${user.emp_id}" name="Emp_id"> <label
			for="Emp_name">申請人</label> <input type="text" name="Emp_name" id=""
			readonly="readonly" value="${user.emp_name}"> <label
			for="Emp_dep">所屬部門</label> <input type="text" name="Emp_dep" id=""
			readonly="readonly" value="${user.emp_dep}"> <label
			for="Vendor_name">廠商名稱</label> <input type="text" name="Vendor_name"
			readonly="readonly" id=""
			value="${bean.pO_Vendor_InfoBean.vendor_name}"> <label
			for="Vendor_id">廠商統編</label> <input type="text" name="Vendor_id"
			readonly="readonly" id="" value="${bean.vendor_ID}"> <label
			for="Total_price">請款金額</label> <input type="text" name="Total_price"
			readonly="readonly" id="" value="${bean.total_price}"> <label
			for="Payment_method">付款方式</label> <input type="text"
			name="Payment_method" readonly="readonly" id=""
			value="${bean.pO_Vendor_InfoBean.payment_method}"> <label
			for="Except_Payment_Date">預計付款日</label> <input type="text"
			name="Except_Payment_Date" id="" value="${paymentDate}"> <label
			for="Recript_date">憑證日期</label> <input type="date"
			name="Recript_date" id="" value="" required> <label
			for="Receiptpic">憑證圖檔</label> <input type="file" name="Receiptpic"
			id="" value=""> 審核人員<select name="selectPOManager">
			<c:forEach var="poman" items="${manager}">
				<option value="${poman.emp_id}">${poman.emp_name}
					${poman.emp_job}</option>
			</c:forEach>
		</select> 簽核意見:
		<textarea rows="5" cols="50" name="SignSug" required>
		</textarea>

		<input class="btn btn-primary" type="reset" value="重新輸入"> 
		<input class="btn btn-primary" type="submit" data-toggle="modal"
			data-target="#exampleModalCenter" value="送出">
		
<!-- 		<div class="modal fade" id="exampleModalCenter" tabindex="-1" -->
<!-- 		role="dialog" aria-labelledby="exampleModalCenterTitle" -->
<!-- 		aria-hidden="true"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered" role="document"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h5 class="modal-title" id="exampleModalLongTitle">訊息</h5> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<%-- 					<c:if test="${not empty successmeg}"> --%>
<%-- 						<h2>請款單:${inv_id}${successmeg}</h2> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${not empty errormeg}"> --%>
<%-- 						<h2>請款單${errormeg}</h2> --%>
<%-- 					</c:if> --%>
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-secondary" -->
<!-- 						data-dismiss="modal">Close</button> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

		<!-- 		<label class="btn btn-primary"> -->
		<!-- 		<input id="upload_img" style="display:none;" type="file" name="Receiptpic"> -->
		<!-- 		上傳圖片</label> -->


	</form>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>