<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
   
</head>

<body>
    <h1>請款單</h1>
    <form action="<c:url value="/Account/AccountSign.controller" />" enctype="multipart/form-data" method="">
    	<input type="hidden" name="Po_id" id="" value="Po20181013001">
        <label for="Emp_id">申請人</label>
        <input type="text" name="Emp_id" id="">
        <label for="Emp_dep">所屬部門</label>
        <input type="text" name="Emp_dep" id="">
        <label for="Vendor_name">廠商名稱</label>
        <input type="text" name="Vendor_name" id="">
        <label for="Vendor_id">廠商統編</label>
        <input type="text" name="Vendor_id" id="">
        <label for="Total_price">請款金額</label>
        <input type="text" name="Total_price" id="">
        <label for="Payment_method">付款方式</label>
        <input type="text" name="Payment_method" id="">
        <label for="Except_Payment_Date">預計付款日</label>
        <input type="text" name="Except_Payment_Date" id="">
        <label for="Recript_date">憑證日期</label>
        <input type="text" name="Recript_date" id="">
        <label for="Receiptpic">憑證圖檔</label>
        <input type="file" name="Receiptpic" id="">
         <input type="submit" value="送出">
        <input type="submit" value="修改">
    </form>
</body>
</html>