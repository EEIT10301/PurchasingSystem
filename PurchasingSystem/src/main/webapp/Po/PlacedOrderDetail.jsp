<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ include file="../POInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/POcss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function send() {
	
	 if(confirm("確定送出此單據? "))
	{
		window.event.returnValue=true;
		alert("hahahaha")
		}
		else
		{
		alert("單據送出取消");
		window.event.returnValue=false;
		}
	 
// 	swal("","請款單:"+invid+"新增成功","success").then(function(){
// 		window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp'
// 	});
	
// 	}


// swal({ 
//   title: "确定删除吗？", 
//   text: "你将无法恢复该虚拟文件！", 
//   type: "warning",
//   showCancelButton: true, 
//   confirmButtonColor: "#DD6B55",
//   confirmButtonText: "确定删除！", 
//   cancelButtonText: "取消删除！",
//   closeOnConfirm: false, 
//   closeOnCancel: false	
// },
// function(isConfirm){ 
//   if (isConfirm) { 
//     swal("删除！", "你的虚拟文件已经被删除。",
// "success"); 
//   } else { 
//     swal("取消！", "你的虚拟文件是安全的:)",
// "error"); 
//   } 
// });
}
</script>


<title>待收貨單明細</title>
</head>
<body class="bg">

<div class="right">	
<h2>採購單編號:${pm.po_id}</h2>
<h2>收貨明細</h2>
<form action="<c:url value="/Po/receivedGoods.controller" />" method="post">
	<table id="myTable" class="table table-striped table-hover">
	<thead>
			<tr>
				<th width="800px">料號</th>
				<th width="800px">產品名稱</th>
				<th width="1200px">總數量</th>
			</tr>
	</thead>
	<tbody>
	<c:forEach var='poDetail' items='${poDetail}'>	
	<tr>
		<td>${poDetail.part_No}</td>
		<td>${poDetail.productListBean.pro_name}</td>
		<td>${poDetail.total_Qty}</td>
	</tr>
	</c:forEach>
<%-- 	<c:forEach var='po_Sign' items='${po_Sign}'> --%>
		<tr>
			<td><input type='hidden' name='po_manger' value='${po_Sign.po_manger}'></td>
			<td><input type='hidden' name='po_sta' value='${po_Sign.po_sta}'></td>
			<td><input type='hidden' name='po_id' value='${po_Sign.po_id}'></td>
			<td><input type='hidden' name='sig_date' value='${po_Sign.sig_date}'></td>
			<td><input type='hidden' name='sig_sta' value='${po_Sign.sig_sta}'></td>
			<td><input type='hidden' name='sig_sug' value='${po_Sign.sig_sug}'></td>
			<td><input type='hidden' name='sig_rank' value='${po_Sign.sig_rank}'></td>
		</tr>
		</tbody>
		</table>
		
<%-- 	</c:forEach> --%>
收貨意見:<p><textarea rows="5" cols="50" name="signSug"></textarea></p>

實際收貨時間:<input type="date" name="shippingDate" required>


<input type="submit" name="send" id="send1" class='btn btn-default' value="確認收貨" onclick="send()">
<!-- <button id='' class='btn btn-default' value='' onclick="send()">確認收貨</button> -->
<!-- onclick="send()" -->


</form>
</div>
	


<!-- <!-- <script> --> 
<!-- // function send() { -->
	
<!-- // 	 if(confirm("確定送出此單據? ")) -->
<!-- // 	{ -->
<!-- // 		window.event.returnValue=true; -->
<!-- // 		alert("hahahaha") -->
<!-- // 		} -->
<!-- // 		else -->
<!-- // 		{ -->
<!-- // 		alert("單據送出取消"); -->
<!-- // 		window.event.returnValue=false; -->
<!-- // 		} -->
	
<!-- // 	} -->
		

<!-- // $(document).ready(function(){ -->
<!-- // swal("Hello world!");	 -->

<!-- // swal({ -->
<!-- //   title: "Are you sure?", -->
<!-- //   text: "Once deleted, you will not be able to recover this imaginary file!", -->
<!-- //   icon: "warning", -->
<!-- //   buttons: true, -->
<!-- //   dangerMode: true, -->
<!-- // }) -->
	
<!-- // .then((willDelete) { -->
<!-- //   if (willDelete) { -->
<!-- // 	  window.location.href='http://localhost:8080/PurchasingSystem/Po/POLoginSuccess.jsp' -->
<!-- //     swal("Poof! Your imaginary file has been deleted!",	{ icon:"success"}); -->
<!-- //   } else { -->
<!-- //     swal("Your imaginary file is safe!"); -->
<!-- // 	  window.location.href='http://localhost:8080/PurchasingSystem/Po/PlacedOrderDetail.jsp' -->
<!-- //   } -->
<!-- // }) -->
<!-- // }); -->
<!-- <!-- </script> --> 
<script src="../js/app.js"></script>
</body>
</html>