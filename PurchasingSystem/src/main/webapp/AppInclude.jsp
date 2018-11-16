<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<title>請購系統</title>
<style>
.bg {
	background-color: #FDF5E6;
	/* 畫面間距 */
/* 	margin: 30px; */
	font-family: "微軟正黑體";

}

.left {
	width: 15%;
	float: left;
	text-align: center;
	height: 1500px;
}

.f {
	/* 方格排列 */
 	display: inline-block;
	width: 200px;
	height:50px;
	margin-bottom:5px;
}

.imgp {
/* 	padding: 0px; */
/* 	font-size: 11px; */
/* 	margin-right:10px; */
	float:left;
	height:35px;
	width:30px;
}

.card-text {
	font-size: 11px;
}

ul {
	font-family:微軟正黑體;
	font-size: 19px;
}
span {
	margin-left:1px;
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
	<c:if test="${user.emp_level<=2}">
	<h1><font face="微軟正黑體">請購系統</font></h1>
	<a href="ApplyLoginSuccess.jsp" style="font-family:微軟正黑體;font-size: 15px;">回首頁</a>
	<div class="text-right" style="font-family:微軟正黑體;font-size: 15px;">
		${user.emp_dep}${user.emp_name} ${user.emp_job},你好<a
			href='ApplyLogout.controller'><button type="button" class="btn" style="font-family:微軟正黑體;font-size: 15px;">
			登出</button></a>
	</div>
	<hr>
	</c:if>
		<c:if test="${user.emp_level==3}">
	<h1><font face="微軟正黑體">總經理</font></h1>
	<a href="CeoPage.jsp" style="font-family:微軟正黑體;font-size: 15px;">回首頁</a>
	<div class="text-right" style="font-family:微軟正黑體;font-size: 15px;">
		${user.emp_dep}${user.emp_name} ${user.emp_job},你好<a
			href='ApplyLogout.controller'><button type="button" class="btn" style="font-family:微軟正黑體;font-size: 15px;">
			登出</button></a>
	</div>
	<hr>
	</c:if>
	</nav>
	<div class="left">
<%-- 		<br> <span>${sendok}</span> --%>

		<c:if test="${user.emp_level==1}">
		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link active" href="ApplySend.jsp">
                <img class="card-img-top imgp" src="../sysimg/a1.png">
                  <span data-feather="home"></span>
                  	請購申請 <span class="sr-only"></span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplyWaitEndList.html">
                <img class="card-img-top imgp" src="../sysimg/s1.png">
                  <span data-feather="users"></span>
                  	驗收完成待結案<font color=red>${waitendsign}</font>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/selectAll.html">
                <img class="card-img-top imgp" src="../sysimg/a3.png">
                  <span data-feather="file"></span>
                  	物料更新
                </a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplySearchEndList.html">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="shopping-cart"></span>
                  	已結案單子查詢
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="toApplySignnerdetail.controller">
                <img class="card-img-top imgp" src="../sysimg/a2.png">
                  <span data-feather="layers"></span>
                  	待簽核請購單 <font color=red>${SignAppList}</font>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="toApplySignpro.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="bar-chart-2"></span>
                 	 請購進度查詢 <font color=red>${Appnow}</font>
                </a>
              </li>
            </ul>
		</c:if>
	
		<c:if test="${user.emp_level==2}">
			<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/selectAll.html">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="file"></span>
                  	物料更新
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/ApplySearchEndList.html">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="shopping-cart"></span>
                  	已結案單子查詢
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="toApplySignnerdetail.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="layers"></span>
                  	待簽核請購單 <font color=red>${SignAppList}</font>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="toApplySignpro.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="bar-chart-2"></span>
                 	 請購進度查詢 <font color=red>${Appnow}</font>
                </a>
              </li>
            </ul>
		</c:if>
		<c:if test="${user.emp_level==3}">
		<ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link" href="toApplySignnerdetail.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="layers"></span>
                  	待簽核請購單 <font color=red>${SignAppList}</font>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="toApplySignpro.controller">
                <img class="card-img-top imgp" src="../sysimg/s6.png">
                  <span data-feather="bar-chart-2"></span>
                 	 請購進度查詢 <font color=red>${Appnow}</font>
                </a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="ceoPOManagerSigner.controller">
                <img class="card-img-top imgp" src="../sysimg/s2.png">
                  <span data-feather="bar-chart-2"></span>
                 	 待審核採購單 <font color=red></font>
                </a>
              </li>
            </ul>
				
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