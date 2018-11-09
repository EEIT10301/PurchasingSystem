<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢結案請款單細項</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${empty mainbean}">		
		<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
		<p>${nomainbean}</p>
		</c:if>
	<c:if test="${not empty mainbean}">		
	<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
	<table class="table table-striped table-hover">				
				<thead>
					<tr>
					<th><h5>採購單編號：${mainbean.po_id}</h5></th>	
					</tr>
				<tr>
				<th>零件名稱</th>
				<th>市場價格</th>
				<th>廠商標價</th>
				<th>產品數量</th>			
				<th>產品總價</th>
			
				</tr>
				</thead>
				<tbody id='myTable'>
				
		
				<c:forEach var="detailBean" items="${mainbean.pO_DetailBean}">
				<tr>
				<td>${detailBean.part_No}</td>
				<td>${detailBean.market_Price}</td>
				<td>${detailBean.quotation}</td>
				<td>${detailBean.total_Qty}</td>
				<td>${detailBean.total_Price}</td>
				</tr>
				</c:forEach>
				<tr><td align="right">總共：${mainbean.total_price}元</td></tr>
			</tbody>
			</table>			
		
						
			</c:if>
		
		<script src="../js/app.js"></script>



</body>
</html>