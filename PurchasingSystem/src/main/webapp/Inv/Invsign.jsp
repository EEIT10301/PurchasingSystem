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
<h1>${bean2.sig_Date }</h1>
<c:if test="${Inv_SigningProcessBean.sig_Sta!='再次驗收' }">
	<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
	
	<form action="<c:url value="/Inv/changeinvprosta"/>" method="post">
	
			<P>驗收項目:${invpromain.productListBean.pro_cate}</P>

			<p>驗收名稱:${invpromain.productListBean.pro_name}</p>

			<p>驗收規格:${invpromain.productListBean.pro_spe}</p>
			<p>請購數量:${invpromain.chk_Count}</p>
		<p></p>
		 <c:if test="${ empty invpromain.chk_status}">
		      驗收品質:<input type="text" name='chk_quality' ><br>
		      實際數量:<input type="text" name='chk_Count' ><br>
		
		    <select name="chkstatus">
		     <option selected="selected">請選擇</option>   
		     <option  value="驗收成功">驗收成功</option>   
		     <option  value="驗收失敗">驗收失敗</option>   
		       
		    </select>		
		    <Input type='submit' name='send' value='送出'>
	        </c:if>
		    <c:if test="${not empty invpromain.chk_status}">
		      驗收品質:<input type="text" name='chk_quality'  value="${invpromain.chk_quality}"><br>
		      實際數量:<input type="text" name='chk_Count' value="${invpromain.chk_Count}"><br>
		
		    <select name="chkstatus">
		     <option <c:if test="${invpromain.chk_status=='驗收成功' }">selected</c:if> value="驗收成功">驗收成功</option>   
		     <option <c:if test="${invpromain.chk_status=='驗收失敗' }">selected</c:if> value="驗收失敗">驗收失敗</option>   
		       
		    </select>		
		    <Input disabled="disabled" type='submit' name='send' value='送出'>
	        </c:if>
			<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
			<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
	</form>
  
	</c:forEach>
	</c:if>
<c:if test="${Inv_SigningProcessBean.sig_Sta=='再次驗收' }">
<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
<p>之前驗收狀況:${invpromain.chk_status}</p>
<p>之前驗收品質${invpromain.chk_quality}</p>
<p></p>
<form action="<c:url value="/Inv/changeinvprosta"/>" method="post">
          <c:if test="${invpromain.chk_status=='驗收失敗'}">
		      驗收品質:<input type="text" name='chk_quality' ><br>
		      實際數量:<input type="text" name='chk_Count' ><br>
		
		    <select name="chkstatus">
		     <option selected="selected">請選擇</option>   
		     <option  value="驗收成功">驗收成功</option>   
		     <option  value="驗收失敗">驗收失敗</option>   
		       
		    </select>		
		    <Input type='submit' name='send' value='送出'>
	        </c:if>
	      
  <c:if test="${invpromain.chk_status=='驗收成功'}">
		      驗收品質:<input type="text" name='chk_quality'  value="${invpromain.chk_quality}"><br>
		      實際數量:<input type="text" name='chk_Count' value="${invpromain.chk_Count}"><br>
	
		    <select name="chkstatus">
		     <option <c:if test="${invpromain.chk_status=='驗收成功' }">selected</c:if> value="驗收成功">驗收成功</option>   
		     <option <c:if test="${invpromain.chk_status=='驗收失敗' }">selected</c:if> value="驗收失敗">驗收失敗</option>   
		       
		    </select>		
		    <Input disabled="disabled" type='submit' name='send' value='送出'>
	        </c:if>
<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
</form>
</c:forEach>
</c:if>



<a href="confirmchk?sigSta=${Inv_SigningProcessBean.sig_Sta}chkId=${Inv_SigningProcessBean.chk_Id}"></a>
		<form action="invfinish.conll" method="post">
		驗收單號:${Inv_SigningProcessBean.chk_Id }
		驗收簽核狀態:${Inv_SigningProcessBean.sig_Sta }
		<Input type='hidden' name="sigSta" value='${Inv_SigningProcessBean.sig_Sta}'>
		<Input type='hidden' name="chkId" value='${Inv_SigningProcessBean.chk_Id}'>
        <Input type='submit' name='send' value='驗收完成'>
        </form>
</body>
</html>