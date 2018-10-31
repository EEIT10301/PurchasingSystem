<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test="${empty user}">
	<%
		request.setAttribute("nouser", "登入過期請重新登入");
			request.getRequestDispatcher("/Po/POLogin.jsp").forward(request, response);
	%>
</c:if>
</head>
<body>

	

            <a href="../Account/Insertinvoiceform.jsp">新增請款單</a>

</body>
</html>