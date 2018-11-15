<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	 crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
	 crossorigin="anonymous"></script>
<title>財務系統</title>
<style>
.bg {
	/* 	background-image:  	  linear-gradient(to right bottom,   */
	/*       rgba(50, 0, 50, 0.1),  */
	/*       rgba(50, 0, 50, 0.1)),  */
	/*   	url('https://images.unsplash.com/photo-1495464101292-552d0b52fe41?auto=format&fit=crop&w=1350&q=80'); */
	background-color: #FDF5E6;
	font-family: "微軟正黑體";
/* 	margin: 30px; */
}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 14.5rem;
}

.text-center {
	
	margin-top: 100px;
}

.imgp {
	padding: 10px;
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

nav{
background-color: rgb(248, 219, 166);
padding-top:30px;
padding-left:30px;
padding-right:30px;
}
</style>

</head>

<body class="bg">
<nav>

	<h2><font face="微軟正黑體">財務系統</font></h2>

	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='AccountLogout.controller'><button type="button"
				class="btn btn-white btn-sm">登出</button></a>
			<hr>
	</div>
	</nav>
	
	<div class="text-center">
		<c:if test="${user.emp_level==2}">
			<div class="card bg-light f">
				<a href="ToDoAssignInvoice.controller" class="btn"> <img
					class="card-img-top" src="../sysimg/s1.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待分派請款單</font><span class="badge badge-danger">${noDispatchInv}</span>
					</h5>
				</div>
			</div>
			<div class="card bg-light f">
				<a href="ToDoSignInvoice.controller" class="btn"> <img
					class="card-img-top" src="../sysimg/s2.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">
						<font face="微軟正黑體">待簽核請款單</font><span class="badge badge-danger">${noToSignInvforBoss}</span>
					</h5>
				</div>
			</div>
		</c:if>
		<c:if test="${user.emp_level==1}">
			<div class="card bg-light f">
				<a href="ToDoSignlevel1.controller" class="btn"><img
					class="card-img-top" src="../sysimg/s2.png" style="padding: 10px;"></a>
				<div class="card-body">
					<h5 class="card-title">
						待簽核請款單<span class="badge badge-danger">${noToSignInvtotal}</span>
					</h5>
				</div>
			</div>
		</c:if>
		<div class="card bg-light f">
			<a href="StatusMainAcc.jsp" class="btn"><img class="card-img-top"
				src="../sysimg/s4.png" style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title"><font face="微軟正黑體">查詢請款單狀態</font></h5>
			</div>
		</div>
		<div class="card bg-light f">
			<a href="ShowAccountPayableList.controller" class="btn"><img
				class="card-img-top" src="../sysimg/s3.png" style="padding: 10px;"></a>
			<div class="card-body">
				<h5 class="card-title"><font face="微軟正黑體">查詢廠商款項明細</font></h5>
			</div>
		</div>
	</div>
<script>
$(document).ready(
		function() {
			var row = 5;
			$.ajax({
				url : "LoginSuccessSelectInvSignList.do",
				type : "GET",
				success : function(data) {
					if (document.URL.indexOf("#") == -1) {
						url = document.URL + "#";
						location = "#";
						location.reload(true);
					}
				}
			});
			$("#myInput").on("keyup",function() {
						var value = $(this).val().toLowerCase();
						$("#selectAll tr").filter(function() {
									$(this).toggle($(this).text().tolowerCase()
													.indexOf(value) > -1)
								});
					});

		});
</script>
</body>
</html>
