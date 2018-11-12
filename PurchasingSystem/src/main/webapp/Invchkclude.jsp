<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>驗收系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
	margin: 30px;
}

.left {
	width: 15%;
	float: left;
	text-align: center;
}

.f {
	/* 方格排列 */
 	display: inline-block;
	width: 200px;
	height:50px;
	margin-bottom:5px;
}

.imgp {
	padding: 0px;
	font-size: 11px;
}

.card-text {
	font-size: 11px;
}
</style>
</head>
<body class="bg">
<h3><font face="微軟正黑體">驗收系統</font></h3>
    <div class="text-right"><font face="微軟正黑體">
		 ${user.emp_id}/${user.emp_name}/${user.emp_job} </font><a
		  href='InvLogout.controller'><button type="button" class="btn">登出</button></a>
    </div>

    <input type="text" placeholder="search" id="search">
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

    <div class="left">		
		<br><span>${sendok}</span>
		<hr>
		<c:if test="${user.emp_level==1 }">
		<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='selectInvchk.controller' class="btn" style="height:2em"><img
					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">待驗收清單</a>		
			</div>
		<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='' class="btn" style="height:2em"><img
					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">驗收成功清單</a>			
			</div>
		<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='chkprofail.controller' class="btn" style="height:2em"><img
					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">驗收失敗清單</a>			
		</div>
		</c:if>
		<c:if test="${user.emp_level==2 }">
		<div class="card bg-light f" style="font-family:微軟正黑體;">
				<a href='sendEmployee.controller' class="btn" style="height:2em"><img
					class="card-img-top imgp" src="../sysimg/s1.png" style="height:35px; width:30px; float:left">待分派清單</a>
		</div>
		</c:if>
		</div>
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