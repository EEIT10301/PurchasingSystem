<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../AppInclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>請購清單</title>

<c:if test="${cartnumber<=0}">
	<%
		request.setAttribute("cate", "尚無加入請購產品");
			request.getRequestDispatcher("/Apply/ApplySend.jsp").forward(request, response);
	%>
</c:if>
<c:if test="${empty cartnumber}">
	<%
		request.setAttribute("cate", "尚無加入請購產品");
			request.getRequestDispatcher("/Apply/ApplySend.jsp").forward(request, response);
	%>
</c:if>
<style type="text/css">
#thead{
font-size: 36px;
}

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
</style>
</head>
<body>
<h4 align="center">請購清單</h4>
	<h4 align="center">${cate}</h4>
	<h4 align="center">${errors.cate}</h4>
	<div class="right">
 <table class="table table-striped table-hover" id='myTable'>
               <thead>
			     <tr>
				<th>料號</th>
				<th>產品名稱</th>
				<th>產品大項</th>
				<th>規格簡述</th>
				<th>規格詳述</th>
				<th>平均購買價格</th>
				<th>請購數量</th>
                 <th>該筆總金額</th>
			     </tr>
			    </thead>
               <tbody >
		<c:forEach var="pro" items="${cart}">
		 <c:if test="${pro.pro_amount>0}">
		            <form action="<c:url value="/Apply/ApplyListsend.controller" />" method="post">
		             <tr>	 
                    <td>${pro.part_no}</td>
                    <td>${pro.pro_name}</td>
					<td>${pro.pro_cate}</td>
					<td>${pro.pro_spe}</td>
					<td>${pro.pro_intro}</td>
					<td>${pro.pro_price}</td>
	                <td><input type="text" name="pro_amount" value="${pro.pro_amount}"></td>
					<td> ${pro.pro_amount*pro.pro_price} 元整</td>
					<td><Input type='hidden' name=part_no value='${pro.part_no}'>
					<Input type='hidden' name='pro_cate' value='${pro.pro_cate}'>
					<Input type='hidden' name='pro_name' value='${pro.pro_name}'>
					<Input type='hidden' name='pro_spe' value='${pro.pro_spe}'>
					<Input type='hidden' name='pro_intro' value='${pro.pro_intro}'>
					<Input type='hidden' name='pro_price' value='${pro.pro_price}'>
					<Input type='hidden' name='pro_amount' value='${pro.pro_amount}'>
					<Input type='hidden' name='pro_img' value='${pro.pro_img}'>
				    <Input type='hidden' name='pro_date' value='${pro.pro_date}'></td>
					<td><Input type='submit' name='send' value='修改數量'> </td>
					<td><Input type='submit' name='send' value='刪除'></td> 
					</tr>
					</form>
			</c:if>
		</c:forEach>	
				</tbody>
					</table>	
				<p>請購總價格:${Listprice} 元整</p>
			
			<form action="<c:url value="/Apply/ApplyListsend.controller" />"
				method="post">
				<p>
					<Input type='hidden' name='Listprice' value='${Listprice}'>
				<P />
				<p>    追交日期:<Input type='date' name='getdate' value=''> <P />
					<div align="center">
				提案內容:
				<p>
					<textarea rows="5" cols="50" name="suggestion">
                </textarea>
				<p>
				
				 <p>簽核順序   1.${user.emp_name}<p>
				 <p> 
				 簽核順序   2.
				<select name="Sign2Employee">
　                                   <option value="${sign2.emp_id}">${sign2.emp_dep}: ${sign2.emp_name}經理</option>
                <option value="emp002">研發部: 丁老闆 經理</option>
　                                  <option value="emp011">研發部: 王憲春 經理</option> 
             </select>
             <p>
             <c:if test="${not empty sign3}">
             <p><font color="red">請購總金額大於100萬需加會總經理簽核</font></p>
             <p>
                    簽核順序   3. ${sign3.emp_name} 總經理
             <p> 
             </c:if>
				<p>
					<Input id='send1' type='submit' name='send' value='產生請購單'> <Input
					id='send2'	type='submit' name='send' value='刪除此次請購'>
			</div>
						
			</form>
			</div>
<script src="../js/applysign.js"></script>			
</body>
</html>