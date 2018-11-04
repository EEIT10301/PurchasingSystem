<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   	<style type="text/css">
   	input,select{
   	display:block;
   	}
   	</style>
</head>

<body>
    <h1>請款單</h1>
 <form method="post" action="<c:url value="/Po/resendInvoice.controller"/>" enctype="multipart/form-data">
 		<input type="hidden" value="${poid}" name="poid">
        <label for="Inv_id">請款單單號</label>
        <input type="text" name="Inv_id" id="" readonly="readonly" value="${invoice.inv_id}">
        <label for="Emp_name">申請人</label>
        <input type="text" name="Emp_name" id="" readonly="readonly" value="${user.emp_name}">
        <label for="Emp_dep">所屬部門</label>
        <input type="text" name="Emp_dep" id="" readonly="readonly" value="${user.emp_dep}">
        <label for="Vendor_name">廠商名稱</label>
        <input type="text" name="Vendor_name" readonly="readonly" id="" value="${pomain.pO_Vendor_InfoBean.vendor_name}">
        <label for="Vendor_id">廠商統編</label>
        <input type="text" name="Vendor_id" readonly="readonly" id="" value="${pomain.pO_Vendor_InfoBean.vendor_id}">
        <label for="Total_price">請款金額</label>
        <input type="text" name="Total_price" readonly="readonly" id="" value="${invoice.total_price}">
        <label for="Payment_method">付款方式</label>
        <input type="text" name="Payment_method" readonly="readonly" id="" value="${pomain.pO_Vendor_InfoBean.payment_method}">
        <label for="Except_Payment_Date">預計付款日</label>
        <input type="text" name="Except_Payment_Date" id="" value="${paymentDate}">
        <label for="Recript_date">憑證日期</label>
        <input type="text" name="Recript_date" id="" value="${invoice.recript_date}">
        <img src="..${invoice.recript_pic}" alt="" height="200" width="200">
        <label for="Receiptpic">憑證圖檔</label>
        <input type="file" name="Receiptpic" id="" value="">

        說明:<p>${sigSug}<p>
        <c:if test="${not empty manager}">
         主管<select name="selectPOManager">
        <c:forEach var="poman" items="${manager}">
        <option  value="${poman.emp_id}">${poman.emp_name} ${poman.emp_job}</option>
        </c:forEach>
        </select>
        </c:if>
      	 簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
		</textarea><p>

        <input type="submit" value="送出">

</form>
</body>
</html>