<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<style type="text/css">
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
}
.lr {
	width: 38%;
	float: left;
}
.dlr {
	width: 60%;
	float: right;
}
table {
	font-size: 13px;
}
</style>
</head>



<c:if test="${user.emp_dep=='財務部'}">
	<%@ include file="../includeA.jsp"%>
	</c:if>
<c:if test="${user.emp_dep=='採購部'}">
	<%@ include file="../POIncludeforAcc.jsp"%>
	</c:if>
<body class="bg">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
	pageContext.setAttribute("basePath",basePath);  
%>
	<c:if test="${not empty invoice}">
<div class="right">
	<h3>修改請款單</h3>
		<form class="form-inline" method="post"
			action="<c:url value="/Po/resendInvoice.controller"/>"
			enctype="multipart/form-data">
			<input type="hidden" value="${poid}" name="poid"> <input
				type="hidden" value="1" name="sig_Rank">
			<div class="lr">
				<div class="form-group mb-2">
					<label for="Inv_id" class="col-md-4">請款單單號</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Inv_id" id=""
						readonly="readonly" value="${invoice.inv_id}">
				</div>
				<div class="form-group mb-2">
					<label for="Emp_name" class="col-md-4">申請人</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Emp_name"
						id="" readonly="readonly" value="${user.emp_name}">
				</div>
				<div class="form-group mb-2">
					<label for="Emp_dep" class="col-md-4">所屬部門</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Emp_dep"
						id="" readonly="readonly" value="${user.emp_dep}">
				</div>
				<div class="form-group mb-2">
					<label for="Vendor_name" class="col-md-4">廠商名稱</label> <input
						type="text" class="form-control col-md-7 mb-2" name="Vendor_name"
						readonly="readonly" id=""
						value="${pomain.pO_Vendor_InfoBean.vendor_name}">
				</div>
				<div class="form-group mb-2">
					<label for="Vendor_id" class="col-md-4">廠商統編</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Vendor_id"
						readonly="readonly" id=""
						value="${pomain.pO_Vendor_InfoBean.vendor_id}">
				</div>
				<div class="form-group mb-2">
					<label for="Total_price" class="col-md-4">請款金額</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Total_price"
						readonly="readonly" id="" value="${invoice.total_price}">
				</div>
				<div class="form-group mb-2">
					<label for="Payment_method" class="col-md-4">付款方式</label> <input
						type="text" class="form-control col-md-5 mb-2"
						name="Payment_method" readonly="readonly" id=""
						value="${pomain.pO_Vendor_InfoBean.payment_method}">
				</div>
				<div class="form-group mb-2">
					<label for="Except_Payment_Date" class="col-md-4">預計付款日</label> <input
						type="text" class="form-control col-md-5 mb-2"
						name="Except_Payment_Date" id="" value="${paymentDate}"
						readonly="readonly">
				</div>
			</div>
			<div class="dlr">
				<div class="form-group mb-2">
					<label for="oldRecript_date" class="col-md-3">原憑證日期</label> <input
						type="text" class="form-control col-md-3 mb-2"
						name="oldRecript_date" id="" value="${oldRecript_date}"
						readonly="readonly">
				</div>
				<div class="form-group mb-2">
					<label class="col-md-3">原憑證圖檔</label> <a class="mb-2"
						href="${basePath}${recript_pic}" target="_blank">${picName}</a>
				</div>
				<div class="form-group mb-2">
					<label for="Recript_date" class="col-md-3">修改憑證日期</label> <input
						type="date" class="form-control col-md-4 mb-2" name="Recript_date"
						id="ttt" value="">
						<input name="xxzs" type="hidden"  value="${oldRecript_date}">
