<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>採購單編號:${productdetail.po_id}</h2>

<c:if test="${not empty selectorder }">
<form action="<c:url value="/Po/POLogin.controller"/>" method="post">

<p>${selectorder.po_id}</p>
送貨預估日期:<input type="datetime" name="sig_date"><br>
<br>建議:<p><textarea name="SignSug"  rows="5" cols="50" ></textarea></p>
<input type="submit" name="send" value="送出下單">
</form>
</c:if>
</body>
</html>