<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<title>Insert title here</title>


</head>
	<%@ include file="../includeA.jsp" %>
<body class="bg">
<div class="right">
	<h3>查詢請款單狀態</h3>
	<a href="../Po/queryStatus.controller" class="btn btn-info">查詢所有請款單</a>
	<a href="../Po/queryStatusUndone.controller" class="btn btn-info">查詢未完成請款單</a>
	<a href="../Po/queryStatusDone.controller" class="btn btn-info">查詢已完成請款單</a>
<br>
	<h2>請款單單號:${bean.inv_id}</h2>
<table class="table table-striped table-hover">
 <thead >
<tr>
	<th scope="col">流程順序</th>
	<th scope="col">流程</th>
	<th scope="col">承辦人</th>
	<th scope="col">簽核意見</th>
	<th scope="col">流程狀態</th>
	<th scope="col">簽核時間</th>	
</tr>
</thead>
<tbody>
<c:forEach var="statusone" items="${stat}">
<tr>
	<td>${statusone.sig_Rank}</td>
	<td>${statusone.account_Sta}</td>
	<td>${statusone.employeeBean.emp_name}</td>
	<td>${statusone.sig_Sug}</td>
	<td>${statusone.sig_Sta}</td>
	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${statusone.sig_Date}"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

</body>
</html>