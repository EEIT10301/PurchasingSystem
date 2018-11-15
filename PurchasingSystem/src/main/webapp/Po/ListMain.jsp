<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>採購分派作業</title>
</head>
<body class="bg">
	<c:if test="${not empty appmain}">
		<div class="right">
			<h2>
				待分派採購單
				<h2>
					<h2>採購單號:${pomain.po_id}</h2>
					<form action="<c:url value="/Po/sendlist.controller" />"method="post">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>項目</th>
									<th>料號</th>
									<th>物料名稱</th>
									<th>市價</th>
									<th>請購總數量</th>
									<th>請購項目預估總金額</th>
									<th>目前庫存</th>
								</tr>
							</thead>
							<tbody id="myTable">
								<c:forEach var="pomaindetail" items="${pomain.pO_DetailBean}">

									<tr>
										<td>${pomaindetail.productListBean.pro_cate}</td>
										<td>${pomaindetail.part_No}</td>
										<td>${pomaindetail.productListBean.pro_name}</td>
										<td>${pomaindetail.market_Price}</td>
										<td>${pomaindetail.total_Qty}</td>
										<td>${pomaindetail.total_Qty*pomaindetail.market_Price}</d>
										<td>${pomaindetail.productListBean.pro_amount}</d>
									</tr>
									<!-- 			</form> -->
								</c:forEach>
							</tbody>
						</table>

						<h4 style="color: red;">請購預估總金額: ${appmain.app_price}</h4>
						<hr>
						<h2>請購單簽核情形</h2>
						<h2>請購單編號 :${appmain.app_id}</h2>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>簽核順序</th>
									<th>簽核人</th>
									<th>單據狀態</th>
									<th>簽核日期</th>
									<th>簽核狀態</th>
									<th>簽核建議</th>									
								</tr>
							</thead>
							<c:forEach var="appsigningprocess"
								items="${appmain.app_SigningProcessBean}">
								<c:if test="${appsigningprocess.sig_rank==1}">
									<tbody id="myTable">
										<tr>
											<td>1</td>
											<td>${appsigningprocess.employeeBean.emp_dep}
												${appsigningprocess.employeeBean.emp_name}
												${appsigningprocess.employeeBean.emp_job}</td>
											<td>${appsigningprocess.app_sta}</td>
											<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
													value="${appsigningprocess.sig_date}" /></td>
											<td>${appsigningprocess.sig_sta}</td>
											<td>${appsigningprocess.sig_sug}</td>											
										</tr>
								</c:if>
							</c:forEach>

							<c:forEach var="appsigningprocess"
								items="${appmain.app_SigningProcessBean}">
								<c:if test="${appsigningprocess.sig_rank==2}">
									<tr>
										<td>2</td>
										<td>${appsigningprocess.employeeBean.emp_dep}
											${appsigningprocess.employeeBean.emp_name}
											${appsigningprocess.employeeBean.emp_job}</td>
										<td>${appsigningprocess.app_sta}</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
												value="${appsigningprocess.sig_date}" /></td>
										<td>${appsigningprocess.sig_sta}</td>
										<td>${appsigningprocess.sig_sug}</td>
									</tr>
								</c:if>
							</c:forEach>

							<c:forEach var="appsigningprocess"
								items="${appmain.app_SigningProcessBean}">
								<c:if test="${appsigningprocess.sig_rank==3}">
									<tr>
										<td>3</td>
										<td>${appsigningprocess.employeeBean.emp_name}
											${appsigningprocess.employeeBean.emp_job}</td>
										<td>${appsigningprocess.app_sta}</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
												value="${appsigningprocess.sig_date}" /></td>
										<td>${appsigningprocess.sig_sta}</td>
										<td>${appsigningprocess.sig_sug}</td>
									</tr>
								</c:if>
							</c:forEach>
							</tbody>
						</table>
						<h4 style="color: red;">請購單位需求交期:${appmain.app_GetDate}</h4>
						<p>
							指派專員 <select name="employeesend">
								<c:forEach var="empbeansss" items="${empbeans}">
									<option value='${empbeansss.emp_id}'>${empbeansss.emp_dep}
										${empbeansss.emp_name} ${empbeansss.emp_job}</option>
								</c:forEach>
							</select>
						</p>
						<br> 分派意見:
						<p>
							<textarea rows="5" cols="50" name="SignSug"></textarea>
						</p>
						<Input type='hidden' name='po_manger'
							value='${SigningProcess.po_manger}'> <Input type='hidden'
							name='po_sta' value='${SigningProcess.po_sta}'> <Input
							type='hidden' name='po_id' value='${SigningProcess.po_id}'>
						<Input type='hidden' name='sig_date'
							value='${SigningProcess.sig_date}'> <Input type='hidden'
							name='sig_sta' value='${seSigningProcessndl1.sig_sta}'> <Input
							type='hidden' name='sig_sug' value='${SigningProcess.sig_sug}'>
						<Input type='hidden' name='sig_rank'
							value='${SigningProcess.sig_rank}'> <Input type='submit'
							name='send' class='btn btn-default' value='送出'>
					</form>
		</div>
	</c:if>
	<c:if test="${not empty nosendlist}">
		<h2>${ nosendlist}</h2>
	</c:if>
	<%-- 	<c:if test="${not empty pomain}"> --%>
	<%-- 		<h2>${appmain.app_id}</h2> --%>
	<!-- 		<form action="" method="post"> -->
	<%-- 			<c:forEach var="appmaindetail" items="${appmain.appDetailBean}"> --%>
	<%-- 			<p>料號:${appmaindetail.part_no}</p> --%>
	<%-- 			<p>市價:${appmaindetail.pro_price}</p> --%>
	<%-- 			<p>總數量:${appmaindetail.app_amount}</p> --%>
	<%-- 			</c:forEach> --%>
	<!-- 		</form>		 -->
	<%-- 	</c:if> --%>
	<script src="../js/app.js"></script>
</body>
</html>