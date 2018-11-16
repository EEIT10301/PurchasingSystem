<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>總經理登入畫面</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	var row = 5;
		$.ajax({
			url:"LoginSucessSelectAppSignList.do",
			type:"GET",
			success:function(data){
		      if(document.URL.indexOf("#")==-1){
		    	  url = document.URL+"#";
		    	  location = "#";
		    	  location.reload(true);
		      }	
			}
		});
$("#myInput").on("keyup", function() {
			   var value = $(this).val().toLowerCase();
			    $("#selectAll tr").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			   });
			});		
				
	});

</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
		font-family: "微軟正黑體";

}

.f {
	/* 方格排列 */
	display: inline-block;
	width: 13rem;
	height: 14rem;
}

.imgp {
	padding: 10px;
}
nav{
background-color: rgb(248, 219, 166);
padding-top:30px;
padding-left:30px;
padding-right:30px;
}
</style>
</head>
<body class="bg">
<nav><h3>總經理</h3>
     
	<div class="text-right">
		${user.emp_id}/${user.emp_name} ${user.emp_job},你好 <a
			href='ApplyLogout.controller'><button type="button" class="btn">登出</button></a>
		<hr>
	</div></nav>
		<div class="text-center">
		<br> 
		 	<div class="card bg-light f">
				<a href='toApplySignnerdetail.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title">待簽核請購單<font color=red> ${SignAppList}</font> </h5>
				</div>
			</div>
			<div class="card bg-light f">
			<a href='ceoPOManagerSigner.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s1.png"></a>
				<div class="card-body">
					<h5 class="card-title">待審核採購單 <font color=red>${SignPoList}</font> </h5>
				</div>
			</div>
        	<div class="card bg-light f">
			<a href='toApplySignpro.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title">請購進度查詢 <font color=red>${Appnow}</font></h5>
				</div>
			</div>					
		</div>
	 
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
</body>
</html>