<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢請款單</title>
</head>
<body>

<c:if test="${not empty invoiceData}">
		<h2>請款單明細</h2>
		<table>
			<tr>
				<th>申請人</th>
				<th>所屬部門</th>
				<th>請款金額</th>
				<th>付款方式</th>
				<th>憑證日期</th>
				<th>憑證圖檔</th>
			</tr>
				<tr>
					<td>${invoiceData.employeeBean.emp_name}</td>
					<td>${invoiceData.employeeBean.emp_dep}</td>
					<td>$${invoiceData.total_price}</td>
					<td>${invoiceData.pO_MainBean.pO_Vendor_InfoBean.payment_method}</td>
					<td>${invoiceData.recript_date}</td>
					<td><img src="..${invoiceData.recript_pic}" alt="" height="200" width="200"></td>
				</tr>
		</table>
	</c:if>

</body>
</html>