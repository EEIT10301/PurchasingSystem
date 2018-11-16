<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待派驗收單</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#submit {
	position: absolute;
	right: 700px;
}
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
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
}

</style>
</head>
<body class="bg">
<div class="right">
	<c:if test="${not empty invmain }">
		<h2>待分派驗收單號:${invmain.chk_Id}</h2>
		<form action="<c:url value="/Inv/Invsendlist.controller"/>" method="post">
				<table id="myTable" class="table table-striped table-hover" >
			<thead>
			<tr>
			<th>項目</th>
			<th>料號</th>
			<th>物料名稱</th>
			<th>到貨數量</th>
			</tr>
			<c:forEach var="invmaindetail" items="${invmain.inv_ProductListBean}">
			<tr>
				<td>${invmaindetail.productListBean.pro_cate}</td>
				<td>${invmaindetail.productListBean.part_no}</td>
				<td>${invmaindetail.productListBean.pro_name}</td>
				<td>${invmaindetail.chk_Count}</td>
				</tr>
			</c:forEach>
			<thead>
			<tbody id="selectAll">
			</tbody>
		</table>
		
						<table  class="table table-striped table-hover" >
			<thead>
			<tr>
			<th>簽核同仁</th>
			<th>員工姓名</th>
			<th>公司職位</th>
			<th>單據狀態</th>
			<th>簽核日期</th>
			<th>簽核狀態</th>
			<th>簽核建議</th>
			</tr>
			<c:forEach var="posigningprocess"
				items="${pomain.pO_SigningProcessBean}">
				<c:if test="${posigningprocess.sig_rank==1}">
				<tr>
					<td>${posigningprocess.employeeBean.emp_dep}</td>
					<td>${posigningprocess.employeeBean.emp_name}</td>
					<td>${posigningprocess.employeeBean.emp_job}</td>
					<td>${posigningprocess.po_sta}</td>
					<td>${posigningprocess.sig_date}</td>
					<td>${posigningprocess.sig_sta}</td>
					<td>${posigningprocess.sig_sug}</td>
				</tr>
				</c:if>
				</c:forEach>
				
				<thead>
			<tbody id="selectAll">
			</tbody>
		</table>
				<P>指派人</P>
				<select name="employeesend">
					<c:forEach var="empveansss" items="${empinvchkbeans}">
					<option value='${empveansss.emp_id}'>${empveansss.emp_dep}
						${empveansss.emp_name} ${empveansss.emp_job}</option>
					</c:forEach>
				</select>
				<br>
				分派意見:<p><textarea rows="5" cols="50"  name="SignSug">
             </textarea><font color="red"></font><p>
	       	<Input type='hidden' name='inv_manger' value='${SigningProcess.inv_Manger}'>
			<Input type='hidden' name='inv_Sta' value='${SigningProcess.inv_Sta}'>
		    <Input type='hidden' name='chk_Id' value='${SigningProcess.chk_Id}'>
			<Input type='hidden' name='sig_date' value='${SigningProcess.sig_Date}'>
			<Input type='hidden' name='sig_sta' value='${seSigningProcessndl1.sig_Sta}'>
			<Input type='hidden' name='sig_sug' value='${SigningProcess.sig_Sug}'>
			<Input type='submit' name='send' value='送出'>
			
		</form>
	</c:if>
		<script src="../js/app.js"></script>
	</div>
</body>
</html>