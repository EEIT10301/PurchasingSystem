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
<title>Insert title here</title>
<style>
	body{
		background-repeat:no-repeat;
		background-size:100%;
		margin:0;
		padding:0;
		font-family:'微軟正黑體';
		background-attachment:fixed;
	}
	#back{
		z-index:-1;
		width:100%;
		height:100%;
		position:fixed;
		background-color:rgba(255,255,255,0.5);
	}
	.topTen{
		height:70%;
		width:180px;
		border:1px solid black;
		position:fixed;
		top:210px;
		left:0;
		z-index:99;
		overflow-y:scroll;
		padding-left:20px;
	}
	.prolist{
		display: flex;
		width:70%;
		margin:0 auto;
		flex-wrap:wrap;
	}
	.prolist{
		display: flex;
		margin:0 auto;
		flex-wrap:wrap;
	}
	.pro{
		flex: 0 0 33.3;
		margin:10px;
	}
	.pro img{
		width:300px;
		height:300px;
	}
	.pro1{
		flex: 0 0 33.3;
		margin:10px;
	}
	.pro1 img{
		width:100px;
		height:100px;
	}
	.pro p{
		text-align:center;
	}
	.pro input{
		width:120px;
		background-color: white;
		font-size: 1.05em;
	}
	#history{
		padding-left:250px;
	}	
</style>
</head>
<body>
 <h2>請購單號 :${appid}</h2>
 <div class="prolist">
<c:forEach var='queryapp' varStatus='vs' items='${queryprocess}'>

<div class='pro'>
<c:if test="${queryapp.sig_sta == '簽核中'  or queryapp.sig_sta == '退回中' }">
<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
<P><font color="red">流程進度${queryapp.app_sta}</font><P>
<P><font color="red">簽核人${queryapp.employeeBean.emp_name}</font><P>
<P><font color="red">簽核時間${queryapp.sig_date}</font><P> 
<P><font color="red">簽核情形${queryapp.sig_sta}</font><P>
<P><font color="red">簽核建議${queryapp.sig_sug}</font><P> 
 <Input type='hidden' name=app_manger value='${queryapp.app_manger}'><P/>
  <Input type='hidden' name='app_sta' value='${queryapp.app_sta}'><P/>
  <Input type='hidden' name='app_id' value='${queryapp.app_id}'><P/>
  <Input type='hidden' name='sig_date' value='${queryapp.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${queryapp.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${queryapp.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${queryapp.sig_rank}'><P/>
  </form>
 
</c:if>

<c:if test="${queryapp.sig_sta != '簽核中'  and queryapp.sig_sta != '退回中' }">

<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
<P><font color="black">流程進度${queryapp.app_sta}</font><P>
<P><font color="black">簽核人${queryapp.employeeBean.emp_name}</font><P>
<P><font color="black">簽核時間${queryapp.sig_date}</font><P> 
<P><font color="black">簽核情形${queryapp.sig_sta}</font><P>
 <P><font color="black">簽核建議${queryapp.sig_sug}</font><P> 
 <Input type='hidden' name=app_manger value='${queryapp.app_manger}'><P/>
  <Input type='hidden' name='app_sta' value='${queryapp.app_sta}'><P/>
  <Input type='hidden' name='app_id' value='${queryapp.app_id}'><P/>
  <Input type='hidden' name='sig_date' value='${queryapp.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${queryapp.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${queryapp.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${queryapp.sig_rank}'><P/>
  </form>
</c:if>
  </div>
</c:forEach>
</div>

<!-- 詢價中 簽核中 分派中 下單中 出貨中 -->

<c:if test="${not empty queryprocesspo}">
<h2>採購單單號:  ${poid}</h2>
 <div class="prolist">
<c:forEach var='queryapppo' varStatus='vs' items='${queryprocesspo}'>
<c:if test="${queryapppo.sig_sta == '簽核中'  or queryapppo.sig_sta == '退回中' or queryapppo.sig_sta == '詢價中' or queryapppo.sig_sta == '分派中' or queryapppo.sig_sta == '下單中' or queryapppo.sig_sta == '出貨中'}">
<div class='pro'>

<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
<P><font color="red">流程進度${queryapppo.po_sta}</font><P>
<P><font color="red">簽核人${queryapppo.employeeBean.emp_name}</font><P>
<P><font color="red">簽核時間${queryapppo.sig_date}</font><P> 
<P><font color="red">簽核情形${queryapppo.sig_sta}</font><P>
<P><font color="red">簽核建議${queryapppo.sig_sug}</font><P> 
 <Input type='hidden' name=po_manger value='${queryapppo.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${queryapppo.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${queryapppo.po_id}'><P/>
  <Input type='hidden' name='sig_date' value='${queryapppo.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${queryapppo.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${queryapppo.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${queryapppo.sig_rank}'><P/>
  </form>
 
  </div>
  </c:if>
  <c:if test="${queryapppo.sig_sta != '簽核中'  and queryapppo.sig_sta != '退回中' and queryapppo.sig_sta != '詢價中' and queryapppo.sig_sta != '分派中' and queryapppo.sig_sta != '下單中' and queryapppo.sig_sta != '出貨中'}">
<div class='pro'>

<form action="<c:url value="/Apply/ApplySignpro.controller" />" method="post">
<P><font color="black">流程進度${queryapppo.po_sta}</font><P>
<P><font color="black">簽核人${queryapppo.employeeBean.emp_name}</font><P>
<P><font color="black">簽核時間${queryapppo.sig_date}</font><P> 
<P><font color="black">簽核情形${queryapppo.sig_sta}</font><P>
<P><font color="black">簽核建議${queryapppo.sig_sug}</font><P> 
 <Input type='hidden' name=po_manger value='${queryapppo.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${queryapppo.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${queryapppo.po_id}'><P/>
  <Input type='hidden' name='sig_date' value='${queryapppo.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${queryapppo.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${queryapppo.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${queryapppo.sig_rank}'><P/>
  </form>
 
  </div>
  </c:if>
</c:forEach>
</div>
</c:if>

</body>
</html>