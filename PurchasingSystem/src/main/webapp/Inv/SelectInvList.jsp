<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>        
<%@ include file="../Invchkclude.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	$.ajax({
		url:"LoginSucessSelectInvcSignList.do",
		type:"GET",
		success:function(data){
	      if(document.URL.indexOf("#")==-1){
	    	  url = document.URL+"#";
	    	  location = "#";
	    	  location.reload(true);
	      }	
		}
	});
});		

</script>
<title>待驗收表單頁面</title>
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
/* 	margin: 30px; */
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
<c:set var='chkprosta' value="驗收作業進行中"/>
<c:if test="${not empty selsctlists || selectlistnofinish.sig_Sta==chkprosta}">
	 
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
	
	<table class="table table-striped table-hover" id="table">


           <thead >

				
<!-- 				<tr> -->
<!-- 					<th><input  class="form-control" id="myInput" type="text" -->
<!-- 						placeholder="Search"><br /></th> -->
<!-- 				<style id="m-search"></style> -->
<!-- 				</tr> -->
				<tr>
					<th >驗收單編號</th>
					<th >分派主管</th>
					<th >主管分派時間</th>
				</tr>
			</thead>
	<tbody >
	
	
   
	<c:forEach var="poprocess" items="${selsctlists}">
	<c:if test="${poprocess.sig_Rank==2}">
	<tr class="searchable" data-index="${poprocess.chk_Id}${poprocess.employeeBean.emp_name}${poprocess.sig_Date}">
	<td width="200"> ${poprocess.chk_Id}</td>
	<td> ${poprocess.employeeBean.emp_name}</td>
	<td> 
	<fmt:formatDate pattern="yyyy/MM/dd hh:mm"  value="${poprocess.sig_Date}"/>
	</td>
    <c:forEach var="poprocess1" items="${selsctlists}">
    <form
    action="<c:url value="/Inv/sendthisselectinvprolist.controller?inv_manger=${poprocess1.inv_Manger}&inv_sta=${poprocess1.inv_Sta}&chk_id=${poprocess1.chk_Id}&inv_Sta=${poprocess1.sig_Sug }" />"
	method="post">
    <c:if test="${poprocess1.sig_Rank==3 and poprocess1.chk_Id == poprocess.chk_Id}">
    <td ><input style="right: auto;" id="submit" type="submit" name="send"
	value="開始驗收"></td>       
    </c:if>
    </form>
	</c:forEach>
	</tr>
	</c:if>
    </c:forEach>
    </tbody>
    </table>
	</div>
	</c:if>
	<c:if test="${not empty noselectlists}">
	<h2>${noselectlists}</h2>
	</c:if>
	
	
</body>
</html>