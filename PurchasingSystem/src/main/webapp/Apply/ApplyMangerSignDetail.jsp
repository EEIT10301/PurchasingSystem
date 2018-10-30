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
<c:if test="${empty user}">
	<%
		request.setAttribute("nouser", "登入過期請重新登入");
			request.getRequestDispatcher("/Apply/ApplyLogin.jsp").forward(request, response);
	%>
</c:if>
</head>
<body>
<h2>請購單編號:${singerlist.app_id}</h2>
<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_sta =='簽核中'}">
<p><font color="red">${sinlist.employeeBean.emp_name} 簽核中</font></p>
<p>職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>

<c:if test="${sinlist.sig_sta =='退回中'}">
<h3><font color="red">請購單狀態: ${sinlist.sig_sta}</font></h3>
<%-- <p><font color="red">申請人: ${sinlist.employeeBean.emp_name} 職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</font></p> --%>
<c:forEach var='sinlistss' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank +1 == sinlistss.sig_rank}">
<p><font color="red">退回人: ${sinlistss.employeeBean.emp_name} 職稱: ${sinlistss.employeeBean.emp_dep} ${sinlistss.employeeBean.emp_job}</font></p>
<p><font color="red">退回時間: ${sinlistss.sig_date} </font></p>
<p><font color="red">退回意見: ${sinlistss.sig_sug} </font></p>
</c:if>
</c:forEach>
<p>提案內容: ${sinlist.sig_sug}<p>
<p>點單時間: ${sinlist.sig_date}<p>
</c:if>
</c:forEach>


<p>申請人: ${singerlist.employeeBean.emp_name} 職稱:${singerlist.employeeBean.emp_dep} ${singerlist.employeeBean.emp_job}</p>
<p>申請項目: ${singerlist.pro_cate}</p>
<p>請購預估總價格: ${singerlist.app_price}</p>
<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank == 1 and sinlist.sig_sta == '已簽核' }">
<h3>提案內容:  ${sinlist.sig_sug}</h3>

</c:if>
</c:forEach>


<h2>請購產品明細</h2>
<c:forEach var='partlist' varStatus='vs' items='${singerlist.appDetailBean}'>
<p>料號: ${partlist.part_no}</p>
<p>料號: ${partlist.productListBean.pro_name}</p>
<p>產品平均單價: ${partlist.pro_price}</p>
<p>請購數量: ${partlist.app_amount}</p>
<p>該項總金額: ${partlist.app_amount*partlist.pro_price}元整</p>
</c:forEach>


<h2>簽核順序</h2>

<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank ==1}">
<h3>第1步:</h3>
<c:if test="${sinlist.sig_sta =='簽核中'}">

<p><font color="red">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>
<c:if test="${sinlist.sig_sta =='退回中'}">
<h3><font color="red">請購單狀態: ${sinlist.sig_sta}</font></h3>
<p><font color="red">申請人: ${sinlist.employeeBean.emp_name} 職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</font></p>
<c:forEach var='sinlistss' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank +1 == sinlistss.sig_rank}">
<p><font color="red">退回人: ${sinlistss.employeeBean.emp_name} 職稱: ${sinlistss.employeeBean.emp_dep} ${sinlistss.employeeBean.emp_job}</font></p>
<p><font color="red">退回時間: ${sinlistss.sig_date} </font></p>
<p><font color="red">退回意見: ${sinlistss.sig_sug} </font></p>
</c:if>

</c:forEach>
<p>提案內容: ${sinlist.sig_sug}<p>
<p>點單時間: ${sinlist.sig_date}<p>
</c:if>

<c:if test="${sinlist.sig_sta !='簽核中' and sinlist.sig_sta !='退回中'}">
<c:if test="${sinlist.sig_sta =='已簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>
<p>簽核時間: ${sinlist.sig_date}</p>
<p><font color="black">提案內容: ${sinlist.sig_sug}</font></p>
</c:if>

<c:if test="${sinlist.sig_sta =='未簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>

</c:if>

</c:if>
</c:forEach>

<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank ==2}">
<h3>第2步:</h3>
<c:if test="${sinlist.sig_sta =='簽核中'}">

<p><font color="red">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>
<c:if test="${sinlist.sig_sta =='退回中'}">
<h3><font color="red">請購單狀態: ${sinlist.sig_sta}</font></h3>
<p><font color="red">申請人: ${sinlist.employeeBean.emp_name} 職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</font></p>
<c:forEach var='sinlistss' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank +1 == sinlistss.sig_rank}">
<p><font color="red">退回人: ${sinlistss.employeeBean.emp_name} 職稱: ${sinlistss.employeeBean.emp_dep} ${sinlistss.employeeBean.emp_job}</font></p>
<p><font color="red">退回時間: ${sinlistss.sig_date} </font></p>
<p><font color="red">退回意見: ${sinlistss.sig_sug} </font></p>
</c:if>

