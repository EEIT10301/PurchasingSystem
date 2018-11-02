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

<form action="<c:url value="/Inv/itemin" />" method="post"> 
${check.vender_ID}
<hr>
請輸入驗收單號<input type="text" name="number"> 



	<input type="submit" value="查詢"><br>
</form>
</body>
</html>