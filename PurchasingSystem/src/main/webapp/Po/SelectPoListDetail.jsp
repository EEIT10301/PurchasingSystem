<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="Query.jsp" flush="false"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#query{
color: red;
}

#thead{
font-size: 36px;
}

#nolist{
font-size:24px;
color: red;
}

#submitbutton{
display: inline;

}

#doublesubmitbutton{
 position:absolute; 
 right:700px; 
}

</style>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
// $(document).ready(function(){
// 	window.location.reload();
// }) 




window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}
</script>
</head>
<body>


 <h2>${noselist}</h2>
 
 
<c:if test="${not empty query1 or not queryVendor or not empty now}">
<table class="table table-striped table-hover" id="table">
<thead>
<tr>
<th id="thead">最新詢價紀錄</th>
</tr>
<tr >
<th width="250px">採購單編號</th>
<th width="250px">廠商名稱</th>
<th width="250px">詢價時間</th>
<th>詢價總價</th>
</tr>
</thead>
<tbody>
<tr>
<td id="query">${query1.po_ID}</td>
<td>${queryVendor.vendor_name}</td>
<td> ${now}</td>
<td> ${query1.po_totalprice}</td>
</tr>

</tbody>
</table>

</c:if>


<c:if test="${not empty queryss}">
<table class="table table-striped table-hover" id="table">
<thead>
<tr>
<th id="thead">詢價紀錄</th>
</tr>
<tr>
<th width="250px">採購單編號</th>
<th width="250px">廠商名稱</th>
<th width="250px">詢價時間</th>
<th>詢價總價</th>
</tr>
</thead>
<tbody>
<c:forEach var="querysss" items="${queryss}">
<tr>

<td>${querysss.po_ID}</td>
<td>${querysss.pO_Vendor_InfoBean.vendor_name}</td>
<td>${querysss.po_querydate}</td>
<td>${querysss.po_totalprice}</td>


</tr>
</c:forEach>
</tbody>
</table>

</c:if>

<c:if test="${empty queryss and empty query1}">
<table class="table table-striped table-hover" id="table">
<thead>
<tr>
<th id="thead">詢價紀錄</th>
</tr>
<tr>
<th><p id="nolist">尚未詢價紀錄</p></th>

</tr>
</thead>





</table>
</c:if>


<c:if  test="${not empty poprocess1}">
<div id="doublesubmitbutton">
<form id="submitbutton" action="<c:url value="sendsc.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />"
method="post">
<input  type="submit" name="sendFirstsendsc" value="新增詢價紀錄">
</form>

<form id="submitbutton" action="<c:url value="posendlistsign.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />"
method="post">
<input  type="submit" name="sendFirstposendlistsign" value="送出審核">
</form>
</div>
</c:if>



<c:if  test="${not empty poprocess2}">
<div id="doublesubmitbutton">
<form id="submitbutton" action="<c:url value="sendsc.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />"
	method="post">
<input  type="submit" name="sendSecondsendsc" value="新增詢價紀錄">
</form>

<form id="submitbutton" action="<c:url value="posendlistsign.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />"
method="post">
<input  type="submit" name="sendSecondposendlistsign" value="送出審核">
</form>
</div>
</c:if>




<%-- <c:if test="${not empty poprocess1}"> --%>
<%-- <a href='<c:url value="sendsc.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />'> --%>
<!--       新增詢價紀錄</a> -->
<%-- <a href='<c:url value="posendlistsign.controller?po_manger=${poprocess1.po_manger}&po_sta=${poprocess1.po_sta}&po_id=${poprocess1.po_id}" />'> --%>
<!--       送出審核</a>  -->
<%-- </c:if> --%>


<%-- <c:if test="${not empty poprocess2}"> --%>
<%-- <a href='<c:url value="sendsc.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />'> --%>
<!--       新增詢價紀錄</a> -->
<%-- <a href='<c:url value="posendlistsign.controller?po_manger=${poprocess2.po_manger}&po_sta=${poprocess2.po_sta}&po_id=${poprocess2.po_id}" />'> --%>
<!--       送出審核</a>  -->
<%-- </c:if> --%>












</body>
</html>