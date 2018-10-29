<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here....</title>
</head>
<body>
<h3>員工  ${user.emp_id}/${user.emp_name}/${user.emp_level}</h3>

<c:if test="${user.emp_level==1}">
<a href=''>待詢價採購單 </a>
<a href=''>待下單採購單 </a>
<a href=''>申請請款單 </a>
</c:if>

<a href=''>待簽核請購單</a>
<a href=''>待簽核採購單</a>
<a href=''>待簽核驗收單</a>
<c:if test="${user.emp_level==2}">
<a href=''>待分派採購單</a>
</c:if>

</body>
</html>