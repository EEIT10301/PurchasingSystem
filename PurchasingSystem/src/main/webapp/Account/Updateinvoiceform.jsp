<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
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
</style>
</head>

<body class="bg">
	<h3>請款單細項</h3>
	<c:if test="${not empty successmeg}">
		<h2>${successmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty errormeg}">
		<h2>${errormeg}</h2>
	</c:if>
	<c:if test="${not empty invoice}">
		<a href='Polist.controller'>回上一頁</a>
		<form method="post"
			action="<c:url value="/Po/resendInvoice.controller"/>"
			enctype="multipart/form-data">
			<input type="hidden" value="${poid}" name="poid"> <input
				type="hidden" value="1" name="sig_Rank">
			<div class="form-group col-md-5">
				<label for="Inv_id">請款單單號</label> <input type="text" class="form-control" name="Inv_id"
					id="" readonly="readonly" value="${invoice.inv_id}">
			</div>
			<div class="form-group col-md-5">
				<label for="Emp_name">申請人</label> <input type="text" class="form-control" name="Emp_name"
					id="" readonly="readonly" value="${user.emp_name}">
			</div>
			<div class="form-group col-md-5">
				<label for="Emp_dep">所屬部門</label> <input type="text" class="form-control" name="Emp_dep"
					id="" readonly="readonly" value="${user.emp_dep}">
			</div>
			<div class="form-group col-md-5">
				<label for="Vendor_name">廠商名稱</label> <input type="text" class="form-control" 
					name="Vendor_name" readonly="readonly" id=""
					value="${pomain.pO_Vendor_InfoBean.vendor_name}">
			</div>
			<div class="form-group col-md-5">
				<label for="Vendor_id">廠商統編</label> <input type="text" class="form-control" 
					name="Vendor_id" readonly="readonly" id=""
					value="${pomain.pO_Vendor_InfoBean.vendor_id}">
			</div>
			<div class="form-group col-md-5">
				<label for="Total_price">請款金額</label> <input type="text" class="form-control" 
					name="Total_price" readonly="readonly" id=""
					value="${invoice.total_price}">
			</div>
			<div class="form-group col-md-5">
				<label for="Payment_method">付款方式</label> <input type="text" class="form-control" 
					name="Payment_method" readonly="readonly" id=""
					value="${pomain.pO_Vendor_InfoBean.payment_method}">
			</div>
			<div class="form-group col-md-5">
				<label for="Except_Payment_Date">預計付款日</label> <input type="text" class="form-control" 
					name="Except_Payment_Date" id="" value="${paymentDate}"
					readonly="readonly">
			</div>
			<div class="form-group col-md-5">
				<label for="oldRecript_date">原憑證日期</label> <input type="text" class="form-control" 
					name="oldRecript_date" id="" value="${oldRecript_date}"
					readonly="readonly">
			</div>
			<div class="form-group col-md-5">
				<label for="Recript_date">修改憑證日期</label> <input type="date" class="form-control" 
					name="Recript_date" id="" value="">
			</div>
			<div class="form-group col-md-5">
				<label>原憑證圖檔</label> <img src="..${invoice.recript_pic}" alt=""
					height="200" width="200"> <input type="file"
					name="Receiptpic" id="" value="">
			</div>
			<div class="form-group col-md-5">
				<label for="Receiptpic">修改憑證圖檔 </label>
			</div>
			<div class="form-group col-md-5">
				<label>退回原因:${sigSug}</label>
			</div>
			<c:if test="${not empty manager}">
				<label>主管</label>
				<select name="selectPOManager">
					<c:forEach var="poman" items="${manager}">
						<option value="${poman.emp_id}">${poman.emp_name}
							${poman.emp_job}</option>
					</c:forEach>
				</select>
			</c:if>
			<div class="form-group col-md-5">
				<label>簽核意見:</label>

				<textarea rows="5" cols="50" name="SignSug"></textarea>
			</div>
			<div class="form-group col-md-5 text-right">

			<input type="submit" value="送出">
			</div>
		</form>
	</c:if>

	<c:if test="${not empty sendsuccessmeg}">
		<h2>${sendsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty senderrormeg}">
		<h2>${senderrormeg}</h2>
	</c:if>
	<c:if test="${not empty returnsuccessmeg}">
		<h2>${returnsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty returnerrormeg}">
		<h2>${returnerrormeg}</h2>
	</c:if>
	<c:if test="${not empty dispatchsuccessmeg}">
		<h2>${dispatchsuccessmeg}${inv_id}</h2>
	</c:if>
	<c:if test="${not empty dispatcherrormeg}">
		<h2>${dispatcherrormeg}</h2>
	</c:if>

	<c:if test="${not empty invid}">
		<c:set var="dep" value="${user.emp_dep}" />
		<c:set var="dep1" value="採購部" />
		<c:set var="dep2" value="財務部" />
		<c:set var="status1" value="dispatch" />
		<c:choose>
			<c:when test="${(dep==dep1) && (user.emp_level==2)}">
				<a href='todoSignInvoice.controller'>回上一頁</a>
			</c:when>
			<c:when test="${(dep==dep2) && (user.emp_level==1)}">
				<a href='ToDoSignlevel1.controller'>回上一頁</a>
			</c:when>
			<c:when
				test="${(dep==dep2) && (user.emp_level==2) && (status==status1)}">
				<a href='ToDoAssignInvoice.controller'>回上一頁</a>
			</c:when>
			<c:otherwise>
				<a href='ToDoSignInvoice.controller'>回上一頁</a>
			</c:otherwise>
		</c:choose>

		<form method="post"
			action="<c:url value=" /Account/ReviewInvoice.controller "/>">

			<input type="hidden" name="status" value="${status}"> <input
				type="hidden" value="${invid}" name="invid">
			<div class="form-group col-md-5">
				<label for="Inv_id">請款單單號</label> <input type="text"
					class="form-control" name="Inv_id" id="" readonly="readonly"
					value="${invid}">
			</div>
			<div class="form-group col-md-5">
				<label for="Emp_id">申請人</label> <input type="text"
					class="form-control" name="Emp_id" id="" readonly="readonly"
					value="${empid}">
			</div>
			<div class="form-group col-md-5">
				<label for="Emp_dep">所屬部門</label> <input type="text"
					class="form-control" name="Emp_dep" id="" readonly="readonly"
					value="${empdep}">
			</div>
			<div class="form-group col-md-5">
				<label for="Vendor_name">廠商名稱</label> <input type="text"
					class="form-control" name="Vendor_name" readonly="readonly" id=""
					value="${ven_name}">
			</div>
			<div class="form-group col-md-5">
				<label for="Vendor_id">廠商統編</label> <input type="text"
					class="form-control" name="Vendor_id" readonly="readonly" id=""
					value="${ven_id}">
			</div>
			<div class="form-group col-md-5">
				<label for="Total_price">請款金額</label> <input type="text"
					class="form-control" name="Total_price" readonly="readonly" id=""
					value="${price}">
			</div>
			<div class="form-group col-md-5">
				<label for="Payment_method">付款方式</label> <input type="text"
					class="form-control" name="Payment_method" readonly="readonly"
					id="" value="${payMethod}">

			</div>
			<div class="form-group col-md-5">
				<label for="Except_Payment_Date">預計付款日</label> <input type="text"
					class="form-control" name="Except_Payment_Date" readonly="readonly"
					id="" value="${paydate}">

			</div>
			<div class="form-group col-md-5">
				<label for="Recript_date">憑證日期</label> <input type="text"
					class="form-control" name="Recript_date" id="" readonly="readonly"
					value="${keyday}">

			</div>
			<div class="form-group col-md-5">
				<label>憑證圖檔</label> <img src="..${recript_pic}" alt="" height="200"
					width="200">
			</div>
			<c:if test="${not empty sug}">
				<div class="form-group col-md-5">
					<label> 簽核 說明:</label>
					<table class="table table-hover">
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
								<td>${sig.sig_Date}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${not empty sigSug}">
				<div class="form-group  col-md-5">
					<label>退回原因: ${sigSug}</label>
				</div>
			</c:if>

			<c:if test="${not empty manager}">
				<div class="form-group col-md-5">
					<label>審核人員</label> <select name="selectPOManager">
						<c:forEach var="poman" items="${manager}">
							<option value="${poman.emp_id}">${poman.emp_name}
								${poman.emp_job}</option>
						</c:forEach>
					</select>
				</div>
			</c:if>
			<div class="form-group col-md-5">
				<label>簽核意見:</label>
				<textarea rows="5" cols="50" name="SignSug">
    </textarea>
			</div>
						<div class="form-group col-md-5 text-right">
			
			<input type="submit" name="action" value="送出"> <input
				type="submit" name="action" value="退回">
				</div>
		</form>
	</c:if>
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