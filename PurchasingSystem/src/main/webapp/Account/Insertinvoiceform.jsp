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
	</script>
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
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
input, select {
	display: block;
}
</style>
</head>
<%@ include file="../POInclude.jsp" %>
<body>
<div class="right">
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

		<input class="btn btn-primary" type="reset" value="重新輸入"> <input
			class="btn btn-primary" type="submit"  id="opener" value="送出">
			<input type="hidden" value="${inv_id}" name="invid">
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
     
			
	
	<script>
$(document).ready(function(){
	var invid="${inv_id}";
	var successmeg="${successmeg}";
	var errormeg="${errormeg}";
	if(successmeg==="3"){
	alert("請款單:"+invid+"新增成功");
	window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp';}
	if(errormeg=="4"){
	alert("請款單:"+invid+"新增失敗");
	window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp';}
});

</script>


</body>
</html>