<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>倉庫庫存</title>
<style>
table, td {
	border: 3pX solid skyblue;
}

#pageno {
	border: none;
}
</style>
</head>
<body>
<c:if test="${Mainbean==null}">
${Mainbean.noFile}
</c:if>

	<c:if test="${Mainbean !=null}">
		<table align="center">
			<tr>
				<td>料號</td>
				<td>項目</td>
				<td>產品</td>
				<td>規格</td>
				<td>資訊</td>
				<td>庫存數</td>
			</tr>
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
		</table>
		<table id="pageno" align="center">
			<tr>
				<td id="pageno"><a href="item?pageNo=1">1</a></td>
				<td id="pageno"><a href="item?pageNo=2">2</a></td>
				<td id="pageno"><a href="item?pageNo=3">3</a></td>
				<td id="pageno"><a href="item?pageNo=4">4</a></td>
			</tr>
		</table>
	</c:if>
</body>
</html>