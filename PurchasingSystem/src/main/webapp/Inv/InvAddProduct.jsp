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
<!-- <script> 
 	function reconfirmOrder() {		
 		if (confirm("確定要將驗收單內的產品加入到庫存資料表嗎 ? ")){		
 		}else{
 			return false;
 		} 
 	}
 	</script> -->
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
						<th>驗收單號</th>
						<th>採購單號</th>
						<th>驗收人員</th>
						<th>驗收金額</th>
						<th>入庫狀態</th>
						<th>驗收金額</th>
						<th>產品廠商</th>
					</tr>
				</thead>
				<c:forEach var="check" items="${check}">
					<tr>
						<td>${check.chk_Id}</td>
						<td>${check.po_ID}</td>
						<td>${check.emp_ID}</td>
						<td>${check.chk_Money}</td>
						<td>${check.chk_Comment}</td>
						<td>${check.total_price}</td>
						<td>${check.vender_ID}</td>
						<td><c:set var="in" value="尚未入庫" /> <c:if
								test="${check.chk_Comment==in}">
								<a href="itemin?CheckPK=${check.chk_Id}"
									onclick="return confirm('確定要將驗收單內的產品加入到庫存資料表嗎 ?');">入庫</a>
							</c:if> <c:set var="in" value="已加入庫存" /> <c:if
								test="${check.chk_Comment==in}">
								<input disabled="disabled" value="已入庫" type="submit"></input>
							</c:if></td>
					</tr>
				</c:forEach>
				<tbody id="selectAll">
				</tbody>
			</table>

		</form>
		<div align="center">
			<span> <b>${error.notFind}</b></span>
			<c:if test="${!empty Detail}">
				<table  class="table table-striped table-hover">
					<caption class="as">本次新增項目</caption>
									<thead>
					<tr>
					<th class="tr1">產品料號</th>
					<th class="tr1">產品數量</th>
					<th class="tr1">驗收日期</th>
					<th class="tr1">產品良率</th>
										</tr>
				</thead>
					<c:forEach var="Detail" items="${Detail}">
						<tr class="tr1">
							<td class="tr1">${Detail.part_No}</td>
							<td class="tr1">${Detail.chk_Count}</td>
							<td class="tr1">${Detail.chk_Date}</td>
							<td class="tr1">${Detail.chk_quality}</td>

						</tr>
					</c:forEach>
					<tbody id="selectAll">
				</tbody>
				</table>
			</c:if>
		</div>
		<script src="../js/app.js"></script>
	</div>
</body>
</html>