<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value="/Po/checkvendorandpodetail.controller" />" method="post">
<p>選擇廠商<p>
		<select name="AllPO_Vendors">
		<c:forEach var="AllPO_Vendorsr" items="${AllPO_Vendor}">
		   <option value='${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_id}'>廠商名稱: ${AllPO_Vendorsr.pO_Vendor_InfoBean.vendor_name} 
		    總報價 : 	${AllPO_Vendorsr.po_totalprice}	元整   
		    </option>
		</c:forEach>	 	
		</select>
<p>報價確認</p>	
<p>採購單單號: ${poprocess1.pO_MainBean.po_id} </p>
<c:forEach var="thispo_detailBean" items="${poprocess1.pO_MainBean.pO_DetailBean}">
		  <p>料號: ${thispo_detailBean.part_No}<p>
		  <p>預估價格: ${thispo_detailBean.market_Price}<p>
		  <p>請購數量: ${thispo_detailBean.total_Qty}<p>
		  <Input type='hidden' name='po_id' value='${thispo_detailBean.po_id}'>
		  <Input type='hidden' name='part_No' value='${thispo_detailBean.part_No}'>
		  <Input type='hidden' name='market_Price' value='${thispo_detailBean.market_Price}'>
		<p> 採購實際數量:<Input type='text' name='quotation' value='${param.quotation}'></p>${errors.number}
		<p> 請購實際金額: <Input type='text' name='total_Price' value='${param.total_Price}'></p>${errors.number}
		  <Input type='hidden' name='total_Qty' value='${thispo_detailBean.total_Qty}'>
</c:forEach>
            <Input type='hidden' name='posta1' value='${poprocess1.po_sta}'>
             <Input type='hidden' name='poid1' value='${poprocess1.po_id}'>	 
		   <Input type='submit' name='send' value='產生詢價單'>
		   
</form>	
</body>
</html>