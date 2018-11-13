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
/* input, select { */
/* 	display: block; */
/* } */
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.lr {
	width: 33%;
	float: left;
}

.dlr {
	width: 64%;
	float: left;
}
</style>
</head>

<body class="bg">
	<h1>請款單</h1>
	<br>
	<!-- 	<a href='Polist.controller'>回上一頁</a> -->
	<form class="form-inline" method="post"
		action="<c:url value="/Po/onloadimage.controller"/>"
		enctype="multipart/form-data" id="fileupload">
		<input type="hidden" value="${poid}" name="poid"> <input
			type="hidden" value="${user.emp_id}" name="Emp_id">
		<div class="lr">
			<div class="form-group mb-2">
				<label for="Emp_name" class="col-md-4">申請人</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Emp_name"
					id="" readonly="readonly" value="${user.emp_name}">
			</div>
			<div class="form-group mb-2">
				<label for="Emp_dep" class="col-md-4">所屬部門</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Emp_dep" id=""
					readonly="readonly" value="${user.emp_dep}">
			</div>
			<div class="form-group mb-2">
				<label for="Vendor_name" class="col-md-4">廠商名稱</label> <input
					type="text" class="form-control col-md-7 mb-2" name="Vendor_name"
					readonly="readonly" id=""
					value="${bean.pO_Vendor_InfoBean.vendor_name}">
			</div>
			<div class="form-group mb-2">
				<label for="Vendor_id" class="col-md-4">廠商統編</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Vendor_id"
					readonly="readonly" id="" value="${bean.vendor_ID}">
			</div>
			<div class="form-group  mb-2">
				<label for="Total_price" class="col-md-4">請款金額</label> <input
					type="text" class="form-control col-md-5 mb-2" name="Total_price"
					readonly="readonly" id="" value="${bean.total_price}">
			</div>
			<div class="form-group  mb-2">
				<label for="Payment_method" class="col-md-4">付款方式</label> <input
					type="text" class="form-control col-md-5 mb-2"
					name="Payment_method" readonly="readonly" id=""
					value="${bean.pO_Vendor_InfoBean.payment_method}">
			</div>
			<div class="form-group  mb-2">
				<label for="Except_Payment_Date" class="col-md-4">預計付款日</label> <input
					type="text" class="form-control col-md-5 mb-2"
					name="Except_Payment_Date" readonly="readonly" id=""
					value="${paymentDate}">
			</div>
		</div>
		<div class="dlr">
			<div class="form-group  mb-2">
				<label for="Recript_date" class="col-md-2">憑證日期</label> <input
					type="date" class="form-control col-md-3 mb-2" name="Recript_date"
					id="" value="" required>
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2" for="Receiptpic">憑證圖檔</label><input
					class="mb-2" type="file" name="Receiptpic"
					id="" value="">
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2">審核人員</label> <select class="mb-2"
					name="selectPOManager">
					<c:forEach var="poman" items="${manager}">
						<option value="${poman.emp_id}">${poman.emp_name}
							${poman.emp_job}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-2">簽核意見</label>
				<textarea rows="2" cols="58" name="SignSug" class="col-md-6 mb-2"
					required>
		</textarea>
			</div>
			<div class=" text-right">
				<input class="btn" type="reset" value="重新輸入"> <input
					class="btn" type="submit" data-toggle="modal"
					data-target="#exampleModalCenter" value="送出">
			</div>

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

		</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>