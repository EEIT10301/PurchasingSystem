<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待下單採購單</title>
</head>
<body>
<c:if test="${not empty selectlists}">
<c:forEach var="signedorder" items="${selectlists}">
<c:if test="${signedorder.sig_rank==4}">
<p>採購單編號: ${signedorder.po_id}</p>
<p>簽核主管: ${signedorder.employeeBean.emp_name}</p>
<p>簽核時間: ${signedorder.sig_date}</p>
</c:if>
</c:forEach>
</c:if>


</body>
</html>