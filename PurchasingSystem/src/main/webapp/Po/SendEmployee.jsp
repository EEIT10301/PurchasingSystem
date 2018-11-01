<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<c:if test="${not empty sendlist}">
			<c:forEach var="sendl" items="${sendlist}">
				<c:if test="${sendl.sig_rank==1}">
					<p>採購單單號: ${sendl.po_id}
					<p>產生時間: ${sendl.sig_date}
					<p>
					<form action="<c:url value="/Po/sendEmployeesss.controller" />" method="post">
					<c:forEach var="sendl1" items="${sendlist}">
						<c:if test="${sendl1.po_id == sendl.po_id and sendl1.sig_rank ==2}">
					<p>
					
	             	<Input type='hidden' name='po_manger' value='${sendl1.po_manger}'>
					<P />
					<Input type='hidden' name='po_sta' value='${sendl1.po_sta}'>
					<P />
					<Input type='hidden' name='po_id' value='${sendl1.po_id}'>
					<P />
					<Input type='hidden' name='sig_date' value='${sendl1.sig_date}'>
					<P />
					<Input type='hidden' name='sig_sta' value='${sendl1.sig_sta}'>
					<P />
					<Input type='hidden' name='sig_sug' value='${sendl1.sig_sug}'>
					<P />
					<Input type='hidden' name='sig_rank' value='${sendl1.sig_rank}'>
					<P />
						<Input type='submit' name='send' value='分派'>
				</c:if>
				</c:forEach>
						</form>
				</c:if>
				
			</c:forEach>
	</c:if>
		
	<c:if test="${not empty nosendlist}">
		<h2>${nosendlist}</h2>
	</c:if>
</body>
</html>