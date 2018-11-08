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
<c:if test="${not empty selsctlists || empty selectlist.sig_Sug}">
	<c:forEach var="poprocess" items="${selsctlists}">
	<c:if test="${poprocess.sig_Rank==2}">
	<p>驗收單編號: ${poprocess.chk_Id}<p>
	<p>分派主管: ${poprocess.employeeBean.emp_name}<p>
	<p>主管分派時間: ${poprocess.sig_Date}<p>
    <c:forEach var="poprocess1" items="${selsctlists}">
    <c:if test="${poprocess1.sig_Rank==3 and poprocess1.chk_Id == poprocess.chk_Id}">
<a href='<c:url value="/Inv/sendthisselectinvprolist.controller?inv_manger=${poprocess1.inv_Manger}&inv_sta=${poprocess1.inv_Sta}&chk_id=${poprocess1.chk_Id}&inv_Sta=${poprocess1.sig_Sug }" />'>
      開始驗收</a>        
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