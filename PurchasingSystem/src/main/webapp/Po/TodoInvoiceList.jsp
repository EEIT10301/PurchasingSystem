<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ include file="../POInclude.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Insert title here</title>

<style>
#message{
color:red;
text-size:10px;
}
.right {
	width: 75%;
	float: left;
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.left {
	width: 15%;
	float: left;
	text-align: center;
	height: 1500px;
	margin-right: 10px;
}

.f {
	/* 方格排列 */
 	display: inline-block;
	width: 200px;
	height:50px;
	margin-bottom:5px;
}

.imgp {
/* 	padding: 0px; */
/* 	font-size: 11px; */
/* 	margin-right:10px; */
	float:left;
	height:35px;
	width:30px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family:微軟正黑體;
	font-size: 19px;
}
span {
	margin-left:1px;
}
</style>
</head>
<body class="bg">
<h1><font face="微軟正黑體">採購系統</font></h1>
	<a href="POLoginSuccess.jsp" style="font-family:微軟正黑體;">回首頁</a>
	<div class="text-right" style="font-family:微軟正黑體;">
		${user.emp_name} ${user.emp_job},你好<a
			href='POLogout.controller'><button type="button" class="btn btn-primary btn-sm">登出</button></a>
	</div>
	<hr>
	<div class="left">
<%-- 		<br> <span>${sendok}</span> --%>

		<c:if test="${user.emp_level==1}">

		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="selectprice.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="home"></span>
                  	待詢價採購單 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POManagerSigner.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="users"></span>
                  	待處理採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="signedorder.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="file"></span>
                  	待下單採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="placedOrder.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="shopping-cart"></span>
                  	待收貨採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Polist.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="layers"></span>
                  	待辦請款單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POSignStatement.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="bar-chart-2"></span>
                 	 查詢採購單狀態
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="StatusMain.jsp">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="layers"></span>
                  	查詢請款單狀態
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POFinalStatement.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="layers"></span>
                  	查詢結案請款單
                </a>
              </li>
            </ul>
		</c:if>
		<c:if test="${user.emp_level==2}">
		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="sendEmployee.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="home"></span>
                  	待分派採購單 <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POManagerSigner.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="users"></span>
                  	待處理採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="todoSignInvoice.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="file"></span>
                  	待審核請款單
                </a>
              </li>
             </ul>
		</c:if>		
	</div>
	<div class="right">
	<c:if test="${not empty successmeg}">
	<h2 id="message">請款單:${inv_id}${successmeg}</h2>
	</c:if>
	<c:if test="${not empty errormeg}">
	<h2 id="message">請款單${errormeg}</h2>
	</c:if>
	<c:if test="${empty list and empty listback}">
		<h2>目前無採購單需要請款</h2>
		<hr>
		<h2>無退回請款單</h2>
	</c:if>

	<c:if test="${not empty list}">
	<h2>待請款採購單</h2>

<table class="table table-striped table-hover">
<tr>
		<th scope="col">採購單單號</th>
		<th scope="col">承辦人姓名</th>
		<th scope="col">廠商名稱</th>
		<th scope="col">總金額</th>
		<th scope="col"></th>
		</tr>
		<c:forEach var="row" items="${list}">

			<tr>
				<td>${row.po_id}</td>
				<td>${row.employeeBean.emp_name}</td>
				<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
				<td>$${row.total_price}</td>
				<td><a href="NewInvoiceForm.controller?poid=${row.po_id}">新增請款單</a></td>
			</tr>
		</c:forEach>
		</table>

	</c:if>
	<hr>

	<c:if test="${not empty listback}">
	<h2>退回請款單</h2>
<table class="table table-striped table-hover">
		<c:forEach var="back" items="${listback}">
		<tr>
		<th scope="col">請款單單號</th>
		<th scope="col">承辦人姓名</th>
		<th scope="col">廠商名稱</th>
		<th scope="col">總金額</th>
		<th scope="col"></th>
		
		</tr>
			<tr>
				<td>${back.inv_id}</td>
				<td>${back.employeeBean.emp_name}</td>
				<td>${back.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
				<td>${back.total_price}</td>
				<td><a href="ShowReturnInvoiceForm.controller?poid=${back.po_id}">修改請款單</a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
<!-- 		<table> -->
<%-- 		<c:forEach var="back" items="${listback}"> --%>
<!-- 			<tr> -->
<%-- 				<td>${back.inv_id}</td> --%>

<%-- 				<td><a href="NewInvoiceForm.controller?poid=${back.po_id}">新增請款單</a></td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<!-- 		</table> -->
</div>
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