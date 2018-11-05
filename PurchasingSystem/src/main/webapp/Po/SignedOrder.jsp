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

<c:if test="${not empty selectlists}">
<c:forEach var="signedorder" items="${selectlists}">
<form action="<c:url value="/Po/signOrderDetail.show"/>" method="post">





<p>採購單編號: ${signedorder.po_id}</p>
<p>簽核主管: ${boss.emp_name}</p>
<p>簽核時間: ${signedorder.sig_date}</p>
<input type='hidden' name='po_manger' value='${signedorder.po_manger}'>
  <input type='hidden' name='po_sta' value='${signedorder.po_sta}'>
  <input type='text' name='po_id' value='${signedorder.po_id}'>
<%--   <Input type='hidden' name='sig_date' value='${signedorder.sig_date}'> --%>
  <input type='hidden' name='sig_sta' value='${signedorder.sig_sta}'>
  <input type='hidden' name='sig_sug' value='${signedorder.sig_sug}'>
  <input type='hidden' name='sig_rank' value='${signedorder.sig_rank}'>
  <input type='submit' name='send' value='簽核'>




</form>
</c:forEach>
</c:if>


</body>
</html>