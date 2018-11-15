<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
       <%@ include file="../POInclude.jsp"%>
       <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購單狀態流程</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/POcss.css">

</head>
<body class="bg">

<div class="right">
<c:if test="${empty po_id }">
 <h2>無採購單產生</h2>
</c:if>

<c:if test="${not empty po_id }">


<h2>採購單編號 :${po_id}</h2>
<table class="table table-striped table-hover" id="myTable">

<tr>
<th width="200px">採購單編號</th>
<th width="200px">採購人員</th>
<th width="200px">採購廠商</th>
<th>採購總價</th>
</tr>

<tr>
<td>${pomain.po_id}</td>
<td>${poEmployee.emp_name}</td>
<td>${vendor.vendor_name}</td>
<td>${pomain.total_price}元</td>

</tr>


</table>





<c:if test="${not empty podetail}">


<h2>採購清單</h2>
<table class="table table-striped table-hover" id="myTable">


<tr>
<th width="200px">料號</th>
<th width="200px">材料項目</th>
<th>材料名稱</th>
<th>材料規格</th>
<th>請購數量</th>
<th>預估價格</th>
<th>實際採購數量</th>
<th>實際採購價格</th>
<th>該物料總價格</th>
</tr>

<c:forEach var="podetail"  items="${podetail}" varStatus="status">
<tr>
<td>${podetail.part_No}</td>
<td>${podetail.productListBean.pro_cate}</td>
<td>${podetail.productListBean.pro_name}</td>
<td>${podetail.productListBean.pro_spe}</td>
<td>${podetail.total_Qty}</td>
<td>${podetail.market_Price}元</td>
<td>${podetail.quotation}</td>
<td>${podetail.total_Price}元</td>
<td>${podetail.total_Price*podetail.quotation}元</td>

<%--   <td><c:out value="${status.count.last}"/> </td> --%>

</tr>


<!-- <tr> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- <td></td> -->
<!-- </tr> -->
</c:forEach>








</table>


</c:if>















<c:if test="${not empty POprocess}">
<h2>採購簽核流程</h2>
<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th>簽核人</th>
<th>簽核時間</th>
<th>簽核情形</th>
<th>簽核建議</th>
</tr>
</thead>

<c:forEach var="POprocess" items="${POprocess}">
<c:if test="${POprocess.sig_sta == '簽核中'  or POprocess.sig_sta == '退回中' or POprocess.sig_sta == '詢價中' or POprocess.sig_sta == '分派中' or POprocess.sig_sta == '下單中' or POprocess.sig_sta == '出貨中'}">

<tr>
<td><font color="red">${POprocess.sig_rank}</font></td>
<td><font color="red">${POprocess.po_sta}</font></td>
<td><font color="red">${POprocess.employeeBean.emp_name}</font></td>
<td>
<font color="red">

<fmt:formatDate  pattern="yyyy/MM/dd HH:mm"  value="${POprocess.sig_date}"/>
 </font>

<%-- </fmt:formatDate> --%>
</td>
<td><font color="red">${POprocess.sig_sta}</font></td>
<td>
<font color="red">${POprocess.sig_sug}</font>

</td>
</tr>

</c:if>

<c:if test="${POprocess.sig_sta != '簽核中'  and POprocess.sig_sta != '退回中' and POprocess.sig_sta != '詢價中' and POprocess.sig_sta != '分派中' and POprocess.sig_sta != '下單中' and POprocess.sig_sta != '出貨中'}">

<tr>
<td>${POprocess.sig_rank}</td>
<td>${POprocess.po_sta}</td>
<td>${POprocess.employeeBean.emp_name}</td>
<td>
<fmt:formatDate pattern="yyyy/MM/dd HH:mm"  value="${POprocess.sig_date}"/>

</td>
<td>${POprocess.sig_sta}</td>
<td>
${POprocess.sig_sug}

</td>

</tr>

</c:if>
</c:forEach>

</table>
</c:if>
</c:if>






<c:if test="${empty ck_id}">
<h2>無驗收單產生</h2>
</c:if>


<c:if test="${not empty ck_id}">
<h2>驗收簽核流程</h2>
<c:if test="${not empty Invprocess}">


<table class="table table-striped table-hover" id="myTable">
<thead>
<tr>
<th width="200px">簽核順序</th>
<th width="200px">流程進度</th>
<th width="200px">簽核人</th>
<th width="200px">簽核時間</th>
<th >簽核情形</th>
<th>簽核建議</th>
</tr>
</thead>
<c:forEach var="Invprocess" items="${Invprocess}">
<c:if test="${Invprocess.sig_Sta != '待分派' and Invprocess.sig_Sta != '驗收中' }">

