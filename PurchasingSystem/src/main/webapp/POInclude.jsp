<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>採購系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.left {
	width: 15%;
	float: left;
	text-align: center;
	height: 500px;
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
	<h3><font face="微軟正黑體">採購系統</font></h3>
	<div class="text-right" style="font-family:微軟正黑體;">
		${user.emp_name} ${user.emp_job},你好<a
			href='POLogout.controller'><button type="button" class="btn">登出</button></a>
	</div>
	<hr>
	<div class="left">
		<br> <span>${sendok}</span>

		<c:if test="${user.emp_level==1}">
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='selectprice.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">待詢價採購單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='signedorder.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">待下單採購單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='placedOrder.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">待收貨採購單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='POManagerSigner.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">待審核採購單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='POSignStatement.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">採購單狀態</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='Polist.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">待辦請款單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='StatusMain.jsp' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">查詢請款單</a> -->
<!-- 			</div> -->
<!-- 			<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
<!-- 				<a href='POFinalStatement.controller' class="btn" style="height:2em"><img -->
<!-- 					class="card-img-top imgp" src="../sysimg/s2.png" style="height:35px; width:30px; float:left">查詢已結案請款單</a> -->
<!-- 			</div> -->
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
                  	待審核採購單
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
			<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='sendEmployee.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<p class="card-text">待分派採購單</p>
			</div>
			<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='POManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<p class="card-text">待審核採購單</p>
			</div>
			<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='todoSignInvoice.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<p class="card-text">待審核請款單</p>
			</div>
		</c:if>
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