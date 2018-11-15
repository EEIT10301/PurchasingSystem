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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/locales/LANG.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	height: 6.5rem;

}

.imgp {
	padding: 10px;
}
.card-text{
	font-size:11px;
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
</style>
</head>
<body class="bg">
<h3>財務系統</h3>
	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 
		<a href='AccountLogout.controller'><button type="button" class="btn btn-primary btn-sm">登出</button></a>

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
</body>
</html>