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
</head>
<body>
<h2>請購單編號:${appmain.app_id}</h2>
<c:if test="${not empty thispro}">
<p>簽核中流程<p>
<p><font color='red'>${user.emp_name}簽核中</font><p>
<p>職稱: ${user.emp_dep} ${user.emp_job}</p>
<p>申請人: ${appmain.employeeBean.emp_name}</p>
<p>請購預估總金額: ${appmain.app_price}</p>
<c:forEach var='appsign' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsign.sig_rank==1}">
<p>提案意見: ${appsign.sig_sug} </p>
</c:if>
</c:forEach>
<h2>請購商品明細</h2>
<c:forEach var='appdetail' varStatus='vs' items='${appDetail}'>
<p>料號: ${appdetail.part_no} </p>
<p>物料名稱: ${appdetail.productListBean.pro_name} </p>
<p>物料平均價格: ${appdetail.pro_price} </p>
<p>物料請購數量: ${appdetail.app_amount} </p>
<p>該項預估請購總金額: ${appdetail.app_amount*appdetail.pro_price} 元整 </p>
</c:forEach>

<h2>簽核順序</h2>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==1}">
<h3>第1步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:forEach>

<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==2}">
<h3>第2步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<c:if test="${not empty appsignpro.sig_date}">
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:if>
</c:forEach>

<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==3}">
<c:if test="${appsignpro.sig_sta=='未簽核' or appsignpro.sig_sta=='簽核中'}">
<h3>第3步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<c:if test="${not empty appsignpro.sig_date}">
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:if>
</c:if>
</c:forEach>

<form action="<c:url value="/Apply/applysignss.controller" />" method="post">
<Input type='hidden' name='app_manger' value='${thispro.app_manger}'>
<Input type='hidden' name='app_sta' value='${thispro.app_sta}'>
<Input type='hidden' name='app_id' value='${thispro.app_id}'>
<Input type='hidden' name='sig_date' value='${thispro.sig_date}'>
<Input type='hidden' name='sig_sta' value='${thispro.sig_sta}'>
<Input type='hidden' name='sig_sug' value='${thispro.sig_sug}'>
<Input type='hidden' name='sig_rank' value='${thispro.sig_rank}'>
簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
</textarea><font color="red">${error.plz}</font><p>
<Input type='submit' name='send' value='${sendsubmit1}'>
<Input type='submit' name='send' value='${sendsubmit2}'>
</form>


</c:if>

<c:if test="${not empty nothispro}">
<p><font color='red'>${user.emp_name} 修改中</font><p>
<p>職稱: ${user.emp_dep} ${user.emp_job}</p>

<p>退回人: ${nobeforepro.employeeBean.emp_name}</p>
<p>職稱: ${nobeforepro.employeeBean.emp_dep} ${nobeforepro.employeeBean.emp_job}</p>
<p>退回時間: ${nobeforepro.sig_date}</p>
<p>退回意見: ${nobeforepro.sig_sug}</p>

<p>請購單申請人: ${appmain.employeeBean.emp_name}</p>
<p>請購單預估總價格: ${appmain.app_price}</p>
<c:forEach var='appsign' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsign.sig_rank==1}">
<p>提案內容: ${appsign.sig_sug} </p>
</c:if>
</c:forEach>
<h2>請購商品明細</h2>
<c:forEach var='appdetail' varStatus='vs' items='${appDetail}'>
<p>料號: ${appdetail.part_no} </p>
<p>物料名稱: ${appdetail.productListBean.pro_name} </p>
<p>物料平均價格: ${appdetail.pro_price} </p>
<p>物料請購數量: ${appdetail.app_amount} </p>
<p>該項預估請購總金額: ${appdetail.app_amount*appdetail.pro_price} 元整 </p>
</c:forEach>

<h2>簽核順序</h2>
<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==1}">
<h3>第1步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:forEach>

<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==2}">
<h3>第2步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<c:if test="${not empty appsignpro.sig_date}">
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:if>
</c:forEach>

<c:forEach var='appsignpro' varStatus='vs' items='${app_Sign}'>
<c:if test="${appsignpro.sig_rank==3}">
<c:if test="${appsignpro.sig_sta=='未簽核' or appsignpro.sig_sta=='簽核中'}">
<h3>第3步:</h3>
<p>${appsignpro.employeeBean.emp_name} ${appsignpro.sig_sta}</p>
<p>職稱: ${appsignpro.employeeBean.emp_dep} ${appsignpro.employeeBean.emp_job}</p>
<c:if test="${not empty appsignpro.sig_date}">
<p>簽核時間: ${appsignpro.sig_date} </p>
<p>簽核建議: ${appsignpro.sig_sug} </p>
</c:if>
</c:if>
</c:if>
</c:forEach>

<form action="<c:url value="/Apply/applysignss.controller" />" method="post">
<Input type='hidden' name='app_manger' value='${nothispro.app_manger}'>
<Input type='hidden' name='app_sta' value='${nothispro.app_sta}'>
<Input type='hidden' name='app_id' value='${nothispro.app_id}'>
<Input type='hidden' name='sig_date' value='${nothispro.sig_date}'>
<Input type='hidden' name='sig_sta' value='${nothispro.sig_sta}'>
<Input type='hidden' name='sig_sug' value='${nothispro.sig_sug}'>
<Input type='hidden' name='sig_rank' value='${nothispro.sig_rank}'>
簽核意見:<p><textarea rows="5" cols="50"  name="SignSug">
</textarea><font color="red">${error.plz}</font><p>
<Input type='submit' name='send' value='${sendsubmit1}'>
<Input type='submit' name='send' value='${sendsubmit2}'>
</form>

</c:if>


</body>
</html>