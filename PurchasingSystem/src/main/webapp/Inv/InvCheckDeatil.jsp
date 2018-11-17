<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>產品入庫</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#submit {
	position: absolute;
	right: 700px;
}

.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
}

.right {
	width: 78%;
	float: left;
}

.search-form {
	text-align: right; input { border : none;
	padding: .5em;
	background: rgba(255, 255, 255, .5);
	color: #555;
}

button { @extend input;
	
}
}

</style>

</head>
<body class="bg">
	<div class="right">
		<input class="form-control" id="myInput" type="text"
			placeholder="Search"><br />
		<!-- <a href="http://localhost:8080/PurchasingSystem/Inv/InvLoginSuccess.jsp" text-align="left">返回首頁</a> -->
		<form action="<c:url value="/Inv/itemin" />" method="get">
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
					<td>產品料號</td>
					<td>驗收數量</td>
					<td>產品良率</td>
					<td>驗收狀況</td>
					</tr>
				</thead>
				<c:forEach var="CheckDetail" items="${CheckDetail}">
					<tr>
						<td>${CheckDetail.part_No}</td>
						<td>${CheckDetail.chk_Count}</td>
						<td>${CheckDetail.chk_quality}</td>
						<td>${CheckDetail.chk_status}</td>
					</tr>
				</c:forEach>
				<tbody id="selectAll">
				</tbody>
			</table>

		</form>
		<script src="../js/app.js"></script>
	</div>
</body>
</html>