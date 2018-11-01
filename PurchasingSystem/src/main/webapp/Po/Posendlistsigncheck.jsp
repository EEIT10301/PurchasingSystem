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
  <h2>採購單編號: ${poids}</h2>
  <p>選擇廠商: ${AllPO_Vendors}<p>
<c:forEach var="Podetailbeans1" items="${Podetailbeans}">
<p>料號:${Podetailbeans1.part_No}<p>
<p>請購數量: ${Podetailbeans1.total_Qty}<p>
<p>預估價格: ${Podetailbeans1.market_Price}元<p>
<p>實際採購數量: ${Podetailbeans1.quotation}<p>
<p>實際採購價格: ${Podetailbeans1.total_Price}元<p>
<p>該物料總價格: ${Podetailbeans1.total_Price*Podetailbeans1.quotation}元<p>
</c:forEach>
<p>總採購價格 ${allListprice} 元<p>

</body>
</html>