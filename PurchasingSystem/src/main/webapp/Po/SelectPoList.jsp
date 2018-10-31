<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待詢價表單頁面</title>
<c:if test="${empty user}">
	<%
		request.setAttribute("nouser", "登入過期請重新登入");
			request.getRequestDispatcher("/Po/POLogin.jsp").forward(request, response);
	%>
</c:if>
</head>
<body>
	<c:if test="${not empty selectlists}">
	<c:forEach var="poprocess" items="${selectlists}">
	<c:if test="${poprocess.sig_rank==2}">
	<p>採購單編號: ${poprocess.po_id}<p>
	<p>分派主管: ${poprocess.employeeBean.emp_name}<p>
	<p>主管分派時間: ${poprocess.sig_date}<p>
    
        <c:forEach var="poprocess1" items="${selectlists}">
    <c:if test="${poprocess1.sig_rank==3 and poprocess1.po_id == poprocess.po_id}">
<%--     <Input type='text' name='po_manger' value='${poprocess1.po_manger}'> --%>
<%--     <Input type='text' name='po_sta' value='${poprocess1.po_sta}'> --%>
<%-- 	<Input type='text' name='po_id' value='${poprocess1.po_id}'> --%>
<%-- 	<Input type='text' name='sig_date' value='${poprocess1.sig_date}'> --%>
<%--     <Input type='text' name='sig_sta' value='${poprocess1.sig_sta}'> --%>
<%--     <Input type='text' name='sig_sug' value='${poprocess1.sig_sug}'> --%>
<%--     <Input type='text' name='sig_rank' value='${poprocess1.sig_rank}'> --%>
<!--     <Input type='submit' name='send' value='開始詢價'> -->
<a href='<c:url value="sendthisselectlist.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />'>
      開始詢價</a> 
       
    </c:if>
	</c:forEach>
	</c:if>
    	</c:forEach>
    	

	
	</c:if>
	<c:if test="${not empty noselectlists}">
	<h2>${noselectlists}</h2>
	</c:if>
</body>
</html>