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
	<c:if test="${not empty sendlist }">
	<c:forEach var="sendl" items="${sendlist}">
	<c:if test="${sendl.sig_renk==1}">
	<P>驗收單單號:${sendl.chk_id }
	<P>產生時間: ${sendl.sig_date}
	<c:forEach var="sendl1" items="${sendlist}">
						<c:if test="${sendl1.po_id == sendl.po_id and sendl1.sig_rank ==2}">
					<p>
					
	             	<Input type='hidden' name='inv_manger' value='${sendl1.po_manger}'>
					<P />
					<Input type='hidden' name='inv_sta' value='${sendl1.po_sta}'>
					<P />
					<Input type='hidden' name='chk_id' value='${sendl1.chk_id}'>
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
	<c:if test="${not empty nosendlist }">
	<h2>${nosendlist}</h2>
	</c:if>
</body>
</html>