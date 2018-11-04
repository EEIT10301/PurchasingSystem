<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待下單採購單</title>
</head>
<body>
<c:if test="${not empty selectlists}">
<form action="<c:url value="/Po/signOrderDetail.controller"/>" method="post">

<c:forEach var="signedorder" items="${selectlists}">

<c:if test="${signedorder.sig_rank==4}">

<p>採購單編號: ${signedorder.po_id}</p>
<p>簽核主管: ${signedorder.employeeBean.emp_name}</p>
<p>簽核時間: ${signedorder.sig_date}</p>
<Input type='hidden' name='po_manger' value='${signedorder.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${signedorder.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${signedorder.po_id}'><P/>
<%--   <Input type='hidden' name='sig_date' value='${signedorder.sig_date}'><P/> --%>
  <Input type='hidden' name='sig_sta' value='${signedorder.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${signedorder.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${signedorder.sig_rank}'><P/>
  <Input type='submit' name='send' value='簽核'>

</c:if>

</c:forEach>
</form>
</c:if>


</body>
</html>