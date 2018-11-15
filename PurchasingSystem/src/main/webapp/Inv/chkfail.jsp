<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ include file="../Invchkclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>重新驗收</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	<input class="form-control" type="text" placeholder="search" id="search">
	<style id="search_style"></style>
	<script type="text/javascript">
var searchStyle = document.getElementById('search_style');
document.getElementById('search').addEventListener('input', function() {
  if (!this.value) {
    searchStyle.innerHTML = "";
    return;
  }
  // look ma, no indexOf!
  searchStyle.innerHTML = ".searchable:not([data-index*=\"" + this.value.toUpperCase() + "\"]) { display: none; }";
  // beware of css injections!
});
</script>
<c:if test="${not empty selsctlists }">
<table class="table table-striped table-hover" id="table">
	<thead >
				<tr>
					<th >失敗驗收單編號</th>
					<th >驗收人員</th>
					<th >驗收時間</th>
				</tr>
			</thead>
	<c:forEach var="poprocess" items="${selsctlists}">
	<c:if test="${poprocess.sig_Rank==3}">
	<tr class="searchable" data-index=" ${poprocess.chk_Id} ${poprocess.employeeBean.emp_name} ${poprocess.sig_Date}">
	<td> ${poprocess.chk_Id}</td>
	<td> ${poprocess.employeeBean.emp_name}</td>
	<td> ${poprocess.sig_Date}</td>
    <c:forEach var="poprocess1" items="${selsctlists}">
    <c:if test="${poprocess1.sig_Rank==2 and poprocess1.chk_Id == poprocess.chk_Id}">
    <td><a href='<c:url value="/Inv/sendthisselectinvprolist.controller?inv_manger=${poprocess1.inv_Manger}&inv_sta=${poprocess1.inv_Sta}&chk_id=${poprocess1.chk_Id}&inv_Sta=${poprocess1.inv_Sta }" />'>
        重新驗收</a></td>        
    </c:if>
	</c:forEach>
	</c:if>
    </c:forEach>
	</table>	
</c:if>
	<c:if test="${not empty noselectlists }">
		<h2>${noselectlists}</h2>
	</c:if>
	</div>	
	
<script src="../js/app.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	
</body>
</html>