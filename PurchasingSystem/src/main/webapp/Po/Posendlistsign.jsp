<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
	<div class="right">
		<%-- 	<c:if test="${empty AllPO_Vendor or empty poprocess1}"> --%>
		<%-- 		${errors.errors} --%>
		<%-- 	</c:if> --%>


		<c:if test="${not empty AllPO_Vendor and not empty poprocess1}">
			<form
				action="<c:url value="/Po/checkvendorandpodetail.controller" />"
				method="post">


				<label for="AllPO_Vendors">選擇廠商:</label> <select
					name="AllPO_Vendors">
					<c:forEach var="AllPO_Vendorsr" items="${AllPO_Vendor}">
						<option value="${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_id}">
							廠商名稱: ${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_name} 總報價 :
							${AllPO_Vendorsr.po_totalprice} 元整</option>
					</c:forEach>
				</select>


				<h3>採購單號:${poprocess1.pO_MainBean.po_id}</h3>
				<%-- 				<span style="color:red; font-size:20px;">${errors.number}</span> --%>

				<Input type='hidden' name='posta1' value='${poprocess1.po_sta}'>
				<Input type='hidden' name='poid1' value='${poprocess1.po_id}'>

				<table id="myTable" class="table table-striped table-hover">
					<thead>
						<tr>
							<th width="200px">料號</th>
							<th width="200px">品名</th>
							<th width="200px">預估價格</th>
							<th width="200px">請購數量</th>
							<th width="200px">採購實際金額</th>
							<th width="400px">採購實際數量</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="thispo_detailBean"
							items="${poprocess1.pO_MainBean.pO_DetailBean}">
							<tr>
								<td>${thispo_detailBean.part_No}</td>
								<td>${thispo_detailBean.productListBean.pro_name}</td>
								<td>${thispo_detailBean.market_Price}</td>
								<td>${thispo_detailBean.total_Qty}</td>
								<td><Input type='text' name='total_Price'
									value='${param.total_Price}' required></td>
								<td><Input type='text' name='quotation'
									value='${param.quotation}' required> <font size="3" color="red">${errors.number}</font></td>
								<td><Input type='hidden' name='po_id'
									value='${thispo_detailBean.po_id}'></td>
								<td><Input type='hidden' name='part_No'
									value='${thispo_detailBean.part_No}'></td>
								<td><Input type='hidden' name='market_Price'
									value='${thispo_detailBean.market_Price}'></td>
								<td><Input type='hidden' name='total_Qty'
									value='${thispo_detailBean.total_Qty}'></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
					<Input type='submit' name='send' class='btn btn-white btn-sm' value='送出審核' id="submit">
<!-- 				<button id='submit' class='btn btn-default' value=''>送出審核</button> -->
			</form>
		</c:if>
	</div>

	<script src="../js/app.js"></script>
</body>
</html>