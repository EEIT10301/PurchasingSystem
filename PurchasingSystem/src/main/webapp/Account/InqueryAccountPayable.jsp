<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢廠商款項</title>
<style>

#xls{
float: right;
margin-right:30px;
}

#pdf{
float: right;
margin-right:30px;
}

td.details-control {
    cursor: pointer;
}

</style>
</head>
<%@ include file="../includeA.jsp" %>
<body class="bg">

	<c:if test="${not empty allPayableList}">
		<div class="right">
	<br>
			<h3>廠商帳款清單</h3>
<!-- 			<input class="form-control" id="myInput" type="text" -->
<!-- 				placeholder="Search"><br /> -->
				<div class="text-right">
				<form action="ShowInvoice.xls" enctype="multipart/form-data"
					method="post" id="xls">
					<input class="btn btn-white btn-sm" type="submit" value="下載Excel檔"></input>
				</form>
				<form action="ShowInvoice.pdf" enctype="multipart/form-data"
					method="post" id="pdf">
				   <input class="btn btn-white btn-sm" type="submit" value="下載Pdf檔"></input>
				</form>
			</div>
			<table id="example" class="table table-striped table-hover">
<!-- 	<table id="example" class="table table-striped table-bordered dataTable no-footer"> -->
				<thead>
					<tr>
						<th>對帳單號</th>
						<th>請款單單號</th>
						<th>廠商名稱</th>
						<th>結帳週期</th>
						<th>應付金額</th>
						<th>帳款日期</th>
						<th>支票號碼</th>
						<th>匯款帳號</th>
						<th>預計付款日</th>
						<th>付款狀況</th>
						<th>實付金額</th>
					</tr>
				</thead>
				<tbody id='myTable'>
					<c:forEach var="row" items="${allPayableList}">
						<tr>
							<td>${row.accoutpayable_no}</td>
							<c:if test="${not empty row.inv_id}">
<%-- 								<td class="details-control"><a href="ShowInvoice.controller?invid=${row.inv_id}">${row.inv_id}</a></td> --%>
								<td class="details-control">${row.inv_id}</td>
							</c:if>
							
							<c:if test="${empty row.inv_id}">
								<td>尚未請款</td>
							</c:if>
							<td>${row.pO_Vendor_InfoBean.vendor_name}</td>
							<td>${row.pO_Vendor_InfoBean.payment_term}</td>
							<td>$${row.amount_Payable}</td>
							<fmt:formatDate pattern="yyyy/MM/dd"
									value="${row.booking_Date}" var="bookingDate"/>
							<td>${bookingDate}</td>
							<td>${row.cheque_no}</td>
							<td>${row.pO_Vendor_InfoBean.vendor_acc}</td>
							<fmt:formatDate pattern="yyyy/MM/dd"
									value="${row.except_Payment_Date}" var="exceptPaymentDate"/>
							<td>${exceptPaymentDate}</td>
							<td>${row.payable_Status}</td>
							<td>$${row.amount_Paid}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</c:if>
<!-- 	<script src="../js/app.js"></script> -->
<script>
$(document).ready(function () {
    
  function format(count) {
      // `d` is the original data object for the row 
      var arr=new Array();
      <c:forEach var="row" items="${allPayableList}" varStatus="yourStatus">
      arr[${yourStatus.index}] = new Array();  
      arr[${yourStatus.index}][1] = "${row.account_InvoiceBean.employeeBean.emp_name}";  
      arr[${yourStatus.index}][2] = "${row.account_InvoiceBean.employeeBean.emp_dep}";  
      arr[${yourStatus.index}][3] = "${row.account_InvoiceBean.total_price}";    
      arr[${yourStatus.index}][4] = "${row.account_InvoiceBean.pO_MainBean.pO_Vendor_InfoBean.payment_method}"; 
      <fmt:formatDate value="${row.account_InvoiceBean.recript_date}" pattern="yyyy/MM/dd" var="date" />
      arr[${yourStatus.index}][5] = "${date}";    
      arr[${yourStatus.index}][6] = "${row.account_InvoiceBean.recript_pic}"; 
      <c:set var="recriptpic" value="${row.account_InvoiceBean.recript_pic}" />
      <c:set var="picName" value="${fn:substring(recriptpic,8,30)}" />
      arr[${yourStatus.index}][7] = "${picName}";     
      </c:forEach>
      
      return '<table class="table table-striped table-hover dataTable">' +
          '<tr>' +
          '<td>申請人:</td>' +
          '<td>所屬部門:</td>' +
          '<td>請款金額:</td>' +
          '<td>付款方式:</td>' +
          '<td>憑證日期:</td>' +
          '<td>憑證圖檔:</td>' +
          '</tr>' +
          '<tr>' +
          '<td>' + arr[count][1] + '</td>' +
          '<td>' + arr[count][2] + '</td>' +
          '<td>' + arr[count][3] + '</td>' +
          '<td>' + arr[count][4] + '</td>' +
          '<td>' + arr[count][5] + '</td>' +
          '<td>' + '<a href="..' + arr[count][6] + '"target=" _blank">' + arr[count][7] + '</a>' + '</td>' +
          '</tr>' +
          '</table>';
  }
  /* Formatting function for row details - modify as you need */
  var table = $('#example').DataTable({
          "iDisplayLength": 10,
          "pagingType":"simple_numbers",
          "order": [[1, 'asc']],
          "Language": {
              "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Chinese-traditional.json"
          }
      });
 
  // Add event listener for opening and closing details
  $('#example tbody').on('click', 'td.details-control', function () {
      var tr = $(this).closest('tr');
      var row = table.row(tr);
      var count=row.index();

      if (row.child.isShown()) {
          // This row is already open - close it
          row.child.hide();
          tr.removeClass('shown');
      }
      else {
          // Open this row
          row.child(format(count)).show();
          tr.addClass('shown');
      }
  });
});

</script>
</body>
</html>