<!-- 						<button class="btn" id="bbb">修改日期</button> -->
				</div>
				<div class="form-group  mb-2">
					<label class="col-md-3" for="Receiptpic" >修改憑證圖檔</label>
    				<input id="input-b5" name="Receiptpic" type="file">
    		</div>

					<div class="form-group  mb-2">
						<label class="col-md-3">退回原因:</label>
						<table class="table table-hover col-md-6 mb-2">
						<thead>
								<tr>
									<th>簽核人</th>
									<th>簽核意見</th>
									<th>退回日期</th>
								</tr>
							</thead>
							<tbody>
								<tr>
										<td> ${sigman}</td>
										<td> ${sigSug}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sigtime}"/> </td>
									</tr>
							</tbody>
						</table>
					</div>

				<c:if test="${not empty manager}">
									<div class="form-group  mb-2">
				
					<label class="col-md-3">審核人員</label>
					<select class="mb-2" name="selectPOManager">
						<c:forEach var="poman" items="${manager}">
							<option value="${poman.emp_id}">${poman.emp_name}
								${poman.emp_job}</option>
						</c:forEach>
					</select>
					</div>
				</c:if>
				<div class="form-group mb-2">
					<label class="col-md-3">簽核意見:</label>
					<textarea rows="2" cols="58" name="SignSug" class="col-md-6 mb-2" required>請審核</textarea>
				</div>
				<div class="text-right">
					<input class="btn btn-primary" type="reset" value="重新輸入"> <input
						class="btn btn-primary" type="submit" value="送出"
						data-toggle="modal" data-target="#exampleModalCenter">
				</div>
			</div>
		</form>
</div>
	</c:if>
	<!-- --------------------------------審核/分派/退回  ----------------------------------------- -->
<div class="right">
	<c:if test="${not empty invid}">
