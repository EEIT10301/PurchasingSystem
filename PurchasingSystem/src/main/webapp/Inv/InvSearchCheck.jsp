<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>驗收單查詢</title>
</head>
<body>


<form action="<c:url value="/Inv/CheckBean" />" method="post"> 

	<input type="submit" value="查詢驗收單"><br>
	</form>
</body>
</html>