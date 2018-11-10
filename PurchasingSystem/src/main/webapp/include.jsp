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
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.left{
	width:15%;
float:left;
	text-align: center;

}
.f {
	/* 方格排列 */
	display: inline-block;
	width: 6rem;
	height: 7rem;

}

.imgp {
	padding: 10px;
}
.card-text{
	font-size:11px;
}
</style>
</head>
<body class="bg">
<h3>財務系統</h3>
	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='AccountLogout.controller'><button type="button" class="btn">登出</button></a>
	</div>
	<hr>
<div class="left">
<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href="ToDoAssignInvoice.controller" class="btn"> <img
					class="card-img-top imgp" src="../sysimg/s1.png"></a>
					<p class="card-text">待分派請款單</p>

			</div>
			<div class="card bg-light f">
				<a href="ToDoSignInvoice.controller" class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
					<p class="card-text">待審核請款單</p>
			</div>

		</c:if>
		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href="ToDoSignlevel1.controller" class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
					<p class="card-text">待審核請款單</p>
			</div>
		</c:if>
		<div class="card bg-light f">
			<a href="StatusMainAcc.jsp" class="btn"><img
				class="card-img-top imgp" src="../sysimg/s4.png"></a>
				<h5 class="card-text">查詢請款單狀態</h5>
		</div>
		<div class="card bg-light f">
			<a href="ShowAccountPayableList.controller" class="btn"><img
				class="card-img-top imgp" src="../sysimg/s3.png"></a>
				<h5 class="card-text">查詢廠商帳款明細</h5>
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