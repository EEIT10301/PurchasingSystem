<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${invmain.chk_Id}驗收單細項</title>
</head>
<body>
	<h2>待驗收單號:${invmain.chk_Id}</h2>
	
	
		<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
	<form action="<c:url value="/Inv/changeinvprosta"/>" method="post">
	<c:if test="${empty invpromain.chk_status }">
			<P>驗收項目:${invpromain.productListBean.pro_cate}</P>

			<p>驗收名稱:${invpromain.productListBean.pro_name}</p>

			<p>驗收規格:${invpromain.productListBean.pro_spe}</p>
			<p>請購數量:${invpromain.chk_Count}</p>
		<p></p>
		      驗收品質:<input type="text" name='chk_quality' ><br>
		      實際數量:<input type="text" name='chk_Count' ><br>
		<select name="chkstatus">
		     <option value="" selected="selected">請選擇</option>   
			<option value="驗收成功">驗收成功</option>
			<option value="驗收失敗">驗收失敗</option>
		</select> 
			<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
			<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
		    
		    <Input type='submit' name='send' value='送出'>
	</c:if>
    <c:set var='chkstafail' value="驗收失敗"/>
	<c:if test="${chkstafail==invpromain.chk_status }">
			<P>驗收項目:${invpromain.productListBean.pro_cate}</P>

			<p>驗收名稱:${invpromain.productListBean.pro_name}</p>

			<p>驗收規格:${invpromain.productListBean.pro_spe}</p>
			<p>請購數量:${invpromain.chk_Count}</p>
		      驗收品質:<input type="text" name='chk_quality' ><br>
		      實際數量:<input type="text" name='chk_Count' ><br>
		
		<select name="chkstatus">
		     <option value="" selected="selected">前次驗收狀態:${invpromain.chk_status}</option>   
			<option value="驗收成功">驗收成功</option>
			<option value="驗收失敗">驗收失敗</option>
		</select> 
			<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
			<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
		    
		    <Input type='submit' name='send' value='送出'>
	</c:if>
	</form>
	</c:forEach>
	
	

		<form action="invfinish.conll" method="post">
		驗收單號:${Inv_SigningProcessBean.chk_Id }
		驗收單號:${Inv_SigningProcessBean.sig_Sta }
		<Input type='hidden' name="sigSta" value='${Inv_SigningProcessBean.sig_Sta}'>
		<Input type='hidden' name="chkId" value='${Inv_SigningProcessBean.chk_Id}'>
        <Input type='submit' name='send' value='驗收完成'>
        </form>
</body>
</html>