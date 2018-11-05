<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${invmain.chk_Id}驗收單細項</title>
</head>
<body>
<h2>待驗收單號${invmain.chk_Id}</h2>
<form action="<c:url value=""/>"method="post">
<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
<P>項目:${invpromain.part_No}</P>
</c:forEach>
</form>
</body>
</html>