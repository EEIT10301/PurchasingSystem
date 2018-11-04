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
	<c:if test="${sendl.sig_Rank==1}">
	<P>驗收單單號:${sendl.chk_Id }
	<P>產生時間: ${sendl.sig_Date}
	<c:forEach var="sendl1" items="${sendlist}">
						<c:if test="${sendl1.chk_Id == sendl.chk_Id and sendl1.sig_Rank ==2}">
					<p>
					
	             	<Input type='hidden' name='inv_Manger' value='${sendl1.inv_Manger}'>
					<P />
					<Input type='hidden' name='inv_Sta' value='${sendl1.inv_Sta}'>
					<P />
					<Input type='hidden' name='chk_Id' value='${sendl1.chk_Id}'>
					<P />
					<Input type='hidden' name='sig_Date' value='${sendl1.sig_Date}'>
					<P />
					<Input type='hidden' name='sig_Sta' value='${sendl1.sig_Sta}'>
					<P />
					<Input type='hidden' name='sig_Sug' value='${sendl1.sig_Sug}'>
					<P />
					<Input type='hidden' name='sig_Rank' value='${sendl1.sig_Rank}'>
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