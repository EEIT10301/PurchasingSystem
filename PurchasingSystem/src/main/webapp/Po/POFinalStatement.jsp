<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢結案請款單</title>
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bg">
		<c:if test="${empty accountDone}">		
		<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
		<p>${noaccountDone}</p>
		</c:if>
	<c:if test="${not empty accountDone}">
	<div class="right">		
	<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
	<table class="table table-striped table-hover">				
				<thead>
				<tr>
					<th>採購單ID</th>
					<th>承辦人員</th>
					<th>結案日期</th>
					<th>備註</th>
				</tr>
				</thead>
				<tbody id='myTable'>
				<tr>
				<c:forEach var="accountDone" items="${accountDone}">
				<td><a href='<c:url value="POFinalStatementDetail.controller?po_id=${accountDone.po_id}"/>'>${accountDone.po_id}</a></td>
				
				
				<td>${accountDone.employeeBean.emp_name}</td>
				<td>
				<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${accountDone.sig_date}"/>
				</td>
				<td width="700px">${accountDone.sig_sug}</td>
				</c:forEach>
				</tr>
			</tbody>
			</table>			
		
			</div>			
			</c:if>
		
		<script src="../js/app.js"></script>
</body>
</html>