</c:forEach>
<p>點單建議: ${sinlist.sig_sug}<p>
<p>點單時間: ${sinlist.sig_date}<p>
</c:if>

<c:if test="${sinlist.sig_sta !='簽核中' and sinlist.sig_sta !='退回中'}">
<c:if test="${sinlist.sig_sta =='已簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>
<p>簽核時間: ${sinlist.sig_date}</p>
<p><font color="black">簽核意見: ${sinlist.sig_sug}</font></p>
</c:if>

<c:if test="${sinlist.sig_sta =='未簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>

</c:if>

</c:if>
</c:forEach>

<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank ==3}">
<h3>第3步:</h3>
<c:if test="${sinlist.sig_sta =='簽核中'}">

<p><font color="red">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱: ${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>
<c:if test="${sinlist.sig_sta =='退回中'}">
<h3><font color="red">請購單狀態: ${sinlist.sig_sta}</font></h3>
<p><font color="red">申請人: ${sinlist.employeeBean.emp_name} 職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</font></p>
<c:forEach var='sinlistss' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
<c:if test="${sinlist.sig_rank +1 == sinlistss.sig_rank}">
<p><font color="red">退回人: ${sinlistss.employeeBean.emp_name} 職稱: ${sinlistss.employeeBean.emp_dep} ${sinlistss.employeeBean.emp_job}</font></p>
<p><font color="red">退回時間: ${sinlistss.sig_date} </font></p>
<p><font color="red">退回意見: ${sinlistss.sig_sug} </font></p>
</c:if>

</c:forEach>
<p>點單建議: ${sinlist.sig_sug}<p>
<p>點單時間: ${sinlist.sig_date}<p>
</c:if>

<c:if test="${sinlist.sig_sta !='簽核中' and sinlist.sig_sta !='退回中'}">
<c:if test="${sinlist.sig_sta =='已簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>
<p>簽核時間:${sinlist.sig_date}</p>
<p><font color="black">簽核意見:${sinlist.sig_sug}</font></p>
</c:if>

<c:if test="${sinlist.sig_sta =='未簽核'}">
<p><font color="black">${sinlist.employeeBean.emp_name} ${sinlist.sig_sta}</font></p>
<p>職稱:${sinlist.employeeBean.emp_dep} ${sinlist.employeeBean.emp_job}</p>

</c:if>

</c:if>

</c:if>
</c:forEach>

<form action="<c:url value="/Apply/applysignss.controller" />" method="post">
簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
</textarea><font color="red">${error.plz}</font><p>
<%-- <p>簽核意見:<input type="text" name="SignSug" value=""> <font color="red">${error.plz}</font><p> --%>

 <c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>
 <c:if test="${sinlist.sig_sta == '簽核中'  or sinlist.sig_sta == '退回中' }">
 <Input type='hidden' name='app_manger' value='${sinlist.app_manger}'><P/>
 <Input type='hidden' name='app_sta' value='${sinlist.app_sta}'><P/>
 <Input type='hidden' name='app_id' value='${sinlist.app_id}'><P/>
 <Input type='hidden' name='sig_date' value='${sinlist.sig_date}'><P/>
 <Input type='hidden' name='sig_sta' value='${sinlist.sig_sta}'><P/>
 <Input type='hidden' name='sig_sug' value='${sinlist.sig_sug}'><P/>
 <Input type='hidden' name='sig_rank' value='${sinlist.sig_rank}'><P/>
 </c:if>
</c:forEach>

<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>

<c:if test="${sinlist.app_sta == '請購核准' }">
 <c:if test="${sinlist.employeeBean.emp_id == user.emp_id and sinlist.sig_sta =='簽核中'}">
  
 <Input type='submit' name='send' value='請購核准'>
</c:if>
 <c:if test="${sinlist.employeeBean.emp_id != user.emp_id or sinlist.sig_sta !='簽核中'}">
 
 <Input type='submit' name='send' value='送出'>
</c:if>
</c:if>

</c:forEach> 
 
 
<c:forEach var='sinlist' varStatus='vs' items='${singerlist.app_SigningProcessBean}'>

<c:if test="${sinlist.sig_rank == 1}">
 <c:if test="${sinlist.employeeBean.emp_id == user.emp_id and sinlist.sig_sta =='退回中'}">
  <Input type='submit' name='send' value='註銷請購單'>

</c:if>
 <c:if test="${sinlist.employeeBean.emp_id != user.emp_id or sinlist.sig_sta !='退回中'}">
  <Input type='submit' name='send' value='退回'>
  
</c:if>
</c:if>


</c:forEach>
</form>

</body>
</html>