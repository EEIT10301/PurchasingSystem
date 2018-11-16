<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	/* 	margin: 30px; */
	font-family: "微軟正黑體";
}

.right {
	width: 75%;
	float: right;
	text-align: center;
	margin-right:30px;
}

.nav nav-tabs {
	width: 75%;
}

.left {
	width: 20%;
	float: left;
	text-align: center;
	 position: absolute;
  	top: 150px;
	margin-top: 30px;
	
}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 200px;
	height: 50px;
	margin-bottom: 5px;
}

.imgp {
	/* 	padding: 0px; */
	/* 	font-size: 11px; */
	/* 	margin-right:10px; */
/* 	float: left; */
	height: 50px;
	width: 50px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family: 微軟正黑體;
	font-size: 19px;
}

span {
	margin-left: 1px;
}

#message {
	color: red;
	text-size: 10px;
}

.btn:link, .btn:visited {
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

.n {
	background-color: rgb(248, 219, 166);
	padding-top: 30px;
	padding-left: 30px;
	padding-right: 30px;
}

.lr {
	width: 40%;
	float: left;
}

.dlr {
	width: 55%;
	float: right;
}


table {
	font-size: 13px;
}

th {
    text-align: center; 
}

</style>
</head>
<body class="bg">
<nav class="n">
<h1>財務系統</h1>
	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='../Account/AccountLogout.controller'><button type="button" class="btn btn-white btn-sm">登出</button></a>
<!-- 	<a href="../Account/AccountLoginSuccess.jsp" style="font-family:微軟正黑體;">回首頁</a> -->
	</div>
	<hr>
	</nav>
<div class="left">
<ul class="nav flex-column">
<c:if test="${user.emp_level==2}">
			<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoAssignInvoice.controller"> <img
					class="card-img-top imgp" src="../sysimg/s1.png"> <span data-feather="home"></span>
						待分派請款單 <span class="sr-only"></span><span class="badge badge-danger">${noDispatchInv}</span>
				</a></li>
				
			<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoSignInvoice.controller"> <img
					class="card-img-top imgp" src="../sysimg/s2.png"> <span data-feather="home"></span>
						待審核請款單 <span class="sr-only"></span><span class="badge badge-danger">${noToSignInvforBoss}</span>
				</a></li>
		</c:if>
		<c:if test="${user.emp_level==1}">
		<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoSignlevel1.controller"> <img
					class="card-img-top imgp" src="../sysimg/s2.png"> <span data-feather="home"></span>
						待審核請款單 <span class="sr-only"></span><span class="badge badge-danger">${noToSignInvtotal}</span>
				</a></li>
		</c:if>
		<li class="nav-item"><a class="nav-link active"
					href="../Po/queryStatus.controller"> <img
					class="card-img-top imgp" src="../sysimg/s4.png"> <span data-feather="home"></span>
						查詢請款單狀態 <span class="sr-only"></span>
				</a></li>
		
		<li class="nav-item"><a class="nav-link active"
					href="../Account/ShowAccountPayableList.controller"> <img
					class="card-img-top imgp" src="../sysimg/s3.png"> <span data-feather="home"></span>
						查詢廠商帳款明細 <span class="sr-only"></span>
				</a></li>
		</ul>
</div>

</body>
</html>