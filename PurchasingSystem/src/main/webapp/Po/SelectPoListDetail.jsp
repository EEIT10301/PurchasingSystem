<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<title>詢價紀錄</title>
<script type="text/javascript">
	window.onload = function() {
	    if(!window.location.hash) {
	        window.location = window.location + '#loaded';
	        window.location.reload();
	    }
	}


// $(document).ready(function(){
// 	$.ajax({
// 		url:"sendthisselectlist.controller",
// 		type:"GET",
// 		async:false,
// 		success:
// 			$("#sendsubmit").click(
// 					function submit(data){						
// 						var Polist = JSON.parse(data);
// 						if (data.myArrayList==null){
// 							alert("請新增詢價紀錄");
// 							 window.location.href="http://localhost:8080/PurchasingSystem/Po/Posendlistsign.jsp";     
// 						}							
// 					})			
// 	});
// });
</script>
</head>
<%@ include file="../POIncludeforAcc.jsp"%>
<body class="bg">
	<div class="right">
	
	
	
		<c:if test="${empty queryss and empty query1  and empty queryVendor}">
			<h2>${noselist}</h2>
		</c:if>
	
<%-- 		<c:if test="${not empty appMainQuery and not empty appDetailQuery}"> --%>
		
		
<!-- <div class="card"> -->
<!-- <div data-toggle="collapse" data-target="#demo3" -->
<!-- 	 class="accordion-toggle"> -->
<%-- 	<h5 class="text-center font-weight-bold">請購單編號:${appMainQuery.app_id} ↓</h5>		 --%>
<!-- </div> -->
<!-- <div class="accordian-body collapse" id="demo3"> -->
		
		
<!-- 		<table class="table table-striped table-hover" id="myTable"> -->
<!-- 		<tr> -->
<!-- 			<th id="thead">請購單資訊</th> -->
<!-- 			<th id="thead"></th> -->
<!-- 			<th id="thead"></th> -->
<!-- 			<th id="thead"></th> -->
<!-- 			<th id="thead"></th> -->
<!-- 			<th id="thead"></th> -->
<!-- 			<th id="thead"></th> -->
<!-- 		</tr> -->
		
<!-- 		<tr> -->
<!-- 			<th width="250px">請購單編號</th> -->
<!-- 			<th width="250px">請購人員</th> -->
<!-- 			<th width="250px">請購總價</th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 		</tr> -->

<!-- 		<tr> -->
<%-- 			<td>${appMainQuery.app_id}</td> --%>
<%-- 			<td>${appMainQuery.employeeBean.emp_name}</td> --%>
<%-- 			<td>${appMainQuery.app_price}元</td> --%>
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 			<td></td> -->
<!-- 		</tr> -->
		
		
		
<!-- 		<tr> -->
<!-- 			<th id="thead">請購清單</th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 			<th></th> -->
<!-- 		</tr> -->
		
<!-- 		<tr> -->
<!-- 			<th width="200px">料號</th> -->
<!-- 			<th width="200px">材料項目</th> -->
<!-- 			<th>材料名稱</th> -->
<!-- 			<th>材料規格</th> -->
<!-- 			<th>數量</th> -->
<!-- 			<th>預估單價</th> -->
<!-- 			<th></th> -->
<!-- 		</tr> -->
		

<%-- 		<c:forEach var="appDetailQuery" items="${appDetailQuery}" varStatus="status"> --%>
<!-- 			<tr> -->
<%-- 				<td width="200px">${appDetailQuery.part_no}</td> --%>
<%-- 				<td width="200px">${appDetailQuery.productListBean.pro_cate}</td> --%>
<%-- 				<td width="300px">${appDetailQuery.productListBean.pro_name}</td> --%>
<%-- 				<td>${appDetailQuery.productListBean.pro_spe}</td> --%>
<%-- 				<td>${appDetailQuery.app_amount}</td> --%>
<%-- 				<td>${appDetailQuery.pro_price}</td> --%>
 <!-- 				<td></td> --> 
