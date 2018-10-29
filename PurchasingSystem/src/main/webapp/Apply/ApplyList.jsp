<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
body {
	background-repeat: no-repeat;
	background-size: 100%;
	margin: 0;
	padding: 0;
	font-family: '微軟正黑體';
	background-attachment: fixed;
}

#back {
	z-index: -1;
	width: 100%;
	height: 100%;
	position: fixed;
	background-color: rgba(255, 255, 255, 0.5);
}

.topTen {
	height: 70%;
	width: 180px;
	border: 1px solid black;
	position: fixed;
	top: 210px;
	left: 0;
	z-index: 99;
	overflow-y: scroll;
	padding-left: 20px;
}

.prolist {
	display: flex;
	width: 70%;
	margin: 0 auto;
	flex-wrap: wrap;
}

.prolist {
	display: flex;
	margin: 0 auto;
	flex-wrap: wrap;
}

.pro {
	flex: 0 0 33.3;
	margin: 10px;
}

.pro img {
	width: 300px;
	height: 300px;
}

.pro1 {
	flex: 0 0 33.3;
	margin: 10px;
	text-align: center;
}

.pro1 img {
	width: 100px;
	height: 100px;
}

.pro1 text {
	width: 500px;
	heigt: 400px background-color: white;
	font-size: 1.05em;
}

.pro p {
	text-align: center;
}

.pro input {
	width: 150px;
	background-color: white;
	font-size: 1.05em;
}

#history {
	padding-left: 250px;
}
</style>
</head>
<body>
	<h3>${cate}</h3>
	<h3>${errors.cate}</h3>
	<div class="prolist">
		<c:forEach var="pro" items="${cart}">
			<div class='pro'>
				<form action="<c:url value="/Apply/ApplyListsend.controller" />"
					method="post">
					<p>料號:${pro.part_no}
					<p>
					<p>產品名稱:${pro.pro_name}
					<p>
					<p>產品大項:${pro.pro_cate}
					<p>
					<p>規格簡述:${pro.pro_spe}
					<p>
					<p>規格詳述:${pro.pro_intro}
					<p>
					<p>平均購買價格:${pro.pro_price}
					<p>
					<p>
						請購數量:<input type="text" name="pro_amount"
							value="${pro.pro_amount}">
					<p>
					<p>該筆總金額: ${pro.pro_amount*pro.pro_price} 元整
					<p>
						<Input type='hidden' name=part_no value='${pro.part_no}'>
					<P />
					<Input type='hidden' name='pro_cate' value='${pro.pro_cate}'>
					<P />
					<Input type='hidden' name='pro_name' value='${pro.pro_name}'>
					<P />
					<Input type='hidden' name='pro_spe' value='${pro.pro_spe}'>
					<P />
					<Input type='hidden' name='pro_intro' value='${pro.pro_intro}'>
					<P />
					<Input type='hidden' name='pro_price' value='${pro.pro_price}'>
					<P />
					<Input type='hidden' name='pro_amount' value='${pro.pro_amount}'>
					<P />
					<Input type='hidden' name='pro_img' value='${pro.pro_img}'>
					<P />
					<Input type='hidden' name='pro_date' value='${pro.pro_date}'>
					<P />
					<Input type='submit' name='send' value='修改數量'> <Input
						type='submit' name='send' value='刪除此項產品'>
				</form>
				<p>請購總價格:${Listprice}
				<p>
					<Input type='hidden' name='Listprice' value='${Listprice}'>
				<P />
			</div>
		</c:forEach>
	</div>
	<div class="prolist">
		<div class='pro'>
			<form action="<c:url value="/Apply/ApplyListsend.controller" />"
				method="post">
				請購原因:
				<p>
					<textarea rows="5" cols="50" name="suggestion">
</textarea>
				<p>
				
				 <p>簽核順序   1.${user.emp_name}<p>
				 <p> 
				 簽核順序   2.
				<select name="Sign2Employee">
　                                   <option value="${sign2.emp_id}">${sign2.emp_dep}:${sign2.emp_name}經理</option>
                <option value="emp002">研發部: 丁老闆 經理</option>
　                                  <option value="emp005">採購部 鮑俊成 經理</option>
　                                  <option value="emp007">品管部 何瑋倫 經理</option>
　                                 <option value="emp009">財務部 胡瑜真 經理</option>
             </select>
             <p>
             <c:if test="${not empty sign3}">
             <p>
                    簽核順序   3. ${sign3.emp_name} 總經理
             <p> 
             </c:if>
				<p>
					<Input type='submit' name='send' value='產生請購單'> <Input
						type='submit' name='send' value='刪除此次請購'>
			</form>
		</div>
	</div>
</body>
</html>