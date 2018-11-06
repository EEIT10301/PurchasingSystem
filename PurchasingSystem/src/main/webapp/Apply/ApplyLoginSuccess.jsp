<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請購主頁</title>

</head>
<body>
	<h3>${user.emp_id}</h3>
	<h3>${user.emp_name}</h3>
	<h3>${user.emp_level}</h3>
    <a href='ApplyLogout.controller'>登出</a>
	<h3>${applyok}</h3>
	<c:if test="${user.emp_level==1}">
		<a href='ApplySend.jsp'>請購申請 </a>
		<a href='http://localhost:8080/PurchasingSystem/queryData.html'>物料更新 </a>
		
	</c:if>
	<%-- <c:if test="${user.emp_level!=1}"> --%>
	<a href='toApplySignnerdetail.controller'>待簽核請購單</a>
	<%-- </c:if> --%>

	<a href='toApplySignpro.controller'>請購單狀態 </a>

</body>
</html>