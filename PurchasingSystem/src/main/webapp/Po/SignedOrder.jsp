<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	 -->

<title>待下單採購單</title>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
	<%-- <c:if test="${not empty selectlists}"> --%>
	<%-- <c:forEach var="signedorder" items="${selectlists}"> --%>
	<%-- <c:if test="${signedorder.sig_rank==4}"> --%>
	<%-- <p>採購單編號: ${signedorder.po_id}</p> --%>
	<%-- <p>簽核主管: ${signedorder.employeeBean.emp_name}</p> --%>
	<%-- <p>簽核時間: ${signedorder.sig_date}</p> --%>
	<!-- <input type="button" value="下單"> -->
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>
	<%-- </c:if> --%>

	<div class="right">
	<c:if test='${empty signedOrderList}'>
		<h2>${noSignedOrderList}</h2>
	</c:if>

	<c:if test='${not empty signedOrderList}'>
		
		<h3>待下單採購單</h3>		
		<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th width="200px">採購單號</th>
				<th width="200px">簽核主管</th>
				<th width="200px">主管簽核時間</th>				
			</tr>		
		</thead>
		<tbody id="myTable">		 
		<c:forEach var='signedOrderList' items='${signedOrderList}'>
		<form action="<c:url value="/Po/signedOrderDetail.controller"/>"method="post">
			<tr>
				<td>${signedOrderList.po_id}</td>
				<td>${managerID.emp_name}</td>
				<c:forEach var='signedOrderListM_Info'
				items='${signedOrderListM_Info}'>
				<c:if test='${signedOrderList.po_id == signedOrderListM_Info.po_id}'>
				<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${signedOrderListM_Info.sig_date}"/></td>
				</c:if>
				</c:forEach>
			<td><input type='hidden' name='po_manger' value='${signedOrderList.po_manger}'></td>
			<td><input type='hidden' name='po_sta' value='${signedOrderList.po_sta}'></td>
			<td><input type='hidden' name='po_id' value='${signedOrderList.po_id}'></td>
			<td><input type='hidden' name='sig_date' value='${signedOrderList.sig_date}'></td>
			<td><input type='hidden' name='sig_sta' value='${signedOrderList.sig_sta}'></td>
			<td><input type='hidden' name='sig_sug' value='${signedOrderList.sig_sug}'></td>
			<td><input type='hidden' name='sig_rank' value='${signedOrderList.sig_rank}'></td>		
<!-- 			<td><input type="submit" value="下單" id="submit" class='btn btn-default'></td> -->
<%-- 			<form action="<c:url value="/Po/signedOrderDetail.controller?po_id=${signedOrderList.po_id}" />"method="post"> --%>
			
			<td><button id='submit' class='btn btn-default btn-sm' value=''>下單</button></td>
<!-- 			</form> -->
			
			</tr> 
			</form>
		</c:forEach>		
		
		</tbody>
<%-- 		<c:forEach var='signedOrderList' items='${signedOrderList}'> --%>
<%-- 			<form action="<c:url value="/Po/signedOrderDetail.controller" />" --%>
<!-- 				method="post"> -->
<%-- 			<p>採購單號:${signedOrderList.po_id}</p> --%>
<%-- 			<p>簽核主管:${signedOrderList.po_id}</p> --%>
<%-- 			<c:forEach var='signedOrderListM_Info' --%>
<%-- 				items='${signedOrderListM_Info}'> --%>
<%-- 				<c:if test='${signedOrderList.po_id == signedOrderListM_Info.po_id}'> --%>
<%-- 					<p>主管簽核時間: ${signedOrderListM_Info.sig_date}</p> --%>
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 			<input type='hidden' name='po_manger' value='${signedOrderList.po_manger}'> --%>
<%-- 			<input type='hidden' name='po_sta' value='${signedOrderList.po_sta}'> --%>
<%-- 			<input type='hidden' name='po_id' value='${signedOrderList.po_id}'> --%>
<%-- 			<input type='hidden' name='sig_date' value='${signedOrderList.sig_date}'> --%>
<%-- 			<input type='hidden' name='sig_sta' value='${signedOrderList.sig_sta}'> --%>
<%-- 			<input type='hidden' name='sig_sug' value='${signedOrderList.sig_sug}'> --%>
<%-- 			<input type='hidden' name='sig_rank' value='${signedOrderList.sig_rank}'>			 --%>
<!-- 			<input type="submit" value="下單"> -->
<!-- 			</form> -->
<%-- 		</c:forEach> --%>

	</table>

	
	</c:if>
	</div>
	<script src="../js/app.js"></script>
</body>
</html>