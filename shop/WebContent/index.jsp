<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ page import ="java.util.ArrayList" %>
<%@ page import="dto.Product, dao.ProductRepository" %>

<%@ page import="java.sql.*" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hyun's shoppingMall</title>

<style>
header .navbar-nav li a {
	font-size: 14px;
	margin-left: 5px;
	margin-right: 5px;

}

header .navbar-nav li a:


header .contents {
	margin-left: 5px;
}

header .users {
	margin-right: 10px;
}

header .container-fluid {
	padding: 5px;
}

header .carousel-inner img {
	width: 100%;
}

section .category ul li a {
	margin: 25px;
	font-size: 15px;
	color: #808080;
	text-decoration: none;
}

section .category ul li a:hover {
	color: #ccc;
}
section .container  .thumbnail img{
	opacity:1.0;
	filter:alpha(opacity=50);
}
section .container  .thumbnail img:hover{
	opacity:0.5;
	fileter: alpha(opactiry=100);
}
footer .footer h3{
color: #808080;
}
footer .footer p{
color: #808080;
}
footer .footer a{
text-decoration:none;
color: #808080;
}

#line{
height:500px;
}
.clear{
clear:both;
}

a#MOVE_TOP_BTN {
    position: fixed;
    right: 2%;
    bottom: 50px;
    display: none;
    z-index: 999;
}



</style>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/up.js"></script>

</head>
	<body>
		<jsp:include page="header.jsp"/>
		
		<!-- 배너 이미니 슬라이드 -->
	<header>
		<div class="clearfix"></div>
		<!-- 메인 상품 이미지 슬라이드 -->
		<div class="container-fluid">
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">

				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="resources/images/img1.jpg" alt="...">
						<div class="carousel-caption">
							<h3>첫번째 사진</h3>
							<p>사진 설명</p>
						</div>
					</div>
					<div class="item">
						<img src="resources/images/img2.jpg" alt="...">
						<div class="carousel-caption">
							<h3>두번째 사진</h3>
							<p>사진 설명</p>
						</div>
					</div>
					<div class="item">
						<img src="resources/images/img3.jpg" alt="...">
						<div class="carousel-caption">
							<h3>세번째 사진</h3>
							<p>사진 설명</p>
						</div>
					</div>
					...
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>

			</div>
		</div>
	</header>

	<!-- 메인 -->
	<section>
		<div class="container">
			<!-- 소메뉴 -->
			<div class="row">
				<div class="category">
					<div class="col-lg-12 ">
						<ul class="list-inline list-unstyled text-center">
							<li><a href="product/product.jsp?category=top" class=>상의</a></li>
							<li><a href="product/product.jsp?category=pants" class=>하의</a></li>
							<li><a href="product/product.jsp?category=outer" class=>아우터</a></li>
							<li><a href="product/product.jsp?category=shose" class=>신발</a></li>
							<li><a href="product/product.jsp?category=accessories" class=>악세사리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<hr>
			
			
			<%@ include file="../database/dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			%>
		
			<% 
			String top = "select * from product where pCategory='top'";
			
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();	
			%>
			<h1>상의</h1><br>
			<%
			while(rs.next()){
				if(rs.getString("pCategory").equals("Top")){
			%>	
				
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="thumbnail">
						<a href="product/products.jsp?id=<%=rs.getString("pId") %>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
						<div class="caption">
							<h3><%= rs.getString("pName") %></h3><hr>
							<p><%= rs.getString("pUnitPrice") %>원</p>
							<p><%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p>
							<p><%= rs.getString("pDescription") %></p>
						</div>
					</div>
				</div>
			<%
				}
			}
			%>
			<div id="line"></div>
			<div class="clear"></div>
			<% 
			String pants = "select * from product where pCategory='pants'";
			
			pstmt = conn.prepareStatement(pants);
			rs = pstmt.executeQuery();	
			
			%>
			
			<h1>하의</h1><br>
			<%
			while(rs.next()){
				if(rs.getString("pCategory").equals("Pants")){
			%>	
				
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="thumbnail">
						<a href="product/products.jsp?id=<%=rs.getString("pId") %>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
						<div class="caption">
							<h3><%= rs.getString("pName") %></h3><hr>
							<p><%= rs.getString("pUnitPrice") %>원</p>
							<p><%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p>
							<p><%= rs.getString("pDescription") %></p>
						</div>
					</div>
				</div>
			<%
				}
			}
			%>
			<div id="line"></div>
			<div class="clear"></div>
			<% 
			String outer = "select * from product where pCategory='outer'";
			
			pstmt = conn.prepareStatement(outer);
			rs = pstmt.executeQuery();	
			%>
			<h1>아우터</h1><br>
			<% 
			while(rs.next()){
				if(rs.getString("pCategory").equals("Outer")){
			%>	
				
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="thumbnail">
						<a href="product/products.jsp?id=<%=rs.getString("pId") %>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
						<div class="caption">
							<h3><%= rs.getString("pName") %></h3><hr>
							<p><%= rs.getString("pUnitPrice") %>원</p>
							<p><%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p>
							<p><%= rs.getString("pDescription") %></p>
						</div>
					</div>
				</div>
			<%
				}
			}
			%>
			<div id="line"></div>
			<div class="clear"></div>
			<% 
			String shose = "select * from product where pCategory='shose'";
			
			pstmt = conn.prepareStatement(shose);
			rs = pstmt.executeQuery();	
			%>
			<h1>신발</h1><br>
			<%
			while(rs.next()){
				if(rs.getString("pCategory").equals("Shose")){
			%>	
				
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="thumbnail">
						<a href="product/products.jsp?id=<%=rs.getString("pId") %>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
						<div class="caption">
							<h3><%= rs.getString("pName") %></h3><hr>
							<p><%= rs.getString("pUnitPrice") %>원</p>
							<p><%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p>
							<p><%= rs.getString("pDescription") %></p>
						</div>
					</div>
				</div>
			<%
				}
			}
			%>
			<div id="line"></div>
			<div class="clear"></div>
			<% 
			String accessories = "select * from product where pCategory='accessories'";
			
			pstmt = conn.prepareStatement(accessories);
			rs = pstmt.executeQuery();	
			%>
			<h1>악세서리</h1><br>
			<%
			while(rs.next()){
				if(rs.getString("pCategory").equals("Accessories")){
			%>	
				
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="thumbnail">
						<a href="product/products.jsp?id=<%=rs.getString("pId") %>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
						<div class="caption">
							<h3><%= rs.getString("pName") %></h3><hr>
							<p><%= rs.getString("pUnitPrice") %>원</p>
							<p><%= rs.getString("pColor") %> | <%= rs.getString("pSize") %></p>
							<p><%= rs.getString("pDescription") %></p>
						</div>
					</div>
				</div>
			<%
				}
			}
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			%>

		</div>
	</section>
	<a id="MOVE_TOP_BTN" href="#"><img src="${pageContext.request.contextPath}/resources/images/up.jpg"></a>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>

