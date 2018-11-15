<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>倉庫庫存</title>

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

ul li {
　 width: 200px;
    float:left;
    list-style-type:none;
}
</style>
</head>
<body class="bg">
	<div class="right">
		<input class="form-control" id="myInput" type="text"
			placeholder="Search"><br />
		<!-- <a href="http://localhost:8080/PurchasingSystem/Inv/InvLoginSuccess.jsp">返回首頁</a> -->
		<c:if test="${Mainbean==null}">
${Mainbean.noFile}
</c:if>
		<!-- align="center" -->
		<c:if test="${Mainbean !=null}">
			<table id="myTable" class="table table-striped table-hover">
				<thead>
					<tr>
						<td>料號</td>
						<td>項目</td>
						<td>產品</td>
						<td>規格</td>
						<td>資訊</td>
						<td>庫存數</td>
					</tr>
				<thead>
					<c:forEach var='Mainbean' items='${Mainbean}'>
						<tr>
							<td><a href="DetailView?MainbeanPK=${Mainbean.inv_Part_no}">${Mainbean.inv_Part_no}</a></td>
							<td>${Mainbean.inv_Cate}</td>
							<td>${Mainbean.productListBean.pro_name}</td>
							<td>${Mainbean.productListBean.pro_spe}</td>
							<td>${Mainbean.productListBean.pro_intro}</td>
							<td>${Mainbean.inv_Amount}</td>
						</tr>
					</c:forEach>
				<tbody id="selectAll">
				</tbody>
			</table>


			<div id="B">
				<b>頁數</b>
				<ul>
					<li><a href="item?pageNo=1">1</a></li>
					<li><a href="item?pageNo=2">2</a></li>
					<li><a href="item?pageNo=3">3</a></li>
					<li><a href="item?pageNo=4">4</a></li>
				</ul>
			</div>

		</c:if>

		<script src="../js/app.js"></script>
	</div>
</body>
</html>