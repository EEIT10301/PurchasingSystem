<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../POInclude.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>待詢價表單頁面</title>
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
	<c:if test="${empty noselectlists}">
	<h2>${noselectlists}</h2>
	</c:if>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>