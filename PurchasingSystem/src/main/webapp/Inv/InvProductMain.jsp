<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty invmain }">
		<h2>待分派驗收單號:${invmain.chk_Id}</h2>
		<form action="<c:url value=""/>" method="post">
			<c:forEach var="invmaindetail" items="${invmain.inv_ProductListBean}">
				<P>項目:${invmaindetail.productListBean.pro_cate}</P>
				<p>料號:${invmaindetail.productListBean.part_no}</p>
				<p>物料名稱:${invmaindetail.productListBean.pro_name}</p>
				<p>到貨數量:${invmaindetail.chk_Count}</p>
			</c:forEach>
			<c:forEach var="posigningprocess"
				items="${pomain.pO_SigningProcessBean}">
				<c:if test="${posigningprocess.sig_rank==1}">
					<p>簽核同仁:${posigningprocess.employeeBean.emp_dep}
						${posigningprocess.employeeBean.emp_name}
						${posigningprocess.employeeBean.emp_job}
						單據狀態:${posigningprocess.po_sta} 簽核日期:${posigningprocess.sig_date}
						簽核狀態:${posigningprocess.sig_sta} 簽核建議:${posigningprocess.sig_sug}</p>
				</c:if>
				</c:forEach>
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
</body>
</html>