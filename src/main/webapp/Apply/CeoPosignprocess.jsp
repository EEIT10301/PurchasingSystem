<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test='${not empty nopolist}'>
<h2>${nopolist}</h2>
</c:if>

<c:if test='${not empty PO_SignSend}'>
<h3>待簽核表單</h3>
<c:forEach var='polists' varStatus='vs' items='${PO_SignSend}'>
<p>採購單號 :${polists.po_id}</p>
<p>廠商名稱:${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</p>
<p>採購金額 :${polists.pO_MainBean.total_price}</p>
<a href='<c:url value="ceoPOManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=sendok" />'>
     開始簽核</a>  
 <c:forEach var='polistone' varStatus='vs' items='${PO_SignSendRank}'>
 <c:if test='${polists.po_id == polistone.po_id}'>
   <p>前一位簽核時間: ${polistone.sig_date}<P>
   <br>
 </c:if>
 </c:forEach>
</c:forEach>
</c:if>


<c:if test='${not empty PO_SignBack}'>
<h3>退回表單</h3>
<c:forEach var='polists' varStatus='vs' items='${PO_SignBack}'>
<p>採購單號 :${polists.po_id}</p>
<p>廠商名稱:${polists.pO_MainBean.pO_Vendor_InfoBean.vendor_name}</p>
<p>採購金額 :${polists.pO_MainBean.total_price}</p>
<a href='<c:url value="ceoPOManagerSignertosign.controller?po_manger=${polists.po_manger}&po_sta=${polists.po_sta}&po_id=${polists.po_id}&send=nosend" />'>
     開始簽核</a>
  <c:forEach var='polistone' varStatus='vs' items='${PO_SignBackRank}'>
 <c:if test='${polists.po_id == polistone.po_id}'>
   <p>前一位退回時間: ${polistone.sig_date}<P>
   <br>
 </c:if>
 </c:forEach>
</c:forEach>
</c:if>

</body>
</html>