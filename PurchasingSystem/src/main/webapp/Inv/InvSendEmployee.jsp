<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分派</title>
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
}

</style>
</head>
<body class="bg">
<div class="right">
	<c:if test="${not empty sendlist }">
	<table id="myTable" class="table table-striped table-hover" >
			<thead>
			<tr>
			<th>驗收單單號:</th>
			<th>產生時間:</th>
			</tr>
			<thead>
		<c:forEach var="sendl" items="${sendlist}">
			<c:if test="${sendl.sig_Rank==1}">
		<tr>
				<td>${sendl.chk_Id }</td>				
				<td> ${sendl.sig_Date}</td>
		
					<c:forEach var="sendl1" items="${sendlist}">
						<form action="<c:url value="/Inv/InvsendEmployee.controller" />"
							method="post">
							<c:if
								test="${sendl1.chk_Id == sendl.chk_Id and sendl1.sig_Rank ==2}">
								<Input type='hidden' name='inv_Manger'
									value='${sendl1.inv_Manger}'>
								<Input type='hidden' name='inv_Sta' value='${sendl1.inv_Sta}'>
								<Input type='hidden' name='chk_Id' value='${sendl1.chk_Id}'>
								<Input type='hidden' name='sig_Date' value='${sendl1.sig_Date}'>
								<Input type='hidden' name='sig_Sta' value='${sendl1.sig_Sta}'>
								<Input type='hidden' name='sig_Sug' value='${sendl1.sig_Sug}'>
								<Input type='hidden' name='sig_Rank' value='${sendl1.sig_Rank}'>
								<td><Input type='submit' name='send' value='分派'></td>
										</tr>
							</c:if>
						</form>	
					</c:forEach>
			</c:if>
		</c:forEach>
			<tbody id="selectAll">
			</tbody>
		</table>
	</c:if>
	<c:if test="${not empty nosendlist }">
		<h2>${nosendlist}</h2>
	</c:if>
	</div>
</body>
</html>