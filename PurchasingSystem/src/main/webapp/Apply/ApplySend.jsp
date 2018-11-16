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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
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
/* 	margin: 30px; */
}
.right{
	width:82%;
    float:left;
    font-size: 1.5em;
}
.right input{
		width:150px;
		background-color: white;
		font-size: 1.05em;
	}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 18rem;
	height: 18rem;
}

.imgp {
	float:left;
	height:35px;
	width:30px;
}
.imgp1 {

	height:128px;
	width:128px;
}
.d {
	/* 方格排列 */
	display: inline-block;
	width: 14rem;
	height: 4rem;
}
</style>
</head>
<body class="bg">

	
<c:if test="${empty Categlory}">
<div class="right">
<div class="text-center">
<h2 align="center">選擇物料項目</h2>
<br>
<br>
<div class="card bg-light f">
<a href='ApplySend.controller?Categorly=零組件' class="btn">
<img class="card-img-top imgp1" src="../sysimg/s8.png"></a>
<div class="card-body">
<h5 class="card-title">零組件</h5>
</div></div>
<div class="card bg-light f">
<a href='ApplySend.controller?Categorly=PC' class="btn">
<img class="card-img-top imgp1" src="../sysimg/s9.png"></a>
<div class="card-body">
<h5 class="card-title">PC</h5>
</div></div>
<div class="card bg-light f">
<a href='ApplySend.controller?Categorly=主板組件' class="btn">
<img class="card-img-top imgp1" src="../sysimg/s10.png"></a>
<div class="card-body">
<h5 class="card-title">主板組件</h5>
</div></div>
<div class="card bg-light f">
<a href='ApplySend.controller?Categorly=組合材號' class="btn">
<img class="card-img-top imgp1" src="../sysimg/s11.png"></a>
<div class="card-body">
<h5 class="card-title">組合材料</h5>
</div></div>
<div class="card bg-light f">
<a href='ApplySend.controller?Categorly=說明書' class="btn">
<img class="card-img-top imgp1" src="../sysimg/s12.png"></a>
<div class="card-body">
<h5 class="card-title">說明書</h5>
</div></div>
					
<!-- <a href='ApplySend.controller?Categorly=PC'>PC</a> -->
<!-- <a href='ApplySend.controller?Categorly=主板組件'>主板組件</a> -->
<!-- <a href='ApplySend.controller?Categorly=組合材號'>組合材號</a> -->
<!-- <a href='ApplySend.controller?Categorly=說明書'>說明書</a> -->
</div>
</div>
</c:if>


 
<c:if test="${not empty product}">
<div class="right">
<c:if test="${not empty Categlory}">
<h3 align="center">物料項目: ${Categlory}</h3>
</c:if>
<c:if test="${cartnumber>0}">
<%-- <h4>請購清單: 已加入${cartnumber}項物料</h4> --%>
<div class="card bg-light d">
<a href='ApplyShopping.controller?send=search'><img class="card-img-top imgp" src="../sysimg/s1.png">
</a>
<div class="card-body">
<h5 class="card-title">已加入${cartnumber}項物料</h5>
</div>
</div>
</c:if>
<h4><span>${cate}</span></h4>
<h4><span>${errors.cate}</span></h4>
<form action="<c:url value="/Apply/ApplyShoppingaddcart.controller" />" method="post">
<input class="form-control"  id="myInput" type="text" width="500px" placeholder="Search"><br/>

<table class="table table-striped table-hover">
<thead>
			<tr>
				<th>料號</th>
				<th>物料名稱</th>
				<th >物料項目</th>
				<th>規格簡述</th>
				<th>規格詳述</th>
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
<br>
<div class="card bg-light d">
<a href='ApplySend.controller?Categorly=again'><img class="card-img-top imgp" src="../sysimg/s13.png">
</a><div class="card-body"><h5 class="card-title">返回物料項目</h5></div></div>

</div>
  </c:if>
<script src="../js/app.js"></script>

</body>
</html>