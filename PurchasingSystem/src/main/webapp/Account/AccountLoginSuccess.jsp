<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
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
	background-color: /* 	border-right:grey solid 1px; */
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
				<c:if test="${user.emp_level==2}">
				<tr>
					<td><a href="">待分派事項</a></td>
				</tr>
				<tr>
					<td><a href="ToDoSignList.jsp">待簽核事項</a></td>
				</tr>
				</c:if>
				<c:if test="${user.emp_level==1}">
				<tr>
					<td><a href="">被分派事項</a></td>
				</tr>
				</c:if>
				
			</table>
		</div>
		<div class="right"></div>
	</div>
</body>
</html>