<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includeA.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>狀態查詢</title>

<style>
.right {
	width: 78%;
	float: left;
}
</style>

</head>
<body>
	<a href="queryStatus.controller" class="badge badge-info">查詢所有請款單</a>
	<a href="queryStatusUndone.controller" class="badge badge-info">查詢未完成請款單</a>
	<a href="queryStatusDone.controller" class="badge badge-info">查詢已完成請款單</a>
	<c:if test='${not empty listsAll}'>
		<div class="right">
			<h3>查詢請款單狀態>所有請款單</h3>


			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">請款單單號</th>
						<th scope="col">廠商名稱</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sta" items="${listsAll}">
						<tr>
							<td><a href="queryStatusIn.controller?invid=${sta.inv_id}">${sta.inv_id}</a></td>
							<td>${sta.account_InvoiceBean.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test='${not empty nolistAll}'>
	<div class="right">
		<h3>查詢請款單狀態>所有請款單</h3>

		${nolistAll}
		</div>

	</c:if>
	
	<c:if test='${not empty lists}'>
		<div class="right">
			<h3>查詢請款單狀態>已完成請款單</h3>

	
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">請款單單號</th>
						<th scope="col">廠商名稱</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sta" items="${lists}">
						<tr>
							<td><a href="queryStatusIn.controller?invid=${sta.inv_id}">${sta.inv_id}</a></td>
							<td>${sta.account_InvoiceBean.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test='${not empty nolist}'>
	<div class="right">
		<h3>查詢請款單狀態>已完成請款單</h3>

	<a href="queryStatus.controller" class="badge badge-info">查詢所有請款單</a>
	<a href="queryStatusUndone.controller" class="badge badge-info">查詢未完成請款單</a>
	<a href="queryStatusDone.controller" class="badge badge-info">查詢已完成請款單</a><br><br>
		${nolist}</div>
	</c:if>

	<c:if test='${not empty listsUn}'>
	<div class="right">
		<h3>查詢請款單狀態>未完成請款單</h3>

	

			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">請款單單號</th>
						<th scope="col">廠商名稱</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sta" items="${listsUn}">
						<tr>
							<td><a href="queryStatusIn.controller?invid=${sta.inv_id}">${sta.inv_id}</a></td>
							<td>${sta.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<c:if test='${not empty nolistUn}'>
		<div class="right">
			<h3>查詢請款單狀態>未完成請款單</h3>

		
	${nolistUn}
		</div>
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