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
<title>財務系統</title>
<style>
.bg {
	background-color: #FDF5E6;
}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 16rem;
}

.m {
	/* 畫面內縮 */
	margin: 30px;
}
</style>
</head>

<body class="bg m">
	<h3>財務系統</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<a href='AccountLogout.controller'><button type="button">登出</button></a>
	<div class="text-center">
		<hr>
		<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href="ToDoAssignInvoice.controller" class="btn"> <img
					class="card-img-top" src="../sysimg/s1.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待分派請款單</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href="ToDoSignInvoice.controller" class="btn"><img
					class="card-img-top" src="../sysimg/s2.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待簽核請款單</h5>
				</div>
			</div>

		</c:if>
		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href="ToDoSignlevel1.controller" class="btn"><img class="card-img-top" src="../sysimg/s2.png"
					style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">待簽核請款單</h5>
				</div>
			</div>
		</c:if>
		<div class="card bg-light f">
			<a href="StatusMainAcc.jsp" class="btn"><img class="card-img-top" src="../sysimg/s4.png"
				style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title">查詢請款單狀態</h5>
			</div>
		</div>
		<div class="card bg-light f">
			<a href="InqueryAccountPayable.jsp" class="btn"><img class="card-img-top" src="../sysimg/s3.png"
				style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title">查詢廠商帳款明細</h5>
			</div>
		</div>
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