<tr>
<td>${Invprocess.sig_Rank}</td>
<td>${Invprocess.inv_Sta}</td>
<td>${Invprocess.employeeBean.emp_name}</td>
<td>
<fmt:formatDate  pattern="yyyy/MM/dd HH:mm"  value="${Invprocess.sig_Date}"/>
</td>
<td>${Invprocess.sig_Sta}</td>
<td>${Invprocess.sig_Sug}</td>
</tr>

</c:if>
</c:forEach>

<c:forEach var="Invprocess" items="${Invprocess}">
<c:if test="${Invprocess.sig_Sta == '待分派' or Invprocess.sig_Sta == '驗收中' }">

<tr>
<td><font color="red">${Invprocess.sig_Rank}</font></td>
<td><font color="red">${Invprocess.inv_Sta}</font></td>
<td><font color="red">${Invprocess.employeeBean.emp_name}</font></td>
<td><font color="red">
<fmt:formatDate  pattern="yyyy/MM/dd HH:mm"  value="${Invprocess.sig_Date}"/>
</font></td>
<td><font color="red">${Invprocess.sig_Sta}</font></td>
<td><font color="red">${Invprocess.sig_Sug}</font></td>
</tr>

</c:if>
</c:forEach>


</table>
</c:if>
</c:if>


</div>

<script src="../js/app.js"></script>














<%--  <h2>採購單號 :${po_id}</h2> --%>
<!--  <div class="prolist"> -->
<%-- <c:if test="${not empty POprocess}"> --%>
<%-- <c:forEach var="POprocess" items="${POprocess}"> --%>


<%-- <c:if test="${POprocess.sig_sta == '簽核中'  or POprocess.sig_sta == '退回中' or POprocess.sig_sta == '詢價中' or POprocess.sig_sta == '分派中' or POprocess.sig_sta == '下單中' or POprocess.sig_sta == '出貨中'}"> --%>

<!-- <div class='pro'> -->

<%-- <form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post"> --%>
<%-- <P><font color="red">流程進度：${POprocess.po_sta}</font><P> --%>
<%-- <P><font color="red">簽核人：${POprocess.employeeBean.emp_name}</font><P> --%>
<%-- <P><font color="red">簽核時間：${POprocess.sig_date}</font><c:if test="${empty POprocess.sig_date}"><font color="red">時間未暫定</font></c:if><P>  --%>
<%-- <P><font color="red">簽核情形：${POprocess.sig_sta}</font><P> --%>
<%-- <P><font color="red">簽核建議：${POprocess.sig_sug}</font><c:if test="${empty POprocess.sig_sug}"><font color="red">意見未更新</font></c:if><P>  --%>
<%--   <Input type='hidden' name=po_manger value='${POprocess.po_manger}'><P/> --%>
<%--   <Input type='hidden' name='po_sta' value='${POprocess.po_sta}'><P/> --%>
<%--   <Input type='hidden' name='po_id' value='${POprocess.po_id}'><P/> --%>
<%--   <Input type='hidden' name='sig_date' value='${POprocess.sig_date}'><P/> --%>
<%--   <Input type='hidden' name='sig_sta' value='${POprocess.sig_sta}'><P/> --%>
<%--   <Input type='hidden' name='sig_sug' value='${POprocess.sig_sug}'><P/> --%>
<%--   <Input type='hidden' name='sig_rank' value='${POprocess.sig_rank}'><P/> --%>
<!--   </form> -->

<!-- </div> -->

<%-- </c:if> --%>

<%-- <c:if test="${POprocess.sig_sta != '簽核中'  and POprocess.sig_sta != '退回中' and POprocess.sig_sta != '詢價中' and POprocess.sig_sta != '分派中' and POprocess.sig_sta != '下單中' and POprocess.sig_sta != '出貨中'}"> --%>
<!-- <div class='pro'> -->

