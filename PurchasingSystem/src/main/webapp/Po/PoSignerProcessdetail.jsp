<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../POInclude.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>採購單細項</title>


<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bg">



	<div class="right">
		<c:if test="${not empty thispro}">
			<h2>採購單編號:${pomainlist.po_id}</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>簽核中流程</th>
					<th>職稱</th>
					<th>申請人</th>
					<th>採購預估總價格</th>
					<th>採購廠商</th>
					<th>詢價建議</th>
				</tr>
				<tr>
					<td><font color='red'>${user.emp_name}簽核中</font></td>
					<td>${user.emp_dep}${user.emp_job}</td>
					<td>${pomainlist.employeeBean.emp_name}</td>
					<td>${pomainlist.total_price}</td>
					<td>${pomainlist.pO_Vendor_InfoBean.vendor_name}</td>
					<c:forEach var='posign' varStatus='vs' items='${posignprocess}'>
						<c:if test="${posign.sig_rank==3}">
							<td>${posign.sig_sug}</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			
			<h2>採購單明細</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>料號</th>
					<th>物料名稱</th>
					<th>物料市場價格</th>
					<th>物料採購價格</th>
					<th>物料請購數量</th>
					<th>物料採購數量</th>
					<th>該項採購總金額</th>
					<th>選擇廠商</th>
				</tr>
				<c:forEach var='podetail' varStatus='vs' items='${podetail}'>
					<tr>
						<td>${podetail.part_No}</td>
						<td>${podetail.productListBean.pro_name}</td>
						<td>${podetail.market_Price}</td>
						<td>${podetail.total_Price}</td>
						<td>${podetail.total_Qty}</td>
						<td>${podetail.quotation}</td>
						<td>${podetail.quotation*podetail.total_Price}</td>
						<td>${pomainlist.pO_Vendor_InfoBean.vendor_name}</td>
					</tr>
				</c:forEach>
			</table>
			<h2>詢價紀錄</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>廠商名稱</th>
					<th>詢價時間</th>
					<th>詢價總價</th>
				</tr>
				<c:forEach var='poquerys' varStatus='vs' items='${poquery}'>
					<tr>
						<td>${poquerys.pO_Vendor_InfoBean.vendor_name}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${poquerys.po_querydate}"/></td>
						<td>${poquerys.po_totalprice}</td>
					</tr>
				</c:forEach>
			</table>
			<h2>簽核流程</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>簽核順序</th>
					<th>簽核人</th>
					<th>職稱</th>
					<th>狀態</th>
					<th>簽核時間</th>
					<th>簽核建議</th>
				</tr>
				<tr>
				<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
					<c:if test="${posignpro.sig_rank>=3 and posignpro.sig_rank<=4}">

						<%-- <h4>第1步:${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</h4> --%>
<!-- 						<tr> -->
							<td>${posignpro.sig_rank-2}</td>
							<td>${posignpro.employeeBean.emp_name}</td>
							<td>${posignpro.employeeBean.emp_dep}
								${posignpro.employeeBean.emp_job}</td>
							<td>${posignpro.sig_sta}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${posignpro.sig_date}"/></td>
							<td>${posignpro.sig_sug}</td>
<!-- 						</tr> -->

					</c:if>
					</tr>


					<c:if test="${posignpro.sig_rank==5}">
						<c:if
							test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}">
							<tr>
								<td>${posignpro.sig_rank-2}</td>
								<td>${posignpro.employeeBean.emp_name}</td>
								<td>${posignpro.employeeBean.emp_dep}
									${posignpro.employeeBean.emp_job}</td>
								<td>${posignpro.sig_sta}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${posignpro.sig_date}"/></td>
								<td>${posignpro.sig_sug}</td>
							</tr>
						</c:if>
					</c:if>
				</c:forEach>





			</table>

			<form
				action="<c:url value="/Po/POManagerSignertosigndetail.controller" />"
				method="post">
				<Input type='hidden' name='po_manger' value='${thispro.po_manger}'>
				<Input type='hidden' name='po_sta' value='${thispro.po_sta}'>
				<Input type='hidden' name='po_id' value='${thispro.po_id}'>
				<Input type='hidden' name='sig_date' value='${thispro.sig_date}'>
				<Input type='hidden' name='sig_sta' value='${thispro.sig_sta}'>
				<Input type='hidden' name='sig_sug' value='${thispro.sig_sug}'>
				<Input type='hidden' name='sig_rank' value='${thispro.sig_rank}'>
				簽核意見:
				<p>
					<textarea rows="5" cols="50" name="SignSug">
