<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ include file="../AppInclude.jsp"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>請購申請</title>
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
<div class="right">
<h3>${user.emp_id} ${user.emp_level} ${user.emp_name}</h3>
<c:if test="${empty Categlory}">

<h3>選擇產品大項</h3>
<a href='ApplySend.controller?Categorly=零組件'>零組件</a>
<a href='ApplySend.controller?Categorly=PC'>PC</a>
<a href='ApplySend.controller?Categorly=主板組件'>主板組件</a>
<a href='ApplySend.controller?Categorly=組合材號'>組合材號</a>
<a href='ApplySend.controller?Categorly=說明書'>說明書</a>
</c:if>


<c:if test="${not empty Categlory}">
<h3>產品大項: ${Categlory}</h3>
</c:if>

<c:if test="${cartnumber>0}">
<h3>請購清單: 已加入${cartnumber}項物料</h3>
</c:if>
<h3>${cate}</h3>
<h3>${errors.cate}</h3>
 
<c:if test="${not empty product}">
<a href='ApplyShopping.controller?send=search'>請購清單</a>
<form action="<c:url value="/Apply/ApplyShoppingaddcart.controller" />" method="post">
<input class="form-control" id="myInput" type="text" width="500px" placeholder="Search"><br/>
<table class="table table-striped table-hover">
<thead>
			<tr>
				<th>料號</th>
				<th>產品名稱</th>
				<th width="250px">產品大項</th>
				<th>產品大項</th>
				<th>規格簡述</th>
				<th>平均購買價格</th>
				<th>目前庫存</th>
				<th>請購數量</th>

			</tr>
			</thead>
<tbody id='myTable'>			
<c:forEach var="pro" items="${product}">
<tr>
<td>${pro.part_no}</td>
<td>${pro.pro_name}</td>
<td>${pro.pro_cate}</td>
<td>${pro.pro_spe}</td>
<td>${pro.pro_intro}</td>
<td>${pro.pro_price}</td>
<td>${pro.pro_amount}</td>
<td><input type="text" name="productamount" value=""></td>
<td><Input type='hidden' name=part_no value='${pro.part_no}'>
  <Input type='hidden' name='pro_cate' value='${pro.pro_cate}'>
  <Input type='hidden' name='pro_name' value='${pro.pro_name}'>
  <Input type='hidden' name='pro_spe' value='${pro.pro_spe}'>
  <Input type='hidden' name='pro_intro' value='${pro.pro_intro}'>
  <Input type='hidden' name='pro_price' value='${pro.pro_price}'>
  <Input type='hidden' name='pro_amount' value='${pro.pro_amount}'>
  <Input type='hidden' name='pro_img' value='${pro.pro_img}'>
  <Input type='hidden' name='pro_date' value=''></td>
</tr>
</c:forEach>
 </tbody>
 </table>
  <Input type='submit' name='send' value='加入請購清單'>
</form>
  </c:if>
<script src="../js/app.js"></script>
</div>
</body>
</html>