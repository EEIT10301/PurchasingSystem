<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待詢價表單頁面</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" -->
<!-- 	crossorigin="anonymous"> -->
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
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}
</style>
</head>
<body class="bg">

	<c:if test="${not empty selectlists}">
	<div class="right">


		<table class="table table-striped table-hover" id="table">


			<thead>
				<tr>
					<th><input class="form-control" id="myInput" type="text"
						placeholder="Search"><br /></th>
				</tr>
				<tr>
					<th width="200px">採購單編號</th>
					<th width="200px">分派主管</th>
					<th width="200px">主管分派時間</th>
					<th id="tosubmit"></th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="poprocess" items="${selectlists}">
					<c:if test="${poprocess.sig_rank==2}">
						<tr>
							<td>${poprocess.po_id}</td>
							<td>${poprocess.employeeBean.emp_name}</td>
							<td>${poprocess.sig_date}</td>


							<c:forEach var="poprocess1" items="${selectlists}">
								<form
									action="<c:url value="sendthisselectlist.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />"
									method="post">
									<c:if
										test="${poprocess1.sig_rank==3 and poprocess1.po_id == poprocess.po_id}">

										<td><input id="submit" type="submit" name="send"
											value="開始詢價"></td>

									</c:if>
								</form>
							</c:forEach>
						</tr>

					</c:if>
				</c:forEach>
			</tbody>


		</table>

	</div>
	</c:if>

	<c:if test="${empty noselectlists}">
		<h2>${noselectlists}</h2>
	</c:if>
	<script src="../js/app.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" -->
<!-- 		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" -->
<!-- 		crossorigin="anonymous"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" -->
<!-- 		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" -->
<!-- 		crossorigin="anonymous"></script> -->
<!-- 	<script -->
<!-- 		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" -->
<!-- 		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" -->
<!-- 		crossorigin="anonymous"></script> -->

</body>
</html>