</textarea>
					<font color="red">${error.plz}</font>
				<p>
					<Input type='submit' name='send' class='btn btn-default' value='${sendsubmit1}'> <Input
						type='submit' name='send' class='btn btn-default' value='${sendsubmit2}'>
			</form>

		</c:if>






		<!-- 退回功能 -->






		<c:if test="${not empty nothispro}">
			<h2>退回中採購單${pomainlist.po_id}</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>簽核人</th>
					<th>職稱</th>
					<th>退回人</th>
					<th>職稱</th>
					<th>退回時間</th>
					<th>退回意見</th>
					<th>採購單申請人</th>
					<th>採購預估總價格</th>
					<th>採購廠商</th>
					<th>詢價建議</th>
				</tr>

				<tr>
					<td>${user.emp_name}</td>
					<td>${user.emp_dep}${user.emp_job}</td>
					<td>${nobeforepro.employeeBean.emp_name}</td>
					<td>${nobeforepro.employeeBean.emp_dep}
						${nobeforepro.employeeBean.emp_job}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${nobeforepro.sig_date}"/></td>
					<td>${nobeforepro.sig_sug}</td>
					<td>${pomainlist.employeeBean.emp_name}</td>
					<td>${pomainlist.total_price}</td>
					<td>${pomainlist.pO_Vendor_InfoBean.vendor_name}</td>
					<c:forEach var='posign' varStatus='vs' items='${posignprocess}'>
						<c:if test="${posign.sig_rank==3}">
							<td>${posign.sig_sug}</td>
						</c:if>

					</c:forEach>
				</tr>

			</table>

			<h2>採購單明細</h2>
			<table id="myTable" class="table table-striped table-hover">
				<tr>
					<th>料號</th>
					<th>物料名稱</th>
					<th>物料市場價格</th>
					<th>物料採購價格</th>
					<th>物料請購數量</th>
					<th>物料採購數量</th>
					<th>該項採購總金額</th>
					<th>選擇廠商</th>
				</tr>
				<c:forEach var='podetail' varStatus='vs' items='${podetail}'>
					<tr>
						<td>${podetail.part_No}</td>
						<td>${podetail.productListBean.pro_name}</td>
						<td>${podetail.market_Price}</td>
						<td>${podetail.total_Price}</td>
						<td>${podetail.total_Qty}</td>
						<td>${podetail.quotation}</td>
						<td>${podetail.quotation*podetail.total_Price}元整</td>
						<td>${pomainlist.pO_Vendor_InfoBean.vendor_name}</td>


					</tr>

				</c:forEach>
			</table>



			<h2>詢價紀錄</h2>

			<table id="myTable" class="table table-striped table-hover">

				<tr>
					<th>廠商名稱</th>
					<th>詢價時間</th>
					<th>詢價總價</th>
				</tr>

				<c:forEach var='poquerys' varStatus='vs' items='${poquery}'>
					<tr>
						<td>${poquerys.pO_Vendor_InfoBean.vendor_name}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${poquerys.po_querydate}"/></td>
						<td>${poquerys.po_totalprice}</td>
					</tr>
				</c:forEach>

			</table>


			<h2>簽核順序</h2>
			<table id="myTable" class="table table-striped table-hover">

				<tr>
					<th>步驟</th>
					<th>簽核人</th>
					<th>職稱</th>
					<th>狀態</th>
					<th>簽核時間</th>
					<th>簽核建議</th>
				</tr>
				<c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'>
					<c:if test="${posignpro.sig_rank>=3 and posignpro.sig_rank<=4}">

						<%-- <h4>第1步:${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</h4> --%>
						<tr>
							<td>${posignpro.sig_rank-2}</td>
							<td>${posignpro.employeeBean.emp_name}</td>
							<td>${posignpro.employeeBean.emp_dep}
								${posignpro.employeeBean.emp_job}</td>
							<td>${posignpro.sig_sta}</td>
							<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${posignpro.sig_date}"/></td>
							<td>${posignpro.sig_sug}</td>
						</tr>

					</c:if>



					<c:if test="${posignpro.sig_rank==5}">
						<c:if
							test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}">
							<tr>
								<td>${posignpro.sig_rank-2}</td>
								<td>${posignpro.employeeBean.emp_name}</td>
								<td>${posignpro.employeeBean.emp_dep}
									${posignpro.employeeBean.emp_job}</td>
								<td>${posignpro.sig_sta}</td>
								<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${posignpro.sig_date}"/></td>
								<td>${posignpro.sig_sug}</td>
							</tr>
						</c:if>
					</c:if>
				</c:forEach>

			</table>

			<form
				action="<c:url value="/Po/POManagerSignertosigndetail.controller" />"
				method="post">
				<Input type='hidden' name='po_manger' value='${nothispro.po_manger}'>
				<Input type='hidden' name='po_sta' value='${nothispro.po_sta}'>
				<Input type='hidden' name='po_id' value='${nothispro.po_id}'>
				<Input type='hidden' name='sig_date' value='${nothispro.sig_date}'>
				<Input type='hidden' name='sig_sta' value='${nothispro.sig_sta}'>
				<Input type='hidden' name='sig_sug' value='${nothispro.sig_sug}'>
				<Input type='hidden' name='sig_rank' value='${nothispro.sig_rank}'>
				簽核意見:
				<p>
					<textarea rows="5" cols="50" name="SignSug">
