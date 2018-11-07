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
	<button type="button" class="btn"><a href='AccountLogout.controller'>登出</a></button>
	<br>
	<hr>
	<div class="allpage">
		<div class="left">
			<table>
				<c:if test="${user.emp_level==2}">
				<tr>
					<td><a href="ToDoAssignInvoice.controller">待分派請款單</a></td>
				</tr>
				<tr>
					<td><a href="ToDoSignInvoice.controller">待簽核請款單</a></td>
				</tr>
				
				</c:if>
				<c:if test="${user.emp_level==1}">
				<tr>
					<td><a href="ToDoSignlevel1.controller">待簽核請款單</a></td>
				</tr>
				</c:if>
				<tr><td><a href='StatusMainAcc.jsp'>查詢請款單狀態</a></td></tr>
				<tr>
					<td><a href="ShowAccountPayableList.controller">查詢廠商帳款明細</a></td>
				</tr>
			</table>
		</div>
		<div class="right"></div>
	</div>
</body>
</html>