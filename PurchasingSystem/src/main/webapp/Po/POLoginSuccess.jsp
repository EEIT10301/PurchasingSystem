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

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 14rem;
}

.imgp {
	padding: 10px;
}
</style>
</head>
<body class="bg">
	<h1><font face="微軟正黑體">採購系統</font></h1>
	<div class="text-right"><font face="微軟正黑體">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 </font><a
			href='POLogout.controller'><button type="button" class="btn btn-primary">登出</button></a>
	</div>
	<div class="text-center">
		<br> <span>${sendok}</span>
		<hr>

		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href='selectprice.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待詢價採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待審核採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='signedorder.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待下單採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='placedOrder.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待收貨採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='Polist.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待辦請款單</font></h5>
				</div>
			</div>
			<br>
			<div class="card bg-light f">
				<a href='POSignStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">採購單狀態</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='StatusMain.jsp' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">查詢請款單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POFinalStatement.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title">查詢已結案採購單</h5>
				</div>
			</div>
		</c:if>
		<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href='sendEmployee.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待分派採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='POManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待審核採購單</font></h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href='todoSignInvoice.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待審核請款單</font></h5>
				</div>
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