</textarea>
					<font color="red">${error.plz}</font>
				<p>
					<Input type='submit' name='send' class='btn btn-default' value='${sendsubmit1}'> <Input
						type='submit' name='send' class='btn btn-default' value='${sendsubmit2}'>
			</form>



		</c:if>


	</div>







	<!-- 舊功能 -->















	<%-- 	<h2>採購單編號:${pomainlist.po_id}</h2> --%>
	<%-- 	<c:if test="${not empty thispro}"> --%>
	<!-- 	<p>簽核中流程<p> -->
	<%-- 	<p><font color='red'>${user.emp_name}簽核中</font><p> --%>
	<%-- <p>職稱: ${user.emp_dep} ${user.emp_job}</p> --%>
	<%-- <p>申請人: ${pomainlist.employeeBean.emp_name}</p> --%>
	<%-- <p>採購預估總價格: ${pomainlist.total_price}</p> --%>
	<%-- <p>採購廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p> --%>
	<%-- <c:forEach var='posign' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posign.sig_rank==3}"> --%>
	<%-- <p>詢價建議: ${posign.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>



	<!-- <h2>採購單明細</h2> -->
	<%-- <c:forEach var='podetail' varStatus='vs' items='${podetail}'> --%>
	<%-- <p>料號: ${podetail.part_No} </p> --%>
	<%-- <p>物料名稱: ${podetail.productListBean.pro_name} </p> --%>
	<%-- <p>物料市場價格: ${podetail.market_Price} </p> --%>
	<%-- <p>物料採購價格: ${podetail.total_Price} </p> --%>
	<%-- <p>物料請購數量: ${podetail.total_Qty} </p> --%>
	<%-- <p>物料採購數量: ${podetail.quotation} </p> --%>
	<%-- <p>該項採購總金額: ${podetail.quotation*podetail.total_Price} 元整 </p> --%>
	<%-- </c:forEach> --%>
	<%-- <p>選擇廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p> --%>


	<!-- <h2>詢價紀錄</h2> -->
	<%-- <c:forEach var='poquerys' varStatus='vs' items='${poquery}'> --%>
	<%-- <p>廠商名稱: ${poquerys.pO_Vendor_InfoBean.vendor_name} </p> --%>
	<%-- <p>詢價時間: ${poquerys.po_querydate} </p> --%>
	<%-- <p>詢價總價: ${poquerys.po_totalprice} </p> --%>
	<%-- </c:forEach> --%>

	<!-- <h2>簽核順序</h2> -->
	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==3}"> --%>
	<!-- <h3>第1步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>

	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==4}"> --%>
	<!-- <h3>第2步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <c:if test="${not empty posignpro.sig_date}"> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>

	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==5}"> --%>
	<%-- <c:if test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}"> --%>
	<!-- <h3>第3步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <c:if test="${not empty posignpro.sig_date}"> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>

	<%-- <form action="<c:url value="/Po/POManagerSignertosigndetail.controller" />" method="post"> --%>
	<%-- <Input type='hidden' name='po_manger' value='${thispro.po_manger}'> --%>
	<%-- <Input type='hidden' name='po_sta' value='${thispro.po_sta}'> --%>
	<%-- <Input type='hidden' name='po_id' value='${thispro.po_id}'> --%>
	<%-- <Input type='hidden' name='sig_date' value='${thispro.sig_date}'> --%>
	<%-- <Input type='hidden' name='sig_sta' value='${thispro.sig_sta}'> --%>
	<%-- <Input type='hidden' name='sig_sug' value='${thispro.sig_sug}'> --%>
	<%-- <Input type='hidden' name='sig_rank' value='${thispro.sig_rank}'> --%>
	<!-- 簽核意見:<p><textarea rows="5" cols="50"  name="SignSug"> -->
	<%-- </textarea><font color="red">${error.plz}</font><p> --%>
	<%-- <Input type='submit' name='send' value='${sendsubmit1}'> --%>
	<%-- <Input type='submit' name='send' value='${sendsubmit2}'> --%>
	<!-- </form> -->
	<%-- </c:if> --%>










	<%-- <c:if test="${not empty nothispro}"> --%>
	<!-- <p>退回中採購單<p> -->
	<%-- <p><font color='red'>${user.emp_name} 修改中</font><p> --%>
	<%-- <p>職稱: ${user.emp_dep} ${user.emp_job}</p> --%>

	<%-- <p>退回人: ${nobeforepro.employeeBean.emp_name}</p> --%>
	<%-- <p>職稱: ${nobeforepro.employeeBean.emp_dep} ${nobeforepro.employeeBean.emp_job}</p> --%>
	<%-- <p>退回時間: ${nobeforepro.sig_date}</p> --%>
	<%-- <p>退回意見: ${nobeforepro.sig_sug}</p> --%>

	<%-- <p>採購單申請人: ${pomainlist.employeeBean.emp_name}</p> --%>
	<%-- <p>採購預估總價格: ${pomainlist.total_price}</p> --%>
	<%-- <p>採購廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p> --%>
	<%-- <c:forEach var='posign' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posign.sig_rank==3}"> --%>
	<%-- <p>詢價建議: ${posign.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>
	<!-- <h2>採購單明細</h2> -->
	<%-- <c:forEach var='podetail' varStatus='vs' items='${podetail}'> --%>
	<%-- <p>料號: ${podetail.part_No} </p> --%>
	<%-- <p>物料名稱: ${podetail.productListBean.pro_name} </p> --%>
	<%-- <p>物料市場價格: ${podetail.market_Price} </p> --%>
	<%-- <p>物料採購價格: ${podetail.total_Price} </p> --%>
	<%-- <p>物料請購數量: ${podetail.total_Qty} </p> --%>
	<%-- <p>物料採購數量: ${podetail.quotation} </p> --%>
	<%-- <p>該項採購總金額: ${podetail.quotation*podetail.total_Price} 元整 </p> --%>
	<%-- </c:forEach> --%>

	<%-- <p>選擇廠商: ${pomainlist.pO_Vendor_InfoBean.vendor_name}</p> --%>
	<!-- <h2>詢價紀錄</h2> -->
	<%-- <c:forEach var='poquerys' varStatus='vs' items='${poquery}'> --%>
	<%-- <p>廠商名稱: ${poquerys.pO_Vendor_InfoBean.vendor_name} </p> --%>
	<%-- <p>詢價時間: ${poquerys.po_querydate} </p> --%>
	<%-- <p>詢價總價: ${poquerys.po_totalprice} </p> --%>
	<%-- </c:forEach> --%>

	<!-- <h2>簽核順序</h2> -->
	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==3}"> --%>
	<!-- <h3>第1步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>
	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==4}"> --%>
	<!-- <h3>第2步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <c:if test="${not empty posignpro.sig_date}"> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>
	<%-- <c:forEach var='posignpro' varStatus='vs' items='${posignprocess}'> --%>
	<%-- <c:if test="${posignpro.sig_rank==5}"> --%>
	<%-- <c:if test="${posignpro.sig_sta=='未簽核' or posignpro.sig_sta=='簽核中'}"> --%>
	<!-- <h3>第3步:</h3> -->
	<%-- <p>${posignpro.employeeBean.emp_name} ${posignpro.sig_sta}</p> --%>
	<%-- <p>職稱: ${posignpro.employeeBean.emp_dep} ${posignpro.employeeBean.emp_job}</p> --%>
	<%-- <c:if test="${not empty posignpro.sig_date}"> --%>
	<%-- <p>簽核時間: ${posignpro.sig_date} </p> --%>
	<%-- <p>簽核建議: ${posignpro.sig_sug} </p> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:if> --%>
	<%-- </c:forEach> --%>

	<%-- <form action="<c:url value="/Po/POManagerSignertosigndetail.controller" />" method="post"> --%>
	<%-- <Input type='hidden' name='po_manger' value='${nothispro.po_manger}'> --%>
	<%-- <Input type='hidden' name='po_sta' value='${nothispro.po_sta}'> --%>
	<%-- <Input type='hidden' name='po_id' value='${nothispro.po_id}'> --%>
	<%-- <Input type='hidden' name='sig_date' value='${nothispro.sig_date}'> --%>
	<%-- <Input type='hidden' name='sig_sta' value='${nothispro.sig_sta}'> --%>
	<%-- <Input type='hidden' name='sig_sug' value='${nothispro.sig_sug}'> --%>
	<%-- <Input type='hidden' name='sig_rank' value='${nothispro.sig_rank}'> --%>
	<!-- 簽核意見:<p><textarea rows="5" cols="50"  name="SignSug"> -->
	<%-- </textarea><font color="red">${error.plz}</font><p> --%>
	<%-- <Input type='submit' name='send' value='${sendsubmit1}'> --%>
	<%-- <Input type='submit' name='send' value='${sendsubmit2}'> --%>
	<!-- </form> -->
	<%-- </c:if> --%>


</body>
</html>