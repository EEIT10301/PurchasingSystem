<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>產品入庫</title>
<style>
table, td {
	border: 3pX solid skyblue;
}
</style>
<script>
	function reconfirmOrder() {		
		confirm("確定要將驗收單內的產品加入到庫存資料表嗎 ? ") ;
	}
	</script>
</head>
<body>
	<b><span>${error.notFind}</span></b>
	<form action="<c:url value="/Inv/itemin" />" method="get"> 
	<table>

		<tr>
			<th>驗收單號</th>
			<th>採購單號</th>
			<th>驗收人員</th>
			<th>驗收金額</th>
			<th>驗收狀態</th>
			<th>驗收金額</th>
			<th>產品廠商</th>
		</tr>	
		<c:forEach var="check" items="${check}">
			<tr>
				<td>${check.chk_Id}</td>
				<td>${check.po_ID}</td>
				<td>${check.emp_ID}</td>
				<td>${check.chk_Money}</td>
				<td>${check.chk_Comment}</td>
				<td>${check.total_price}</td>
				<td>${check.vender_ID}</td>
				<td>
				<c:set var="in" value="驗收狀況良好"/>
				<c:if test="${check.chk_Comment==in}" >		
				<a href="itemin?CheckPK=${check.chk_Id}" onclick="reconfirmOrder()">入庫</a>
				</c:if>
				<c:set var="in" value="已新增至庫存"/>
				<c:if test="${check.chk_Comment==in}">		
				<input  disabled="disabled" value="已入庫" type="submit"></input>
				</c:if>			
				</td>
			</tr>
		</c:forEach>
	</table>

</form>
<c:if test="${!empty Detail}">
<table>
<caption>本次新增項目</caption>
<th>產品料號</th><th>產品數量</th><th>驗收日期</th><th>產品良率</th>
<c:forEach var="Detail" items="${Detail}">
<tr>
<td>${Detail.part_No}</td>
<td>${Detail.chk_Count}</td>
<td>${Detail.chk_Date}</td>
<td>${Detail.chk_quality}</td>

</tr>
</c:forEach>
</table>
</c:if>

</body>
</html>