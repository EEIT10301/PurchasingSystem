<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待分派採購單</title>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
	<div class="right">
	<c:if test="${not empty nosendlist}">
		<h2>${nosendlist}</h2>
	</c:if>
	
	<c:if test="${not empty sendlist}">
	<br>
		<h3>分派員工</h3>
			<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>採購單號</th>
					<th>產生時間</th>
				</tr>			
			</thead>
			<tbody id="myTable">
			<c:forEach var="sendl" items="${sendlist}">
				<c:if test="${sendl.sig_rank==1}">
				<tr>
					<td>${sendl.po_id}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${sendl.sig_date}"/></td>
					
				<form action="<c:url value="/Po/sendEmployeesss.controller"/>" method="post">
					<c:forEach var="sendl1" items="${sendlist}">
					<c:if test="${sendl1.po_id == sendl.po_id and sendl1.sig_rank ==2}">
					
						<td><input type='hidden' name='po_manger' value='${sendl1.po_manger}'></td>
						<td><input type='hidden' name='po_sta' value='${sendl1.po_sta}'></td>
						<td><input type='hidden' name='po_id' value='${sendl1.po_id}'></td>
						<td><input type='hidden' name='sig_date' value='${sendl1.sig_date}'></td>
						<td><input type='hidden' name='sig_sta' value='${sendl1.sig_sta}'></td>
						<td><input type='hidden' name='sig_sug' value='${sendl1.sig_sug}'></td>
						<td><input type='hidden' name='sig_rank' value='${sendl1.sig_rank}'></td>
						<td><input type='submit' name='send'  class='btn btn-default' value='分派'></td>
										
				</c:if>
				</c:forEach>
				</form>
				</tr>
				</c:if>				
			</c:forEach>
	</tbody>
	</table>
	</c:if>
	</div>
		

	<script src="../js/app.js"></script>
</body>
</html>