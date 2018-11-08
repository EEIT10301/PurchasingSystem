<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待下單採購單</title>
</head>
<body>

	<%-- <c:if test="${not empty selectlists}"> --%>
	<%-- <c:forEach var="signedorder" items="${selectlists}"> --%>
	<%-- <c:if test="${signedorder.sig_rank==4}"> --%>
	<%-- <p>採購單編號: ${signedorder.po_id}</p> --%>
	<%-- <p>簽核主管: ${signedorder.employeeBean.emp_name}</p> --%>
	<%-- <p>簽核時間: ${signedorder.sig_date}</p> --%>
	<!-- <input type="button" value="下單"> -->
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>
	<%-- </c:if> --%>


	<c:if test='${not empty noSignedOrderList}'>
		<h2>${noApplylist}</h2>
	</c:if>

	<c:if test='${not empty signedOrderList}'>
		<h3>待下單表單</h3>
		<c:forEach var='signedOrderList' items='${signedOrderList}'>
			<form action="<c:url value="/Po/signedOrderDetail.controller" />"
				method="post">
			<p>採購單號:${signedOrderList.po_id}</p>
			<p>簽核主管:${signedOrderList.po_id}</p>
			<c:forEach var='signedOrderListM_Info'
				items='${signedOrderListM_Info}'>
				<c:if test='${signedOrderList.po_id == signedOrderListM_Info.po_id}'>
					<p>主管簽核時間: ${signedOrderListM_Info.sig_date}</p>
				</c:if>
			</c:forEach>
			<input type='hidden' name='po_manger' value='${signedOrderList.po_manger}'>
			<input type='hidden' name='po_sta' value='${signedOrderList.po_sta}'>
			<input type='hidden' name='po_id' value='${signedOrderList.po_id}'>
			<input type='hidden' name='sig_date' value='${signedOrderList.sig_date}'>
			<input type='hidden' name='sig_sta' value='${signedOrderList.sig_sta}'>
			<input type='hidden' name='sig_sug' value='${signedOrderList.sig_sug}'>
			<input type='hidden' name='sig_rank' value='${signedOrderList.sig_rank}'>			
			<input type="submit" value="下單">
			</form>
		</c:forEach>
	</c:if>

</body>
</html>