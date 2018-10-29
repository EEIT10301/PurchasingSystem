<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${empty user}">
	<%
		request.setAttribute("nouser", "登入過期請重新登入");
			request.getRequestDispatcher("/Apply/ApplyLogin.jsp").forward(request, response);
	%>
</c:if>
</head>
<body>

<h3>${user.emp_id}</h3>
<h3>${user.emp_name}</h3>
<h3>${user.emp_level}</h3>

<h3>${applyok}</h3>
<c:if test="${user.emp_level==1}">
<a href='ApplySend.jsp'>請購申請 </a>
</c:if>
<%-- <c:if test="${user.emp_level!=1}"> --%>
<a href='toApplySignnerdetail.controller'>待簽核請購單</a>
<%-- </c:if> --%>

<a href='toApplySignpro.controller'>請購單狀態 </a>

</body>
</html>