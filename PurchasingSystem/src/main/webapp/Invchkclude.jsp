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
<title>驗收系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
font-family: '微軟正黑體';
}

.left {
	width: 20%;
	float: left;
	text-align: center;
	height: 1500px;
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
	height: 35px;
	width: 30px;
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
nav {
	background-color: rgb(248, 219, 166);
	padding-top: 30px;
	padding-left: 30px;
	padding-right: 30px;
}
</style>
</head>
<body class="bg">
<nav>
	<h1>
		<font face="微軟正黑體">驗收系統</font>
	</h1>
<!-- 	<a href="InvLoginSuccess.jsp" style="font-family: 微軟正黑體;">回首頁</a> -->
	<div class="text-right" style="font-family: 微軟正黑體;">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好<a href='InvLogout.controller'><button
				type="button" class="btn btn-sm">登出</button></a>
	<hr>
	</div>
	</nav>
	<div class="left">

		<c:if test="${user.emp_level==1 }">
			<!-- 		<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
			<!-- 				<a href='selectInvchk.controller' class="btn" style="height:2em"><img -->
			<!-- 					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">待驗收清單</a>		 -->
			<!-- 			</div> -->
			<!-- 		<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
			<!-- 				<a href='' class="btn" style="height:2em"><img -->
			<!-- 					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">驗收成功清單</a>			 -->
			<!-- 			</div> -->
			<!-- 		<div class="card bg-light f" style="font-family:微軟正黑體;"> -->
			<!-- 				<a href='chkprofail.controller' class="btn" style="height:2em"><img -->
			<!-- 					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">驗收失敗清單</a>			 -->
			<!-- 		</div> -->
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="selectInvchk.controller"> <img class=" imgp"
						src="../sysimg/s1.png"> <span data-feather="home"></span>

						待驗收清單<font color=red>${waitendsign}</font>

				</a></li>
				<li class="nav-item"><a class="nav-link" href="CheckBean">

						<img class=" imgp" src="../sysimg/s20.png"> <span

						data-feather="users"></span> 驗收成功清單
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="chkprofail.controller"> <img class="imgp"

						src="../sysimg/s15.png"> <span data-feather="file"></span>
						驗收失敗清單<font color=red>${waitendsign1}</font>

				</a></li>
				<li class="nav-item"><a class="nav-link" href="item?pageNo=1">

						

						<img class="imgp" src="../sysimg/s19.png"> <span

						data-feather="file"></span> 查詢庫存
				</a></li>
			</ul>
		</c:if>
		<c:if test="${user.emp_level==2 }">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link"
					href="sendEmployee.controller"> <img class=" imgp"
						src="../sysimg/s1.png"> <span data-feather="home"></span>
						待分派清單<font color=red>${waitendsign3}</font>
				</a></li>
								<li class="nav-item"><a class="nav-link"
					href="singcheck"> <img class=" imgp"
						src="../sysimg/s14.png"> <span data-feather="home"></span>
						查詢驗收單狀態<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="item?pageNo=1">
						<img class="imgp" src="../sysimg/s19.png"> <span
						data-feather="file"></span> 查詢庫存
				</a></li>
			</ul>

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