<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>驗收單明細</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#submit {
	position: absolute;
	right: 700px;
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}
.right{
	width:78%;
    float:left;
}
.search-form {
  text-align: right;
  input {
    border: none;
    padding: .5em;
    background: rgba(255,255,255,.5);
    color: #555;
  }
  button {
    @extend input;
  }
  #submit{
  display: block;
  }
}
</style>
</head>
<body>
<c:if test="${Inv_SigningProcessBean.sig_Sta!='再次驗收' }">
	<div class="right">
	<table class="table table-striped table-hover" id="table">


           <thead>

				
<!-- 				<tr> -->
<!-- 					<th><input  class="form-control" id="myInput" type="text" -->
<!-- 						placeholder="Search"><br /></th> -->
<!-- 				<style id="m-search"></style> -->
<!-- 				</tr> -->
				<tr lang="1000">
					<th width="10%">驗收項目</th>
					<th width="10%">驗收名稱</th>
					<th width="10%">驗收規格</th>
					<th width="10%">請購數量</th>
					<th width="10%">驗收品質</th>
					<th width="10%">驗收數量</th>
					<th id="tosubmit"></th>

				</tr>
			</thead>
	<tbody>
	<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
	
	<form action="<c:url value="/Inv/changeinvprosta"/>" method="post">
	        
		<tr class="searchable" data-index="${invpromain.productListBean.pro_cate}${invpromain.productListBean.pro_name}${invpromain.productListBean.pro_spe}${invpromain.chk_Count}">
	       <td > ${invpromain.productListBean.pro_cate}</td>
	       <td> ${invpromain.productListBean.pro_name}</td>
	       <td>${invpromain.productListBean.pro_spe}</td>
	       <td> ${invpromain.chk_Count}</td>
		 <c:if test="${ empty invpromain.chk_status}">
		  <td><input type="text" name='chk_quality' placeholder="驗收品質"></td>
		   <td> <input type="text" name='chk_Count' placeholder="  實際數量"></td>
		
		    <td><select name="chkstatus">
		     <option selected="selected">請選擇</option>   
		     <option  value="驗收成功">驗收成功</option>   
		     <option  value="驗收失敗">驗收失敗</option>   
		    </select>	</td>	
		    <td><Input type='submit' name='send' value='送出'></td>
	        </c:if>
		    <c:if test="${not empty invpromain.chk_status}">
		    <td><input type="text" name='chk_quality'  value="${invpromain.chk_quality}"></td>
		      <td><input type="text" name='chk_Count' value="${invpromain.chk_Count}"></td>
		   <td> <select name="chkstatus">
		     <option <c:if test="${invpromain.chk_status=='驗收成功' }">selected</c:if> value="驗收成功">驗收成功</option>   
		     <option <c:if test="${invpromain.chk_status=='驗收失敗' }">selected</c:if> value="驗收失敗">驗收失敗</option>   
		    </select>		
		  </td>	   
		    <td><Input disabled="disabled" type='submit' name='send' value='已驗收'></td>
	        </c:if>
			<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
			<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
	</tr>
	</form>
  
	</c:forEach>

	</tbody>
	</table>
	</div>
	</c:if>
<c:if test="${Inv_SigningProcessBean.sig_Sta=='再次驗收' }">
<div class="right">
<table class="table table-striped table-hover" id="myTable">
 <thead>
 <tr lang="1000">
					<th width="10%">驗收項目</th>
					<th width="10%">驗收名稱</th>
					<th width="10%">驗收規格</th>
					<th width="10%">請購數量</th>
					<th width="10%">前次驗收狀況</th>
					<th width="10%">前次驗收品質</th>
					<th width="10%">驗收品質</th>
					<th width="10%">驗收數量</th>
					<th id="tosubmit"></th>

				</tr>
			</thead>

<c:forEach var="invpromain" items="${invmain.inv_ProductListBean}">
<tr>
 <td > ${invpromain.productListBean.pro_cate}</td>
	       <td> ${invpromain.productListBean.pro_name}</td>
	       <td>${invpromain.productListBean.pro_spe}</td>
	       <td> ${invpromain.chk_Count}</td>	
           <td>${invpromain.chk_status}</td> 
           <td>${invpromain.chk_quality}</td>

<form action="<c:url value="/Inv/changeinvprosta"/>" method="post">
          <c:if test="${invpromain.chk_status=='驗收失敗'}">
		   <td> <input type="text" name='chk_quality' placeholder="驗收品質"></td>
		    <td> <input type="text" name='chk_Count' placeholder="實際數量"></td>
		
		    <td><select name="chkstatus">
		     <option selected="selected">請選擇</option>   
		     <option  value="驗收成功">驗收成功</option>   
		     <option  value="驗收失敗">驗收失敗</option>   
		       
		    </select>	</td>	
		   <td> <Input type='submit' name='send' value='送出'></td>
	        </c:if>
	      
  <c:if test="${invpromain.chk_status=='驗收成功'}">
	<td> 驗收品質:<input type="text" name='chk_quality'  value="${invpromain.chk_quality}"></td>
	<td>  實際數量:<input type="text" name='chk_Count' value="${invpromain.chk_Count}"></td>
	
		    <td><select name="chkstatus">
		     <option <c:if test="${invpromain.chk_status=='驗收成功' }">selected</c:if> value="驗收成功">驗收成功</option>   
		     <option <c:if test="${invpromain.chk_status=='驗收失敗' }">selected</c:if> value="驗收失敗">驗收失敗</option>   
		       
		    </select></td>		
		   <td> <Input disabled="disabled" type='submit' name='send' value='已驗收'></td>
	        </c:if>
<Input type='hidden' name="chk_Id" value='${invpromain.chk_Id}'>
<Input type='hidden' name="part_No" value='${invpromain.part_No}'>
</form>
</tr>
</c:forEach>
	</tbody>
	</table>
	</div>
</c:if>



<a href="confirmchk?sigSta=${Inv_SigningProcessBean.sig_Sta}chkId=${Inv_SigningProcessBean.chk_Id}"></a>
		
		<form action="invfinish.conll" method="post">
		驗收單號:${Inv_SigningProcessBean.chk_Id }
		驗收簽核狀態:${Inv_SigningProcessBean.sig_Sta }
		<Input type='hidden' name="sigSta" value='${Inv_SigningProcessBean.sig_Sta}'>
		<Input type='hidden' name="chkId" value='${Inv_SigningProcessBean.chk_Id}'>
        <Input id="submit" type='submit' name='send' value='驗收完成'>
       
        </div>
</body>
</html>