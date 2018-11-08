<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>財務系統</title>
<style>
</style>
</head>

<body>
	<h3>財務系統</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<a href='AccountLogout.controller'><button type="button">登出</button></a>
	<br>
	<hr>
	<div>
		<div>
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
				<tr>
					<td><a href='StatusMainAcc.jsp'>查詢請款單狀態</a></td>
				</tr>
				<tr>
					<td><a href='ShowAccountPayableList.controller'>查詢廠商帳款明細</a></td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>