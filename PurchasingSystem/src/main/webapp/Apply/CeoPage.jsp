<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>總經理登入</h3>
	${user.emp_id}/${user.emp_name} ${user.emp_job},你好
	<a href='ApplyLogout.controller'>登出</a>
<a href='toApplySignnerdetail.controller'>待簽核請購單</a>	
<a href='ceoPOManagerSigner.controller'>待審核採購單</a>
<a href='http://localhost:8080/PurchasingSystem/Apply/ApplySearchEndList.html'>已結案單子查詢 </a>
	<a href='toApplySignpro.controller'>請購單狀態 </a>	
	
</body>
</html>