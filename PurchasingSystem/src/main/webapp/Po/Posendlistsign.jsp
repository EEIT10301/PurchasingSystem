<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#thead{
font-size: 36px;
}

#submit {
	position: absolute;
	right: 700px;
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
<c:if test="${empty AllPO_Vendor or empty poprocess1}">

</c:if>


<c:if test="${not empty AllPO_Vendor and not empty poprocess1}">
<form action="<c:url value="/Po/checkvendorandpodetail.controller" />" method="post">
 <div class="right">
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th id="thead">選擇廠商</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<select name="AllPO_Vendors">
		<c:forEach var="AllPO_Vendorsr" items="${AllPO_Vendor}">
		   <option value='${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_id}'>廠商名稱: ${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_name} 
		    總報價 : 	${AllPO_Vendorsr.po_totalprice}	元整   
		    </option>
		</c:forEach>	 	
</select>
</td>
</tr>
</tbody>
</table>




<table class="table table-striped table-hover" id="myTable">
<thead>
<tr >
<th id="thead">採購單單號</th>
<td id="thead">${poprocess1.pO_MainBean.po_id}</td>
<td><Input type='hidden' name='posta1' value='${poprocess1.po_sta}'></td>
<td><Input type='hidden' name='poid1' value='${poprocess1.po_id}'></td>  
        
</tr>
</thead>

<tbody>
<tr>
<th width="200px">料號</th>
<th width="200px">預估價格</th>
<th width="200px">請購數量</th>
<th width="200px">請購實際金額</th>
<th>採購實際數量</th>
</tr>
<tr>
<c:forEach var="thispo_detailBean" items="${poprocess1.pO_MainBean.pO_DetailBean}">
<tr>
<td>${thispo_detailBean.part_No}</td>
<td>${thispo_detailBean.market_Price}</td>
<td> ${thispo_detailBean.total_Qty}</td>



<td><Input type='text' name='total_Price' value='${param.total_Price}'>${errors.number}</td>
<td><Input type='text' name='quotation' value='${param.quotation}'>${errors.number}</td>
<td><Input type='hidden' name='po_id' value='${thispo_detailBean.po_id}'></td>
<td><Input type='hidden' name='part_No' value='${thispo_detailBean.part_No}'></td>
<td><Input type='hidden' name='market_Price' value='${thispo_detailBean.market_Price}'></td>
<td><Input type='hidden' name='total_Qty' value='${thispo_detailBean.total_Qty}'></td>  




</tr>
</c:forEach>

</tbody>

</table>

 <Input type='submit' name='send' value='產生詢價單' id="submit">
</div>




</form>
</c:if>


</body>
</html>