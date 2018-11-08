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
<h2>採購單編號:${pomainlist.po_id}</h2>
<c:if test="${not empty thispro}">
<p>簽核中流程<p>
<p><font color='red'>${user.emp_name}簽核中</font><p>
<p>職稱: ${user.emp_dep} ${user.emp_job}</p>
<p>申請人: ${pomainlist.employeeBean.emp_name}</p>
<p>採購預估總價格: ${pomainlist.total_price}</p>
<p>採購廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p>
<c:forEach var='posign' varStatus='vs' items='${posignprocess}'>
<c:if test="${posign.sig_rank==3}">
<p>詢價建議: ${posign.sig_sug} </p>
</c:if>
</c:forEach>
<h2>採購單明細</h2>
<c:forEach var='podetail' varStatus='vs' items='${podetail}'>
<p>料號: ${podetail.part_No} </p>
<p>物料名稱: ${podetail.productListBean.pro_name} </p>
<p>物料市場價格: ${podetail.market_Price} </p>
<p>物料採購價格: ${podetail.total_Price} </p>
<p>物料請購數量: ${podetail.total_Qty} </p>
<p>物料採購數量: ${podetail.quotation} </p>
<p>該項採購總金額: ${podetail.quotation*podetail.total_Price} 元整 </p>
</c:forEach>

<p>選擇廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p>
<h2>詢價紀錄</h2>
<c:forEach var='poquerys' varStatus='vs' items='${poquery}'>
<p>廠商名稱: ${poquerys.pO_Vendor_InfoBean.vendor_name} </p>
<p>詢價時間: ${poquerys.po_querydate} </p>
<p>詢價總價: ${poquerys.po_totalprice} </p>
</c:forEach>

<h2>簽核順序</h2>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==3}">
<h3>第1步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==4}">
<h3>第2步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<c:if test="${not empty posignpro.sig_date}">
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==5}">
<c:if test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}">
<h3>第3步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<c:if test="${not empty posignpro.sig_date}">
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:if>
</c:if>
</c:forEach>

<form action="<c:url value="/Po/POManagerSignertosigndetail.controller" />" method="post">
<Input type='hidden' name='po_manger' value='${thispro.po_manger}'>
<Input type='hidden' name='po_sta' value='${thispro.po_sta}'>
<Input type='hidden' name='po_id' value='${thispro.po_id}'>
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
<p>退回中採購單<p>
<p><font color='red'>${user.emp_name} 修改中</font><p>
<p>職稱: ${user.emp_dep} ${user.emp_job}</p>

<p>退回人: ${nobeforepro.employeeBean.emp_name}</p>
<p>職稱: ${nobeforepro.employeeBean.emp_dep} ${nobeforepro.employeeBean.emp_job}</p>
<p>退回時間: ${nobeforepro.sig_date}</p>
<p>退回意見: ${nobeforepro.sig_sug}</p>

<p>採購單申請人: ${pomainlist.employeeBean.emp_name}</p>
<p>採購預估總價格: ${pomainlist.total_price}</p>
<p>採購廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p>
<c:forEach var='posign' varStatus='vs' items='${posignprocess}'>
<c:if test="${posign.sig_rank==3}">
<p>詢價建議: ${posign.sig_sug} </p>
</c:if>
</c:forEach>
<h2>採購單明細</h2>
<c:forEach var='podetail' varStatus='vs' items='${podetail}'>
<p>料號: ${podetail.part_No} </p>
<p>物料名稱: ${podetail.productListBean.pro_name} </p>
<p>物料市場價格: ${podetail.market_Price} </p>
<p>物料採購價格: ${podetail.total_Price} </p>
<p>物料請購數量: ${podetail.total_Qty} </p>
<p>物料採購數量: ${podetail.quotation} </p>
<p>該項採購總金額: ${podetail.quotation*podetail.total_Price} 元整 </p>
</c:forEach>

<p>選擇廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p>
<h2>詢價紀錄</h2>
<c:forEach var='poquerys' varStatus='vs' items='${poquery}'>
<p>廠商名稱: ${poquerys.pO_Vendor_InfoBean.vendor_name} </p>
<p>詢價時間: ${poquerys.po_querydate} </p>
<p>詢價總價: ${poquerys.po_totalprice} </p>
</c:forEach>

<h2>簽核順序</h2>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==3}">
<h3>第1步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==4}">
<h3>第2步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<c:if test="${not empty posignpro.sig_date}">
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:if>
</c:forEach>
<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
<c:if test="${posignpro.sig_rank==5}">
<c:if test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}">
<h3>第3步:</h3>
<p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p>
<p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p>
<c:if test="${not empty posignpro.sig_date}">
<p>簽核時間: ${posignpro.sig_date} </p>
<p>簽核建議: ${posignpro.sig_sug} </p>
</c:if>
</c:if>
</c:if>
</c:forEach>

<form action="<c:url value="/Apply/ceoPOManagerSignertosigndetail.controller" />" method="post">
<Input type='hidden' name='po_manger' value='${nothispro.po_manger}'>
<Input type='hidden' name='po_sta' value='${nothispro.po_sta}'>
<Input type='hidden' name='po_id' value='${nothispro.po_id}'>
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