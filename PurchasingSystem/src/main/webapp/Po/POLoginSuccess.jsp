<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購系統</title>
<style>

</style>
</head>
<body>
	<h3>採購系統</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<button type="button" class="btn">登出</button>
	<br>
	<hr>

<c:if test="${user.emp_level==1}">
<a href=''>待詢價採購單 </a>
<a href=''>待下單採購單 </a>
<a href='testinsertinvoice.jsp'>待申請請款單 </a>
</c:if>

<a href=''>待簽核請購單</a>
<a href=''>待簽核採購單</a>
<a href=''>待簽核驗收單</a>
<c:if test="${user.emp_level==2 and user.emp_id =='emp005'}">
<a href='sendEmployee.controller'>待分派採購單</a>
</c:if>


</body>
</html>