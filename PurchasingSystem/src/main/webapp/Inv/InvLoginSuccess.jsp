<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>驗收系統</title>
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
	<h3><font face="微軟正黑體">驗收系統</font></h3>
    <div class="text-right"><font face="微軟正黑體">
		 ${user.emp_dep},${user.emp_name},${user.emp_job} </font><a
		  href='InvLogout.controller'><button type="button" class="btn btn-sm">登出</button></a>
		<hr>
    </div>
    </nav>
    <div class="text-center">		
		<br><span>${sendok}</span>
		<c:if test="${user.emp_level==1 }">
		<div class="card bg-light f">
				<a href='selectInvchk.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s1.png"></a>
				<div class="card-body">
					<h5 class="card-title">待驗收清單<font color=red>${waitendsign}</font></h5>
				</div>
			</div>
		<div class="card bg-light f">
				<a href='CheckBean' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s20.png"></a>
				<div class="card-body">
					<h5 class="card-title">驗收成功清單<font color=red>${waitendsign4}</font></h5>
				</div>
			</div>
		<div class="card bg-light f">
				<a href='chkprofail.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s15.png"></a>
				<div class="card-body">
					<h5 class="card-title">驗收失敗清單<font color=red>${waitendsign1}</font></h5>
				</div>
		</div>

		</c:if>
		<c:if test="${user.emp_level==2 }">
		<div class="card bg-light f">
				<a href='sendEmployee.controller' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s1.png"></a>
				<div class="card-body">
					<h5 class="card-title">待分派清單<font color=red>${waitendsign3}</font></h5>
				</div>
		</div>
								<div class="card bg-light f">
				<a href='singcheck' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s14.png"></a>

				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">查詢驗收單狀態</font></h5>
				</div>
		</div>
		</c:if>
						<div class="card bg-light f">
				<a href='item?pageNo=1' class="btn"><img
					class="card-img-top imgp" src="../sysimg/s19.png"></a>

				<div class="card-body">
					<h5 class="card-title"><font face="微軟正黑體">查詢庫存</font></h5>
				</div>
		</div>
		</div>
		  
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>

</body>
</html>