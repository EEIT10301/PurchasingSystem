<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>廠商更新</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <!-- <link rel="stylesheet" type="text/css" href="../css/POcss.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" -->
<!-- 	crossorigin="anonymous"> -->

<!-- <script type="text/javascript" -->
<!-- 	src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- </head> -->
   <%@ include file="../POIncludeforAcc.jsp"%>     
<body class="bg">
<div class="right">
<!-- <div class='container'> -->
	<h3 align="center">廠商更新</h3><br/>
<input class="form-control" id="myInput" type="text" placeholder="Search"><br/>
<table class="table table-striped table-hover">
<thead>
<tr>
<th>廠商ID</th>
<th>廠商名稱</th>
<th>聯絡窗口</th>
<th>付款帳號</th>
<th >結帳週期</th>
<th>付款方式</th>
<th>聯絡人e-mail</th>
<th></th>
</tr>
</thead>
<tbody id="selectAll">
</tbody>
</table>
<!-- </div> -->
<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	var row = 6;
		$.ajax({
			url:"POAddVendorSelectAll.do",
			type:"GET",
			async:false,
			success:function(data){
				var txt = ""
					txt += "<tr >";
					txt += "<td id='id' ><input style='width:50px' type='text' /></td>";
					txt += "<td  id='name'><input style='width:200px' type='text'/></td>";
					txt += "<td  id='person'><input style='width:50px' type='text'/></td>";
					txt += "<td  id='acc'><input style='width:50px' type='text'/></td>";
					txt += "<td  id='term' ><input style='width:50px' type='text'/></td>";
					txt += "<td  id='method' ><input style='width:50px' type='text'/></td>";
					txt += "<td  id='email' ><input style='width:150px'   type='text'  value=''/></td>";
					txt +="<td><input type='button' id='insert' class='btn btn-white btn-sm' value='新增'/>";
					txt +="&nbsp;&nbsp;&nbsp;";
					txt +="<input type='hidden' id='search' class='btn btn-white btn-sm' value='查詢'/></td>";
					txt += "</tr>"
				$.each(data.myArrayList,function(index,json){
					txt += "<tr >";
					txt += "<td id='id'>"+json.map.vendor_id+"</td>"
					txt += "<td id='name'>"+json.map.vendor_name+"</td>"
					txt += "<td id='person'>"+json.map.vendor_contact_person+"</td>"
					txt += "<td id='acc'>"+json.map.vendor_acc+"</td>"
					txt += "<td id='term'>"+json.map.payment_term+"</td>"
					txt += "<td id='method'>"+json.map.payment_method+"</td>"
					txt += "<td id='email'>"+json.map.vendor_email+"</td>"
					txt +="<td><input type='button' id='edit' class='btn btn-white btn-sm' value='修改'/>";
					txt +="&nbsp;&nbsp;&nbsp;";
					txt +="<input type='hidden' id='search' class='btn btn-white' value='查詢'/></td>";
					txt += "</tr>"

				})
				$("#selectAll").html(txt);	
			}
		});
$("tbody").on("click","#insert",function(){		
			var dataJSON ="";
			dataJSON +="";
			for(i=0; i<=row; i++){
				if(i==(row)){
					dataJSON += '\"'+($(this).parent().siblings("td:eq("+i+")").attr("id"))+'\":\"'
									+($(this).parent().siblings("td:eq("+i+")").children().val())+'\"';
				}else{
					dataJSON += '\"'+($(this).parent().siblings("td:eq("+i+")").attr("id"))+'\":\"'
									+($(this).parent().siblings("td:eq("+i+")").children().val())+'\",';	
				}
			}
			//alert(dataJSON);
			
			$.ajax({
				url : "http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/PO/POAddVendorinsertproduct.do",
				type : 'POST',
				data : "{"+dataJSON+"}",
				contentType:"application/json",
				success : function(response) {
					//alert(response);
					var items = JSON.parse(response);
					alert("新增成功");
					window.location.reload();
				}
			});
		});
$("tbody").on("click","#delete",function(){		
	var finId = $(this).parent().siblings("td:eq(0)").text();
	var dataJSON ="";
	dataJSON += '\"'+($(this).parent().siblings("td:eq(0)").attr("id"))+'\":\"'
	+($(this).parent().siblings("td:eq(0)").text())+'\",';
	//alert(dataJSON);
	
	$.ajax({
		url : "http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/Apply/deletehproduct.do",
		type : 'POST',
		data : "{"+dataJSON+"}",
		contentType:"application/json",
		success : function(response) {
			//alert(response);
			var items = JSON.parse(response);
			alert(items.deletes);
			window.location.reload();
		}
	});
});		
$("tbody").on("click","#edit",function(){
	$(this).parent().siblings("td:gt(1)").empty().append("<input type='text'/>");//全部清空變成input
	//$(this)是#edit
	//用#edit去更改除了自己以外的欄位,#edit的parent是一個td,這個td的siblings是td
	var index = $(this).parent().siblings("td:first").text();//之後cancel放回原先值會用到
//	alert(index);
	$(this).parent().empty().append(
			"<input type='button' id='update' class='btn btn-white btn-sm' value='update'/>&nbsp;&nbsp;&nbsp;"+
			"<input type='button' id='cancel' name='"+index+"' class='btn btn-white btn-sm' value='cancel'/>");
});		

$("tbody").on("click","#cancel",function(){

	window.location.reload();
});
$("tbody").on("click","#update",function(){	
	var dataJSON ="";
	dataJSON += '\"'+($(this).parent().siblings("td:eq(0)").attr("id"))+'\":\"'
					+($(this).parent().siblings("td:eq(0)").text())+'\",';
	for(i=1; i<=row; i++){
		if(i==(row)){
			dataJSON += '\"'+($(this).parent().siblings("td:eq("+i+")").attr("id"))+'\":\"'
							+($(this).parent().siblings("td:eq("+i+")").children().val())+'\"';
		}else{
			dataJSON += '\"'+($(this).parent().siblings("td:eq("+i+")").attr("id"))+'\":\"'
							+($(this).parent().siblings("td:eq("+i+")").children().val())+'\",';	
		}
	}
	//alert(dataJSON);

	$.ajax({
		url : "http://eeitdemo10332.southeastasia.cloudapp.azure.com:8080/PurchasingSystem/PO/POAddVendorupdate.do",
		type : 'POST',
		data : "{"+dataJSON+"}",
		contentType:"application/json",
		success : function(response) {
			alert("更新成功");
			window.location.reload();
			
		}
	});
});

$("#myInput").on("keyup", function() {
			   var value = $(this).val().toLowerCase();
			    $("#selectAll tr").filter(function() {
			      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			   });
			});		
				
	});

</script>
</div>
</body>
</html>