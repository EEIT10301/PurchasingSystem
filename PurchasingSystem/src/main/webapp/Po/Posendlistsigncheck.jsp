<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ include file="../POInclude.jsp"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

#thead2{
font-size: 30px;
}


#submitbutton{
display: inline;

}

#doublesubmitbutton{
 position:absolute; 
 right:700px; 
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}
</style>
</head>


<body class="bg">
<div class="right">
<c:if test="${not empty poid1 and not empty AllPO_Vendors and not empty Podetailbeans and  not empty allListprice}">
<form action="<c:url value="/Po/podetailupdate.controller" />" method="post">
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th id="thead2">採購單編號</th>
<td id="thead2">${poid1}</td>

</tr>
<tr>
<th id="thead2">選擇廠商</th>
<td id="thead2">${AllPO_Vendors.vendor_name}</td>
<td><Input type='hidden' name='AllPO_Vendors' value='${AllPO_Vendors.vendor_id}'></td>
</tr>
</thead>
<tbody>

<tr>
<th>料號</th>
<th>請購數量</th>
<th>預估價格</th>
<th>實際採購數量</th>
<th>實際採購價格</th>
<th>該物料總價格</th>
</tr>

<c:forEach var="Podetailbeans1" items="${Podetailbeans}">
<tr>
<td>${Podetailbeans1.part_No}</td>
<td>${Podetailbeans1.total_Qty}</td>
<td>${Podetailbeans1.market_Price}元</td>
<td>${Podetailbeans1.quotation}</td>
<td>${Podetailbeans1.total_Price}元</td>
<td>${Podetailbeans1.total_Price*Podetailbeans1.quotation}元</td>
<td><Input type='hidden' name='po_id' value='${Podetailbeans1.po_id}'></td>
<td><Input type='hidden' name='part_No' value='${Podetailbeans1.part_No}'></td>
<td><Input type='hidden' name='market_Price' value='${Podetailbeans1.market_Price}'></td>
<td><Input type='hidden' name='quotation' value='${Podetailbeans1.quotation}'></td>
<td><Input type='hidden' name='total_Price' value='${Podetailbeans1.total_Price}'></td>
<td><Input type='hidden' name='total_Qty' value='${Podetailbeans1.total_Qty}'></td>
</tr>
</c:forEach>
<tr>
<th>總採購價格</th>
<td> ${allListprice}元</td>
<td><Input type='hidden' name='allListprice' value='${allListprice}'></td>
</tr>
<tr>
<th>簽和順序 step1</th>
<td>
<select name="pomanger">
		<c:forEach var="pomangers1" items="${pomangers}">
		   <option value='${pomangers1.emp_id}'>採購部主管: ${pomangers1.emp_name} ${pomangers1.emp_job}		   
		    </option>
		</c:forEach>	 	
		</select>
</td>
</tr>
<c:if test="${not empty boss}">
<tr>
<th>簽核順序 step2</th>
<td>${boss.emp_job}: ${boss.emp_name} </td>
<td> <Input type='hidden' name='boss' value='${boss.emp_id}'></td>
</tr>
</c:if>
<tr>
<th>簽核意見</th>
<td ><textarea   rows="5" cols="50"  name="SignSug"></textarea></td>
<td><Input type='hidden' name='posta1' value='${posta1}'></td>
<td><Input type='hidden' name='poid1' value='${poid1}'></td>
</tr>
</tbody>
</table>

<div id="doublesubmitbutton">

<Input id="submitbutton" type='submit' name='send' value='重新輸入'>
<Input id="submitbutton" type='submit' name='send' value='送出'>
</div>

</form>
</c:if>
</div>




<%-- <form action="<c:url value="/Po/podetailupdate.controller" />" method="post"> --%>
<%--   <h2>採購單編號: ${poid1}</h2> --%>
<%--   <p>選擇廠商: ${AllPO_Vendors.vendor_name}<p> --%>
<%--    <Input type='hidden' name='AllPO_Vendors' value='${AllPO_Vendors.vendor_id}'> --%>
<%-- <c:forEach var="Podetailbeans1" items="${Podetailbeans}"> --%>
<%-- <p>料號:${Podetailbeans1.part_No}<p> --%>
<%-- <p>請購數量: ${Podetailbeans1.total_Qty}<p> --%>
<%-- <p>預估價格: ${Podetailbeans1.market_Price}元<p> --%>
<%-- <p>實際採購數量: ${Podetailbeans1.quotation}<p> --%>
<%-- <p>實際採購價格: ${Podetailbeans1.total_Price}元<p> --%>
<%-- <p>該物料總價格: ${Podetailbeans1.total_Price*Podetailbeans1.quotation}元<p> --%>
<%-- 	  <Input type='hidden' name='po_id' value='${Podetailbeans1.po_id}'> --%>
<%--      <Input type='hidden' name='part_No' value='${Podetailbeans1.part_No}'> --%>
<%-- 	 <Input type='hidden' name='market_Price' value='${Podetailbeans1.market_Price}'> --%>
<%-- 	<Input type='hidden' name='quotation' value='${Podetailbeans1.quotation}'> --%>
<%-- 	<Input type='hidden' name='total_Price' value='${Podetailbeans1.total_Price}'> --%>
<%--   <Input type='hidden' name='total_Qty' value='${Podetailbeans1.total_Qty}'> --%>
<%-- </c:forEach> --%>
<%-- <p>總採購價格 ${allListprice} 元<p> --%>
<%-- <Input type='hidden' name='allListprice' value='${allListprice}'> --%>
<!-- <p>簽和順序 1: -->
<!-- <select name="pomanger"> -->
<%-- 		<c:forEach var="pomangers1" items="${pomangers}"> --%>
<%-- 		   <option value='${pomangers1.emp_id}'>採購部主管: ${pomangers1.emp_name} ${pomangers1.emp_job}		    --%>
<!-- 		    </option> -->
<%-- 		</c:forEach>	 	 --%>
<!-- 		</select><p> -->
<%-- <c:if test='${not empty boss}'> --%>
<%-- <p>簽和順序 2: ${boss.emp_job}: ${boss.emp_name}  <p> --%>
<%--   <Input type='hidden' name='boss' value='${boss.emp_id}'> --%>
<%-- </c:if> --%>
<!--     簽核意見:<p><textarea rows="5" cols="50"  name="SignSug"></textarea></p> -->
<%--   <Input type='hidden' name='posta1' value='${posta1}'> --%>
<%--    <Input type='hidden' name='poid1' value='${poid1}'>	  --%>
<!-- <p><Input type='submit' name='send' value='重新輸入'><p> -->
<!-- <p><Input type='submit' name='send' value='送出'><p> -->
<!-- </form> -->

</body>
</html>