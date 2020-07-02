<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page errorPage = "../exception/exceptionNoProductId.jsp" %>

<%@ page import = "java.sql.*" %>
<%@ include file = "../database/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
	
<style>
.container tr {
	line-height: 30px;
	height: 30px;
}

.container tr th {
	font-size: 20px;
	text-align: left;
}

.container tr td a {
	margin: 25px;
	font-size: 15px;
	color: #808080;
	text-decoration: none;
}

.container tr td a:hover {
	color: #ccc;
}
.container img{
	width:100%;
	hieght:auto;
}
.container ul li{
margin-top:30px;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}
</style>

<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}
		else{
			document.addForm.reset();
		}
	}
</script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/up.js"></script>
</head>
<body>
<jsp:include page="../header.jsp" /><br><br><br>

<!-- 메인 부분 -->
	<section>
		
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>상품 주문</h1>
				</div>
			</div><br><br>
			
			
	
				<!-- 소메뉴 -->
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a href="./product.jsp?category=top" class=>상의</a></li>
						<li><a href="./product.jsp?category=pants" class=>하의</a></li>
						<li><a href="./product.jsp?category=outer" class=>아우터</a></li>
						<li><a href="./product.jsp?category=shose" class=>신발</a></li>
						<li><a href="./product.jsp?category=accessories" class=>악세사리</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<br> <br>
		
			<%
				String id = request.getParameter("id");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product where pId=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
		<div class="container">
			<div class="intro">
				<div class="col-lg-6">
					
					<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" style="width:100%"/>
				</div>
				
				<div class="col-lg-6">
					<h3><%=rs.getString("pName") %></h3><hr>
					<p><%= rs.getString("pDescription") %></p><hr>
					<p>가격 :&nbsp;&nbsp;&nbsp;<%= rs.getString("pUnitPrice") %>원</p><hr>
					<p>&nbsp;&nbsp;&nbsp;<%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p><hr>
					
					<table class="table">
						<tr>
							<th>상품명</th>
							<th>가격</th>
						</tr>
						
						<tr>
							<td><%= rs.getString("pName") %></td>
							<td><%= rs.getString("pUnitPrice") %>원</td>
						</tr>
					</table><hr>
					<div class="button text-center">
					<form name="addForm" action="../order/addCart.jsp?id=<%= rs.getString("pId")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문</a>
					<a href="../order/order.jsp" class="btn btn-warning">장바구니&raquo;</a>				
					</form>
					</div> 
				</div>
				
				
			</div>
			<%
				}
			%>
	
		
			<br><hr><br>
			<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
				<hr>
					<ul class="list-inline list-unstyled text-center">
						<li><a href="#" class=>DETAIL INFO</a></li>
						<li><a href="#" class=>SHOP GUIDE</a></li>
						<li><a href="#" class=>REVIEW</a></li>
						<li><a href="#" class=>Q&A</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<br><hr><br>
		<div class="col-lg-12">
			<img src="../resources/images/main_img1.jpg" />
			<p>옷설명1</p>
			
			<img src="../resources/images/main_img2.jpg" />
			<p>옷설명2</p>
			
			<img src="../resources/images/main_img3.jpg" />
			<p>옷설명3</p>
			
			<img src="../resources/images/main_img4.jpg" />
			<p>옷설명4</p>
			
			<img src="../resources/images/main_img5.jpg" />
			<p>옷설명4</p>
		</div>
		
		
	</div>
	</div>
</section><hr>

<a id="MOVE_TOP_BTN" href="#"><img src="${pageContext.request.contextPath}/resources/images/up.jpg"></a>
<jsp:include page="../footer.jsp" /><hr>
</body>
</html>