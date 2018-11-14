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
<title>Insert title here</title>
<style>
.right {
	width: 75%;
	float: right;
	text-align: center;
	height: 1500px;
}

.nav nav-tabs {
	width: 75%;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.left {
	width: 20%;
	float: left;
	text-align: center;
	height: 1500px;
	 position: absolute;
  	top: 150px;

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
	float: left;
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

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

#message{
color:red;
text-size:10px;
}
</style>
</head>
<body class="bg">
<h3>財務系統</h3>
	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='../Account/AccountLogout.controller'><button type="button" class="btn btn-white btn-sm">登出</button></a>
	</div>
	<hr>
<div class="left">
<ul class="nav flex-column">
<c:if test="${user.emp_level==2}">
			<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoAssignInvoice.controller"> <img
					class="card-img-top imgp" src="../sysimg/s1.png"> <span data-feather="home"></span>
						待分派請款單 <span class="sr-only"></span>
				</a></li>
				
			<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoSignInvoice.controller"> <img
					class="card-img-top imgp" src="../sysimg/s2.png"> <span data-feather="home"></span>
						待審核請款單 <span class="sr-only"></span>
				</a></li>
		</c:if>
		<c:if test="${user.emp_level==1}">
		<li class="nav-item"><a class="nav-link active"
					href="../Account/ToDoSignlevel1.controller"> <img
					class="card-img-top imgp" src="../sysimg/s2.png"> <span data-feather="home"></span>
						待審核請款單 <span class="sr-only"></span>
				</a></li>
		</c:if>
		<li class="nav-item"><a class="nav-link active"
					href="../Account/StatusMainAcc.jsp"> <img
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