<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購單狀態流程</title>

<style type="text/css">
	body{
		background-repeat:no-repeat;
		background-size:100%;
		margin:0;
		padding:0;
		font-family:'微軟正黑體';
		background-attachment:fixed;
	}
	.prolist{
		display: flex;
		width:70%;
		margin:0 auto;
		flex-wrap:wrap;
	}
	.pro{
		flex: 0 0 33.3;
		margin:10px;
	}
	.pro p{
		text-align:center;
	}
	.pro input{
		width:120px;
		background-color: white;
		font-size: 1.05em;
	}
</style>

</head>
<body>

 <h2>採購單號 :${po_id}</h2>
 <div class="prolist">
<c:if test="${not empty POprocess}">
<c:forEach var="POprocess" items="${POprocess}">


<c:if test="${POprocess.sig_sta == '簽核中'  or POprocess.sig_sta == '退回中' or POprocess.sig_sta == '詢價中' or POprocess.sig_sta == '分派中' or POprocess.sig_sta == '下單中' or POprocess.sig_sta == '出貨中'}">

<div class='pro'>

<form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post">
<P><font color="red">流程進度：${POprocess.po_sta}</font><P>
<P><font color="red">簽核人：${POprocess.employeeBean.emp_name}</font><P>
<P><font color="red">簽核時間：${POprocess.sig_date}</font><c:if test="${empty POprocess.sig_date}"><font color="red">時間未暫定</font></c:if><P> 
<P><font color="red">簽核情形：${POprocess.sig_sta}</font><P>
<P><font color="red">簽核建議：${POprocess.sig_sug}</font><c:if test="${empty POprocess.sig_sug}"><font color="red">意見未更新</font></c:if><P> 
  <Input type='hidden' name=po_manger value='${POprocess.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${POprocess.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${POprocess.po_id}'><P/>
  <Input type='hidden' name='sig_date' value='${POprocess.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${POprocess.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${POprocess.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${POprocess.sig_rank}'><P/>
  </form>

</div>

</c:if>

<c:if test="${POprocess.sig_sta != '簽核中'  and POprocess.sig_sta != '退回中' and POprocess.sig_sta != '詢價中' and POprocess.sig_sta != '分派中' and POprocess.sig_sta != '下單中' and POprocess.sig_sta != '出貨中'}">
<div class='pro'>

<form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post">
<P><font color="black">流程進度：${POprocess.po_sta}</font><P>
<P><font color="black">簽核人：${POprocess.employeeBean.emp_name}</font><P>
<P><font color="black">簽核時間：${POprocess.sig_date}</font><c:if test="${empty POprocess.sig_date}"><font color="black">時間未暫定</font></c:if><P> 
<P><font color="black">簽核情形：${POprocess.sig_sta}</font><P>
<P><font color="black">簽核建議：${POprocess.sig_sug}</font><c:if test="${empty POprocess.sig_sug}"><font color="black">意見未更新</font></c:if><P> 
  <Input type='hidden' name=po_manger value='${POprocess.po_manger}'><P/>
  <Input type='hidden' name='po_sta' value='${POprocess.po_sta}'><P/>
  <Input type='hidden' name='po_id' value='${POprocess.po_id}'><P/>
  <Input type='hidden' name='sig_date' value='${POprocess.sig_date}'><P/>
  <Input type='hidden' name='sig_sta' value='${POprocess.sig_sta}'><P/>
  <Input type='hidden' name='sig_sug' value='${POprocess.sig_sug}'><P/>
  <Input type='hidden' name='sig_rank' value='${POprocess.sig_rank}'><P/>
  </form>

</div>
</c:if>

</c:forEach>
</c:if>
</div>


<h2>驗收單號 :${ck_id}</h2>
 <div class="prolist">
<c:if test="${not empty Invprocess}">
<c:forEach var="Invprocess" items="${Invprocess}">
<c:if test="${Invprocess.sig_Sta != '待分派' and Invprocess.sig_Sta != '驗收中' }">
<div class='pro'>

<form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post">
<P><font color="black">流程進度：${Invprocess.inv_Sta}</font><P>
<P><font color="black">簽核人：${Invprocess.employeeBean.emp_name}</font><P>
<P><font color="black">簽核時間：${Invprocess.sig_Date}</font><P> 
<P><font color="black">簽核情形：${Invprocess.sig_Sta}</font><P>
<P><font color="black">簽核建議：${Invprocess.sig_Sug}</font><P> 
  <Input type='hidden' name="inv_Manger" value='${Invprocess.inv_Manger}'><P/>
  <Input type='hidden' name='inv_Sta' value='${Invprocess.inv_Sta}'><P/>
  <Input type='hidden' name='chk_Id' value='${Invprocess.chk_Id}'><P/>
  <Input type='hidden' name='sig_Date' value='${Invprocess.sig_Date}'><P/>
  <Input type='hidden' name='sig_Sta' value='${Invprocess.sig_Sta}'><P/>
  <Input type='hidden' name='sig_Sug' value='${Invprocess.sig_Sug}'><P/>
  <Input type='hidden' name='sig_Rank' value='${Invprocess.sig_Rank}'><P/>
  </form>

</div>
</c:if>

<c:if test="${Invprocess.sig_Sta == '待分派' or Invprocess.sig_Sta == '驗收中' }">

<div class='pro'>

<form action="<c:url value="/Po/POSignStatementDetail.controller" />" method="post">
<P><font color="red">流程進度：${Invprocess.inv_Sta}</font><P>
<P><font color="red">簽核人：${Invprocess.employeeBean.emp_name}</font><P>
<P><font color="red">簽核時間：${Invprocess.sig_Date}</font><P> 
<P><font color="red">簽核情形：${Invprocess.sig_Sta}</font><P>
<P><font color="red">簽核建議：${Invprocess.sig_Sug}</font><P> 
  <Input type='hidden' name="inv_Manger" value='${Invprocess.inv_Manger}'><P/>
  <Input type='hidden' name='inv_Sta' value='${Invprocess.inv_Sta}'><P/>
  <Input type='hidden' name='chk_Id' value='${Invprocess.chk_Id}'><P/>
  <Input type='hidden' name='sig_Date' value='${Invprocess.sig_Date}'><P/>
  <Input type='hidden' name='sig_Sta' value='${Invprocess.sig_Sta}'><P/>
  <Input type='hidden' name='sig_Sug' value='${Invprocess.sig_Sug}'><P/>
  <Input type='hidden' name='sig_Rank' value='${Invprocess.sig_Rank}'><P/>
  </form>

</div>
</c:if>

</c:forEach>

</c:if>
 </div>





</body>
</html>