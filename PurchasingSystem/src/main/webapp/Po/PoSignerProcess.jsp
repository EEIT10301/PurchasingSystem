<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待審核採購單</title>
</head>
<body class="bg">
<%@ include file="../POIncludeforAcc.jsp"%>
<div class="right">
	<c:if test='${not empty nopolist}'>
		<h2>${nopolist}</h2>
	</c:if>
	<c:if test='${not empty PO_SignSend}'>
	
	<br>
		<h3>待簽核表單</h3>
			<table id="myTable" class="table table-striped table-hover">
				
					<tr>
						<th>採購單號</th>
						<th>廠商名稱</th>
						<th>採購金額</th>
						<th>主管簽核時間</th>
						<th></th>
					</tr>
				
					<c:forEach var='polists' varStatus='vs' items='${PO_SignSend}'>
						<tr>
							<td>${polists.po_id}</td>
							<td>${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
							<td>${polists.pO_MainBean.total_price}</td>
							<c:forEach var='polistone' varStatus='vs'
								items='${PO_SignSendRank}'>
								<c:if test='${polists.po_id == polistone.po_id}'>
									<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${polistone.sig_date}"/></td>
								</c:if>
							</c:forEach>
							<td>
								<form action="<c:url value="POManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=sendok" />" 
								method="post">
								<input type="submit" class="btn btn-white btn-sm" value="開始審核">
							</form>
							</td>
						</tr>
					</c:forEach>
				
			</table>
			
	</c:if>
</div>
	<c:if test='${not empty PO_SignBack}'>
		<div class="right">
		<br>
		<h3>退回表單</h3>
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<th>採購單號</th>
						<th>廠商名稱</th>
						<th>採購金額</th>
						<th>主管簽核時間</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var='polists' varStatus='vs' items='${PO_SignBack}'>
						<tr>
							<td>${polists.po_id}</td>
							<td>${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
							<td>${polists.pO_MainBean.total_price}</td>
							<c:forEach var='polistone' varStatus='vs'
								items='${PO_SignBackRank}'>
								<c:if test='${polists.po_id == polistone.po_id}'>
									<td>主管退回時間:<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${polistone.sig_date}"/></td>
									<br>
								</c:if>
							</c:forEach>
							<td><a
								href='<c:url value="POManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=nosend" />'>
									<button type="button" class="btn btn-white btn-sm">開始簽核</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>

	<!-- <p> -->
	<%-- <c:if test='${not empty thispage}'> --%>
	<%-- 第 ${thispage} 頁 --%>
	<%-- </c:if> --%>
	<%-- <c:if test='${empty thispage}'> --%>
	<!-- 第 1 頁 -->
	<%-- </c:if> --%>
	<!--   頁數:  -->
	<%-- <c:forEach var='i' begin='1' end='${pages}'> --%>
	<%-- <a href='POManagerSignerpages.controller?page=<c:out value="${i}"/>'><c:out value="${i}"/></a> --%>
	<%-- </c:forEach> --%>
	<!-- <p> -->
	<script src="../js/app.js"></script>
</body>
</html>