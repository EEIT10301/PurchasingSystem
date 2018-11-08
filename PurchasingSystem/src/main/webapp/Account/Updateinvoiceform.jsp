<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style type="text/css">
input, select {
	display: block;
}
</style>
</head>

<body>
		<h1>請款單</h1>
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
				type="hidden" value="1" name="sig_Rank"> <label for="Inv_id">請款單單號</label>
			<input type="text" name="Inv_id" id="" readonly="readonly"
				value="${invoice.inv_id}"> <label for="Emp_name">申請人</label>
			<input type="text" name="Emp_name" id="" readonly="readonly"
				value="${user.emp_name}"> <label for="Emp_dep">所屬部門</label>
			<input type="text" name="Emp_dep" id="" readonly="readonly"
				value="${user.emp_dep}"> <label for="Vendor_name">廠商名稱</label>
			<input type="text" name="Vendor_name" readonly="readonly" id=""
				value="${pomain.pO_Vendor_InfoBean.vendor_name}"> <label
				for="Vendor_id">廠商統編</label> <input type="text" name="Vendor_id"
				readonly="readonly" id=""
				value="${pomain.pO_Vendor_InfoBean.vendor_id}"> <label
				for="Total_price">請款金額</label> <input type="text" name="Total_price"
				readonly="readonly" id="" value="${invoice.total_price}"> <label
				for="Payment_method">付款方式</label> <input type="text"
				name="Payment_method" readonly="readonly" id=""
				value="${pomain.pO_Vendor_InfoBean.payment_method}"> <label
				for="Except_Payment_Date">預計付款日</label> <input type="text"
				name="Except_Payment_Date" id="" value="${paymentDate}"
				readonly="readonly"> <label for="oldRecript_date">原憑證日期</label>
			<input type="text" name="oldRecript_date" id=""
				value="${oldRecript_date}" readonly="readonly"> 
				<label
				for="Recript_date">修改憑證日期</label> <input type="date"
				name="Recript_date" id="" value="">
			<p>原憑證圖檔</p>
			<img src="..${invoice.recript_pic}" alt="" height="200" width="200">
			<input type="file" name="Receiptpic" id="" value=""> <label
				for="Receiptpic">修改憑證圖檔 </label>

			<p>退回原因:${sigSug}
			<p>
				<c:if test="${not empty manager}">
         主管<select name="selectPOManager">
						<c:forEach var="poman" items="${manager}">
							<option value="${poman.emp_id}">${poman.emp_name}
								${poman.emp_job}</option>
						</c:forEach>
					</select>
				</c:if>
				簽核意見:
			<p>
				<textarea rows="5" cols="50" name="SignSug">
		</textarea>
			<p>
				<input type="submit" value="送出">
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
		<c:set var="status1" value="dispatch"/>
		<c:choose>
			<c:when test="${(dep==dep1) && (user.emp_level==2)}">
				<a href='todoSignInvoice.controller'>回上一頁</a>
			</c:when>
			<c:when test="${(dep==dep2) && (user.emp_level==1)}">
				<a href='ToDoSignlevel1.controller'>回上一頁</a>
			</c:when>
			<c:when test="${(dep==dep2) && (user.emp_level==2) && (status==status1)}">
				<a href='ToDoAssignInvoice.controller'>回上一頁</a>
			</c:when>
			<c:otherwise>
				<a href='ToDoSignInvoice.controller'>回上一頁</a>
			</c:otherwise>
		</c:choose>

		<form method="post" action="<c:url value="/Account/ReviewInvoice.controller"/>">
		
		<input type="hidden" name="status" value="${status}"> 
		<input type="hidden" value="${invid}" name="invid">
		<label for="Inv_id">請款單單號</label>
		<input type="text" name="Inv_id" id="" readonly="readonly"
			value="${invid}">
		<label for="Emp_id">申請人</label>
		<input type="text" name="Emp_id" id="" readonly="readonly"
			value="${empid}">
		<label for="Emp_dep">所屬部門</label>
		<input type="text" name="Emp_dep" id="" readonly="readonly"
			value="${empdep}">
		<label for="Vendor_name">廠商名稱</label>
		<input type="text" name="Vendor_name" readonly="readonly" id=""
			value="${ven_name}">
		<label for="Vendor_id">廠商統編</label>
		<input type="text" name="Vendor_id" readonly="readonly" id=""
			value="${ven_id}">
		<label for="Total_price">請款金額</label>
		<input type="text" name="Total_price" readonly="readonly" id=""
			value="${price}">
		<label for="Payment_method">付款方式</label>
		<input type="text" name="Payment_method" readonly="readonly" id=""
			value="${payMethod}">
		<label for="Except_Payment_Date">預計付款日</label>
		<input type="text" name="Except_Payment_Date" readonly="readonly"
			id="" value="${paydate}">
		<label for="Recript_date">憑證日期</label>
		<input type="text" name="Recript_date" id="" readonly="readonly"
			value="${keyday}">
		<p>憑證圖檔</p>
		<img src="..${recript_pic}" alt="" height="200" width="200">
		<c:if test="${not empty sug}" >
           簽核 說明:<table>
           <tr><th>流程順序</th><th>簽核人ID</th><th>簽核人</th><th>簽核意見</th><th>簽核日期</th></tr>
        <c:forEach var="sig" items="${sug}">
        <tr><td>${sig.sig_Rank}</td> <td>${sig.account_Manger}</td><td>${sig.employeeBean.emp_name}</td><td>${sig.sig_Sug}</td> <td>${sig.sig_Date}</td></tr>
        </c:forEach>
        </table>
		</c:if>
		<c:if test="${not empty sigSug}">
		<p>退回原因: ${sigSug}</p>
		</c:if>

			<c:if test="${not empty manager}">
        審核人員<select name="selectPOManager">
					<c:forEach var="poman" items="${manager}">
						<option value="${poman.emp_id}">${poman.emp_name}
							${poman.emp_job}</option>
					</c:forEach>
				</select>
			</c:if>
			簽核意見:
			<p>
				<textarea rows="5" cols="50" name="SignSug">
		</textarea>
			<p>
				
				<input type="submit" name="action" value="送出"> 
				<input type="submit" name="action" value="退回">
		</form>
	</c:if>
	
</body>
</html>