<%-- <form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post"> --%>
<%-- <P><font color="black">流程進度：${POprocess.po_sta}</font><P> --%>
<%-- <P><font color="black">簽核人：${POprocess.employeeBean.emp_name}</font><P> --%>
<%-- <P><font color="black">簽核時間：${POprocess.sig_date}</font><c:if test="${empty POprocess.sig_date}"><font color="black">時間未暫定</font></c:if><P>  --%>
<%-- <P><font color="black">簽核情形：${POprocess.sig_sta}</font><P> --%>
<%-- <P><font color="black">簽核建議：${POprocess.sig_sug}</font><c:if test="${empty POprocess.sig_sug}"><font color="black">意見未更新</font></c:if><P>  --%>
<%--   <Input type='hidden' name=po_manger value='${POprocess.po_manger}'><P/> --%>
<%--   <Input type='hidden' name='po_sta' value='${POprocess.po_sta}'><P/> --%>
<%--   <Input type='hidden' name='po_id' value='${POprocess.po_id}'><P/> --%>
<%--   <Input type='hidden' name='sig_date' value='${POprocess.sig_date}'><P/> --%>
<%--   <Input type='hidden' name='sig_sta' value='${POprocess.sig_sta}'><P/> --%>
<%--   <Input type='hidden' name='sig_sug' value='${POprocess.sig_sug}'><P/> --%>
<%--   <Input type='hidden' name='sig_rank' value='${POprocess.sig_rank}'><P/> --%>
<!--   </form> -->

<!-- </div> -->
<%-- </c:if> --%>

<%-- </c:forEach> --%>
<%-- </c:if> --%>
<!-- </div> -->


<%-- <h2>驗收單號 :${ck_id}</h2> --%>
<!--  <div class="prolist"> -->
<%-- <c:if test="${not empty Invprocess}"> --%>
<%-- <c:forEach var="Invprocess" items="${Invprocess}"> --%>
<%-- <c:if test="${Invprocess.sig_Sta != '待分派' and Invprocess.sig_Sta != '驗收中' }"> --%>
<!-- <div class='pro'> -->

<%-- <form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post"> --%>
<%-- <P><font color="black">流程進度：${Invprocess.inv_Sta}</font><P> --%>
<%-- <P><font color="black">簽核人：${Invprocess.employeeBean.emp_name}</font><P> --%>
<%-- <P><font color="black">簽核時間：${Invprocess.sig_Date}</font><P>  --%>
<%-- <P><font color="black">簽核情形：${Invprocess.sig_Sta}</font><P> --%>
<%-- <P><font color="black">簽核建議：${Invprocess.sig_Sug}</font><P>  --%>
<%--   <Input type='hidden' name="inv_Manger" value='${Invprocess.inv_Manger}'><P/> --%>
<%--   <Input type='hidden' name='inv_Sta' value='${Invprocess.inv_Sta}'><P/> --%>
<%--   <Input type='hidden' name='chk_Id' value='${Invprocess.chk_Id}'><P/> --%>
<%--   <Input type='hidden' name='sig_Date' value='${Invprocess.sig_Date}'><P/> --%>
<%--   <Input type='hidden' name='sig_Sta' value='${Invprocess.sig_Sta}'><P/> --%>
<%--   <Input type='hidden' name='sig_Sug' value='${Invprocess.sig_Sug}'><P/> --%>
<%--   <Input type='hidden' name='sig_Rank' value='${Invprocess.sig_Rank}'><P/> --%>
<!--   </form> -->

<!-- </div> -->
<%-- </c:if> --%>

<%-- <c:if test="${Invprocess.sig_Sta == '待分派' or Invprocess.sig_Sta == '驗收中' }"> --%>

<!-- <div class='pro'> -->

<%-- <form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post"> --%>
<%-- <P><font color="red">流程進度：${Invprocess.inv_Sta}</font><P> --%>
<%-- <P><font color="red">簽核人：${Invprocess.employeeBean.emp_name}</font><P> --%>
<%-- <P><font color="red">簽核時間：${Invprocess.sig_Date}</font><P>  --%>
<%-- <P><font color="red">簽核情形：${Invprocess.sig_Sta}</font><P> --%>
<%-- <P><font color="red">簽核建議：${Invprocess.sig_Sug}</font><P>  --%>
<%--   <Input type='hidden' name="inv_Manger" value='${Invprocess.inv_Manger}'><P/> --%>
<%--   <Input type='hidden' name='inv_Sta' value='${Invprocess.inv_Sta}'><P/> --%>
<%--   <Input type='hidden' name='chk_Id' value='${Invprocess.chk_Id}'><P/> --%>
<%--   <Input type='hidden' name='sig_Date' value='${Invprocess.sig_Date}'><P/> --%>
<%--   <Input type='hidden' name='sig_Sta' value='${Invprocess.sig_Sta}'><P/> --%>
<%--   <Input type='hidden' name='sig_Sug' value='${Invprocess.sig_Sug}'><P/> --%>
<%--   <Input type='hidden' name='sig_Rank' value='${Invprocess.sig_Rank}'><P/> --%>
<!--   </form> -->

<!-- </div> -->
<%-- </c:if> --%>

<%-- </c:forEach> --%>

<%-- </c:if> --%>
<!--  </div> -->





</body>
</html>