<%-- 				<c:set var="dep" value="${user.emp_dep}" /> --%>
<%-- 				<c:set var="dep1" value="採購部" /> --%>
<%-- 				<c:set var="dep2" value="財務部" /> --%>
<%-- 				<c:set var="status1" value="dispatch" /> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${(dep==dep1) && (user.emp_level==2)}"> --%>
<!-- 					<div class="text-left"> -->
<!-- 						<a href='todoSignInvoice.controller'>回上一頁</a> -->
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when test="${(dep==dep2) && (user.emp_level==1)}"> --%>
<!-- 					<div class="text-left"> -->
<!-- 						<a href='ToDoSignlevel1.controller'>回上一頁</a> -->
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when --%>
<%-- 						test="${(dep==dep2) && (user.emp_level==2) && (status==status1)}">  --%>
<!-- 						<div class="text-left"> -->
<!-- 						<a href='ToDoAssignInvoice.controller'>回上一頁</a> -->
<!-- 						</div> -->
<%-- 		 			</c:when>  --%>
<%-- 		 			<c:otherwise>  --%>
<!-- 		 			<div class="text-left"> -->
<!-- 						<a href='ToDoSignInvoice.controller'>回上一頁</a> -->
<!-- 						</div> -->
<%-- 		 			</c:otherwise>  --%>
<%-- 		 		</c:choose>  --%>
		<form class="form-inline" method="post"
			action="<c:url value="/Account/ReviewInvoice.controller"/>">

			<input type="hidden" name="status" value="${status}"> <input
				type="hidden" value="${invid}" name="invid">

			<div class="lr">
				<div class="form-group mb-2">
					<label for="Inv_id" class="col-md-5">請款單單號</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Inv_id" id=""
						readonly="readonly" value="${invid}">
				</div>
				<div class="form-group mb-2">
					<label for="Emp_id" class="col-md-5">申請人</label> <input type="text"
						class="form-control col-md-5 mb-2" name="Emp_id" id=""
						readonly="readonly" value="${empid}">
				</div>
				<div class="form-group mb-2">
					<label for="Emp_dep" class="col-md-5">所屬部門</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Emp_dep"
						id="" readonly="readonly" value="${empdep}">
				</div>
				<div class="form-group mb-2">
					<label for="Vendor_name" class="col-md-5">廠商名稱</label> <input
						type="text" class="form-control col-md-7 mb-2" name="Vendor_name"
						readonly="readonly" id="" value="${ven_name}">
				</div>
				<div class="form-group mb-2">
					<label for="Vendor_id" class="col-md-5">廠商統編</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Vendor_id"
						readonly="readonly" id="" value="${ven_id}">
				</div>
				<div class="form-group  mb-2">
					<label for="Total_price" class="col-md-5">請款金額</label> <input
						type="text" class="form-control col-md-5 mb-2" name="Total_price"
						readonly="readonly" id="" value="${price}">
				</div>
				<div class="form-group mb-2">
					<label for="Payment_method" class="col-md-5">付款方式</label> <input
						type="text" class="form-control col-md-5 mb-2"
						name="Payment_method" readonly="readonly" id=""
						value="${payMethod}">
				</div>
				<div class="form-group mb-2">
					<label for="Except_Payment_Date" class="col-md-5">預計付款日</label> <input
						type="text" class="form-control col-md-5 mb-2"
						name="Except_Payment_Date" readonly="readonly" id=""
						value="${paydate}">
				</div>
			</div>
			<div class="dlr">
				<div class="form-group  mb-2">
					<label for="Recript_date" class="col-md-4">憑證日期</label> <input
						type="text" class="form-control col-md-3 mb-2" name="Recript_date"
						id="" readonly="readonly" value="${keyday}">

				</div>
				<div class="form-group mb-2">
					<label class="col-md-4">憑證圖檔</label> <a class="mb-2"
						href="${basePath}${recript_pic}" target="_blank">${picName}</a>
				</div>
				<c:if test="${not empty sug}">
					<div class="form-group mb-2">
						<label class="col-md-4"> 簽核說明</label>
						<table class="table table-hover col-md-8 mb-2">
							<thead>
								<tr>
									<th>流程順序</th>
									<th>簽核人</th>
									<th>簽核意見</th>
									<th>簽核日期</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="sig" items="${sug}">
									<tr>
										<td>${sig.sig_Rank}</td>
										<td>${sig.employeeBean.emp_name}</td>
										<td>${sig.sig_Sug}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sig.sig_Date}"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${not empty sigSug}">
					<div class="form-group  mb-2">
						<label class="col-md-4">退回原因:</label>
						<table class="text-center table table-hover col-md-6 mb-2">
						<thead>
								<tr>
									<th>簽核人</th>
									<th>簽核意見</th>
									<th>退回日期</th>
								</tr>
							</thead>
							<tbody>
								<tr>
										<td> ${sigman}</td>
										<td> ${sigSug}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sigtime}"/> </td>
									</tr>
							</tbody>
						</table>
					</div>
				</c:if>

				<c:if test="${not empty manager}">
					<div class="form-group  mb-2">
						<label class="col-md-4">審核人員</label> <select class="mb-2"
							name="selectPOManager">
							<c:forEach var="poman" items="${manager}">
								<option value="${poman.emp_id}">${poman.emp_name}
									${poman.emp_job}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
				<div class="form-group  mb-2">
					<label class="col-md-4">簽核意見:</label>
					<textarea rows="2" cols="58" name="SignSug" class="col-md-6 mb-2" required>請審核
    </textarea>
				</div>
				<div class=" text-right">
					<input class="btn" type="submit" name="action" value="送出">
					<input class="btn" type="submit" name="action" value="退回">
				</div>
			</div>
		</form>
	</c:if>
	</div>
	<input type="hidden" value="${inv_id}" name="invidback">

	<script>
	$(document).ready(function(){
	     $("#input-b5").fileinput({ showCaption: false, dropZoneEnabled: false ,showUpload: false});
	});
	$(document).ready(function(){
		var invid="${inv_id}";
		var sendsuccessmeg="${sendsuccessmeg}";
		var senderrormeg="${senderrormeg}";
		var successmeg="${successmeg}";
		var errormeg="${errormeg}";
		var returnsuccessmeg="${returnsuccessmeg}";
		var returnerrormeg="${returnerrormeg}";
		var dispatchsuccessmeg="${dispatchsuccessmeg}";
		var dispatcherrormeg="${dispatcherrormeg}";
		if(successmeg==="1"){
			swal("","請款單:"+invid+"修改送出成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
			});
		}
		if(sendsuccessmeg=="1"){
			swal("","請款單"+invid+"審核送出成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
			});
		}
		if(sendsuccessmeg=="3"){
			swal("","請款單"+invid+"審核送出成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Account/AccountLoginSuccess.jsp'
			});
		}
		if(returnsuccessmeg=="1"){
			swal("","請款單"+invid+"退回成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
			});
		}
		
		if(returnsuccessmeg=="3"){
			swal("","請款單"+invid+"退回成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Account/AccountLoginSuccess.jsp'
			});
		}
		if(dispatchsuccessmeg=="1"){
			swal("","請款單"+invid+"分派成功","success").then(function(){
				window.location.href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Account/AccountLoginSuccess.jsp'
			});
		}
	});
	
</script>
</body>

</html>