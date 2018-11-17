<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>請購主頁</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
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

.btn:link,
.btn:visited {
  	text-transform: uppercase;
  	text-decoration: none;
  	padding: 10px 20px;
  	display: inline-block;
  	border-radius: 100px;
  	transition: all .2s;
  	position: relative;
}

.btn:hover {
  	transform: translateY(-3px);
  	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
}

.btn:active {
  	transform: translateY(-1px);
  	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
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
<nav>
<h2><font face="微軟正黑體">請購系統</font></h2>

	<div class="text-right">
		${user.emp_dep}/${user.emp_name} ${user.emp_job},你好 <a
			href='ApplyLogout.controller'><button type="button" class="btn  btn-sm">登出</button></a>
		<hr>
	</div>
	</nav>
	<div class="text-center">
		<br> 
			<c:if test="${user.emp_level==1}">
	   	<div class="card bg-light f">
				<a href='ApplySend.jsp' class="btn"><img
					class="card-img-top imgp" src="../sysimg/a1.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">請購申請</font></h5>
				</div>
			</div>
			 	<div class="card bg-light f">
				<a href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplyWaitEndList.html' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s1.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">驗收完成待結案</font> <font color=red>${waitendsign}</font></h5>
				</div>
			</div>
	 	<div class="card bg-light f">
				<a href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/selectAll.html' class="btn"><img
					class="card-img-top imgp" src="../sysimg/a3.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">物料更新</font></h5>
				</div>
			</div>
				<br>
		 	<div class="card bg-light f">
				<a href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplySearchEndList.html' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">已結案單子查詢 </font></h5>
				</div>
			</div>
			<div class="card bg-light f">
			<a href='toApplySignnerdetail.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/a2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待簽核請購單</font> <font color=red>${SignAppList}</font> </h5>
				</div>
			</div>
			<div class="card bg-light f">
			<a href='toApplySignpro.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">請購進度查詢</font> <font color=red>${Appnow}</font> </h5>
				</div>
			</div>
			</c:if >
			<c:if test="${user.emp_level==2}">
	 	<div class="card bg-light f">
				<a href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/selectAll.html' class="btn"><img
					class="card-img-top imgp" src="../sysimg/a3.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">物料更新</font></h5>
				</div>
			</div>
		 	<div class="card bg-light f">
				<a href='http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplySearchEndList.html' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">已結案單子查詢</font> </h5>
				</div>
			</div>
			<div class="card bg-light f">
			<a href='toApplySignnerdetail.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/a2.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">待簽核請購單</font> <font color=red>${SignAppList}</font> </h5>
				</div>
			</div>
			<div class="card bg-light f">
			<a href='toApplySignpro.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s6.png"></a>
				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">請購進度查詢</font> <font color=red>${Appnow}</font> </h5>
				</div>
			</div>
			</c:if >
					
		</div>
   
    
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>

</body>
</html>