<!-- 			</tr> -->

<%-- 		</c:forEach> --%>
		
		
<!-- 		</table></div></div><br><br><br> -->
		
<%-- 		</c:if> --%>
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<c:if test="${not empty query1 }"> 
			<!-- or not queryVendor or not empty now -->
			<table class="table table-striped table-hover" id="myTable">
			
					<tr>
						<th id="thead">最新詢價紀錄</th>
						<th id="thead"></th>
						<th id="thead"></th>
						<th id="thead"></th>
					</tr>
					<tr>
						<th width="250px">採購單編號</th>
						<th width="250px">廠商名稱</th>
						<th width="250px">詢價時間</th>
						<th>詢價總價</th>
					</tr>
			
			
					<tr>
						<td id="query">${query1.po_ID}</td>
						<c:if test="${not empty queryVendor}">
						<td>${queryVendor.vendor_name}</td>
						</c:if>
						<c:if test="${empty queryVendor}">
						<td>${query1.pO_Vendor_InfoBean.vendor_name}</td>
						</c:if>
						<c:if test="${not empty now}">
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${now}"/></td>
						</c:if>
						<td>${query1.po_totalprice}</td>
					</tr>
	
			</table><br><br><br>
		</c:if>
		<c:if test="${not empty queryss}">
			<table class="table table-striped table-hover" id="myTable">
			
					<tr>
						<th id="thead">詢價紀錄</th>
						<th id="thead"></th>
						<th id="thead"></th>
						<th id="thead"></th>
					</tr>
					<tr>
						<th width="250px">採購單編號</th>
						<th width="250px">廠商名稱</th>
						<th width="250px">詢價時間</th>
						<th>詢價總價</th>
					</tr>
			
			
					<c:forEach var="querysss" items="${queryss}">
						<tr>
							<td>${querysss.po_ID}</td>
							<td>${querysss.pO_Vendor_InfoBean.vendor_name}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${querysss.po_querydate}"/></td>
							<td>${querysss.po_totalprice}</td>
						</tr>
					</c:forEach>
			
			</table><br><br><br>
		</c:if>
		<c:if test="${empty queryss and empty query1}">
			<table class="table table-striped table-hover" id="myTable">
				<thead>
					<tr>
						<th id="thead">詢價紀錄</th>
					</tr>
					<tr>
						<th><p id="nolist">尚未有詢價紀錄</p></th>
					</tr>
				</thead>
			</table>
		</c:if>
		<c:if test="${not empty poprocess1}">
			<div id="doublesubmitbutton">
				<form id="submitbutton"
					action="<c:url value="sendsc.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />"
					method="post">
						<input type="submit" name="sendFirstsendsc" class='btn btn-white btn-sm' value="新增詢價紀錄">
<!-- 					<button id='' class='btn btn-default' value=''>新增詢價紀錄</button> -->
				</form>
				<form id="submitbutton"
					action="<c:url value="posendlistsign.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />"
					method="post">

					<input type="submit" name="sendFirstposendlistsign" class='btn btn-white btn-sm' value="產生詢價單">
<!-- 					<button id='' class='btn btn-default' value=''>送出審核</button> -->

				</form>
				
			</div>
		</c:if>
		<c:if test="${not empty poprocess2}">
			<div id="doublesubmitbutton">
				<form id="submitbutton"
					action="<c:url value="sendsc.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />"
					method="post">
					<input type="submit" name="sendSecondsendsc" class='btn btn-white btn-sm' value="新增詢價紀錄">
<!-- 				<button id='' class='btn btn-default' value=''>新增詢價紀錄</button> -->
				</form>

				<form id="submitbutton"
					action="<c:url value="posendlistsign.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />"
					method="post">
					<input type="submit" name="sendSecondposendlistsign" class='btn btn-white btn-sm' value="產生詢價單">
<!-- 				<button id='' class='btn btn-default' value=''>送出審核</button> -->
				</form>
			</div>
		</c:if>
	</div>

	<script src="../js/app.js"></script>
</body>
</html>