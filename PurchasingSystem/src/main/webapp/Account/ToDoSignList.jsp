<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>財務系統</title>
<style>
.btn {
	background-color: #e7e7e7;
	color: black;
}

a, a:visited {
	text-decoration: none;
	color: black;
}

.left {
	width: 10%;
	float: left;
}

.right {
	width: 85%;
	float: right;
}

.allpage {
	width: 100%;
}
</style>
</head>

<body>
	<h3>財務系統</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<button type="button" class="btn">登出</button>
	<br>
	<hr>
	<div class="allpage">
		<div class="left">
			<table>


			</table>
		</div>
		<div class="right"></div>
	</div>
</body>
</html>