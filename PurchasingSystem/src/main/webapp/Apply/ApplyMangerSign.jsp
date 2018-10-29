<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="Apply.service.*"%>
<%@ page import="Apply.model.*"%>
<%@ page import="Apply.dao.*"%>
<%@ page import="org.springframework.web.context.*"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insere</title>
</head>
<body>
<c:if test='${not empty noApplylist}'>
<h2>${noApplylist}</h2>
</c:if>

<c:if test='${not empty Applylists}'>
<h3>待簽核表單</h3>
<c:forEach var='applylist' varStatus='vs' items='${Applylists}'>
<form action="<c:url value="/Apply/ApplySignnerdetail.controller" />" method="post">
 <p>請購單號 :${applylist.app_id}</p>
 <p>請購項目 :${applylist.app_MainBean.pro_cate}</p>
 <p>請購金額 :${applylist.app_MainBean.app_price}</p>
 <Input type='hidden' name=app_manger value='${applylist.app_manger}'><P/>
  <Input type='hidden' name='app_sta' value='${applylist.app_sta}'><P/>
  <Input type='hidden' name='app_id' value='${applylist.app_id}'><P/>
  <Input type='hidden' name='sig_date' value='${applylist.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${applylist.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${applylist.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${applylist.sig_rank}'><P/>
  <Input type='submit' name='send' value='簽核'>
  </form>
</c:forEach>

</c:if>

<c:if test='${not empty nosend}'>
<h3>退回表單</h3>
<c:forEach var='nosends' varStatus='vs' items='${nosend}'>
<form action="<c:url value="/Apply/ApplySignnerdetail.controller" />" method="post">
 <p>請購單號 :${nosends.app_id}</p>
 <p>請購項目 :${nosends.app_MainBean.pro_cate}</p>
 <p>請購金額 :${nosends.app_MainBean.app_price}</p>
 <Input type='hidden' name=app_manger value='${nosends.app_manger}'><P/>
  <Input type='hidden' name='app_sta' value='${nosends.app_sta}'><P/>
  <Input type='hidden' name='app_id' value='${nosends.app_id}'><P/>
  <Input type='hidden' name='sig_date' value='${nosends.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${nosends.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${nosends.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${nosends.sig_rank}'><P/>
  <Input type='submit' name='send' value='修改'>
  </form>
</c:forEach>

</c:if>


</body>
</html>