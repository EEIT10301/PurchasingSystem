<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css" media="all" rel="stylesheet"
        type="text/css" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/piexif.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/sortable.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/purify.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/fileinput.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/locales/LANG.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<%@ include file="../POIncludeforAcc.jsp" %>
<div class="right">
	<h3>新增請款單</h3>
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
					type="text" class="form-control col-md-8 mb-2" name="Vendor_name"
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
				<label for="Recript_date" class="col-md-3">憑證日期</label> <input
					type="date" class="form-control col-md-5 mb-2" name="Recript_date"
					id="" value="" required>
			</div>
			<div class="form-group  mb-2">
					<label class="col-md-3" for="Receiptpic" >憑證圖檔</label>
    				<input id="input-b5" name="Receiptpic" type="file">
    		</div>		 
			<div class="form-group  mb-2">
				<label class="col-md-3">審核人員</label> <select class="mb-2"
					name="selectPOManager">
					<c:forEach var="poman" items="${manager}">
						<option value="${poman.emp_id}">${poman.emp_name}
							${poman.emp_job}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group  mb-2">
				<label class="col-md-3">簽核意見</label>
					<textarea rows="2" cols="58" name="SignSug" class="col-md-6 mb-2"
						required >請審核</textarea>
				</div>
			<div class=" text-right">
				<input class="btn" type="reset" value="重新輸入">
				 <input	class="btn" type="submit" id="agree" value="送出">
			</div>
</div>
	</form>
	</div>
	
	
<%-- <c:if test="${not empty successmeg}"> --%>
<!-- 	<div id="dialog" title="Basic dialog"> -->
<%-- 		<p>${successmeg}${inv_id}</p> --%>
<!-- 	</div>	 -->
<%-- 	</c:if> --%>
<%-- 	<c:if test="${not empty errormeg}"> --%>
<!-- 	<div id="dialog" title="Basic dialog"> -->
<%-- 		<p>${errormeg}</p> --%>
<!-- 	</div>	 -->
<%-- 	</c:if> --%>
     
	<input type="hidden" value="${inv_id}" name="invid">
	<script>
   
       
	$(document).ready(function(){
		 $("#input-b5").fileinput({
	            showCaption: false,
	            dropZoneEnabled: false,
	            showUpload: false,
	        });
	
		var invid="${inv_id}";
		var successmeg="${successmeg}";
		var errormeg="${errormeg}";
		if(successmeg==="3"){
			swal("","請款單:"+invid+"新增成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
			});
		}
		if(errormeg=="4"){
			swal("","請款單:"+invid+"新增失敗","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
			});
		}
	});
	

 
</script>
</body>
</html>