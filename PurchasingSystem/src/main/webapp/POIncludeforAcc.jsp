<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css" media="all" rel="stylesheet"
        type="text/css" />
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/piexif.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/sortable.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/plugins/purify.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/fileinput.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/locales/LANG.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>採購系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
}

.left {
	width: 20%;
	float: left;
	text-align: center;
	height: 1500px;
}

.right{
margin-left:50px;
width: 75%;
	float: left;
	text-align: center;
	height: 1500px;


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
	height:50px;
	width:50px;
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

.btn:link,
.btn:visited {
  	text-transform: uppercase;
  	text-decoration: none;
  	padding: 10px 20px;
  	display: inline-block;
  	border-radius: 100px;
  	transition: all .2s;
  	position: relative;
}

.btn:hover {
  	transform: translateY(-3px);
  	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
  	transform: translateY(-1px);
  	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
}

.btn-white {
	font-size: 14px;
	margin-left:30px;
	margin-right:30px;
}

nav{
	background-color: rgb(248, 219, 166);
	padding-top: 30px;
	padding-left: 30px;
	padding-right: 30px;
}
</style>
</head>
<body class="bg">
<nav>
	<h1><font face="微軟正黑體">採購系統</font></h1>
	<a href="POLoginSuccess.jsp" style="font-family:微軟正黑體;">回首頁</a>
	<div class="text-right" style="font-family:微軟正黑體;">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好<a
			href='POLogout.controller'><button type="button" class="btn btn-white btn-sm">登出</button></a>
	</div>
	<hr></nav><br>
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
                  	待處理請款單
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
                  	查詢已結案採購單
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="POVendor.jsp">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="layers"></span>
                  	廠商更新
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
	
</body>
</html>