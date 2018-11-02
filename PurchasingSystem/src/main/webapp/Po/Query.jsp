<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增詢價單</title>
</head>
<body>
	<form action="<c:url value="/Po/queryinsert.controller" />"
		method="post">
		<c:if test="${not empty query}">
			<table border="1">
				<tr>
					<th>採購單ID</th>
					<th>廠商</th>
					<th>總價</th>
				</tr>
				<tr>
					<td><input type="hidden" name="po_ID" value="${query.po_id}">${query.po_id}</td>
<%-- 					${query.po_id} --%>
					<td><select name="vendor_ID">
							<c:forEach var="queryVendor" items="${AllPO_Vendor1}">
								<option value="${queryVendor.vendor_id}">${queryVendor.vendor_name}</option>
							</c:forEach>
					</select></td>
					<td><input type="text" name="po_totalprice"></td>
				</tr>
			</table>
			<input type="submit" name="send" value="新增">
		</c:if>
	</form>
</body>
</html>