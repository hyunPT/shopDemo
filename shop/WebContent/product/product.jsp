<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product, dao.ProductRepository" %>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>

<%@ page import = "java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>

<%@ page errorPage = "../exception/exceptionNoProductId.jsp" %>
<%
	String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/product.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<style>
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
	<jsp:include page="../header.jsp"/>
	
	<!-- 상의  -->
	<%
		if(category.equals("top")){
	%>
	<!-- 메인 부분 -->
	<section>
		<div class="container">
			<div class="top_banner">
				<div class="col-lg-12">
				<img src="../resources/images/top_banner.jpg" />
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>Top</h1>
				</div>
			</div>
			
		
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
			<div class="product">
				<div class="row">
					<div class="col-lg-8">
						<p>Total : 100</p>
					</div>
					<div class="col-lg-4">
						<ul class="list-unstyled list-inline">
							<li><a href="#">인기상품</a></li>
							<li><a href="#">낮은가격</a></li>
							<li><a href="#">높은가격</a></li>
							<li><a href="#">상품명</a></li>
							<li><a href="#">신상품</a></li>
						</ul>
					</div>
					<hr>
		<%@ include file="../database/dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			String top = "select * from product where pCategory='top'";
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="thumbnail">
							<a href="products.jsp?id=<%= rs.getString("pId")%>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
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
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		%>
				</div>
			</div>

		</div>


	</section>
	<%
		}
	%>
	
	
	
	
	
	<!-- 하의 -->
	<!-- 상의  -->
	<%
		if(category.equals("pants")){
	%>
	<!-- 메인 부분 -->
	<section>
		<div class="container">
			<div class="top_banner">
				<div class="col-lg-12">
				<img src="../resources/images/pants_banner.jpg" />
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>Pants</h1>
				</div>
			</div>
			
		
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
			<div class="product">
				<div class="row">
					<div class="col-lg-8">
						<p>Total : 100</p>
					</div>
					<div class="col-lg-4">
						<ul class="list-unstyled list-inline">
							<li><a href="#">인기상품</a></li>
							<li><a href="#">낮은가격</a></li>
							<li><a href="#">높은가격</a></li>
							<li><a href="#">상품명</a></li>
							<li><a href="#">신상품</a></li>
						</ul>
					</div>
					<hr>
		<%@ include file="../database/dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			String top = "select * from product where pCategory='pants'";
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="thumbnail">
							<a href="products.jsp?id=<%= rs.getString("pId")%>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
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
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		%>
				</div>
			</div>

		</div>


	</section>
	<%
		}
	%>
	
	
	
	
	<!-- 아우터 -->
	<%
		if(category.equals("outer")){
	%>
	<!-- 메인 부분 -->
	<section>
		<div class="container">
			<div class="top_banner">
				<div class="col-lg-12">
				<img src="../resources/images/outer_banner.jpg" />
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>Outer</h1>
				</div>
			</div>
			
		
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
			<div class="product">
				<div class="row">
					<div class="col-lg-8">
						<p>Total : 100</p>
					</div>
					<div class="col-lg-4">
						<ul class="list-unstyled list-inline">
							<li><a href="#">인기상품</a></li>
							<li><a href="#">낮은가격</a></li>
							<li><a href="#">높은가격</a></li>
							<li><a href="#">상품명</a></li>
							<li><a href="#">신상품</a></li>
						</ul>
					</div>
					<hr>
		<%@ include file="../database/dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			String top = "select * from product where pCategory='outer'";
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="thumbnail">
							<a href="products.jsp?id=<%= rs.getString("pId")%>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
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
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		%>
				</div>
			</div>

		</div>


	</section>
	<%
		}
	%>
	
	
	
	
	<!-- 신발 -->
	<%
		if(category.equals("shose")){
	%>
	<!-- 메인 부분 -->
	<section>
		<div class="container">
			<div class="top_banner">
				<div class="col-lg-12">
				<img src="../resources/images/shose_banner.jpg" />
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>Shose</h1>
				</div>
			</div>
			
		
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
			<div class="product">
				<div class="row">
					<div class="col-lg-8">
						<p>Total : 100</p>
					</div>
					<div class="col-lg-4">
						<ul class="list-unstyled list-inline">
							<li><a href="#">인기상품</a></li>
							<li><a href="#">낮은가격</a></li>
							<li><a href="#">높은가격</a></li>
							<li><a href="#">상품명</a></li>
							<li><a href="#">신상품</a></li>
						</ul>
					</div>
					<hr>
		<%@ include file="../database/dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			String top = "select * from product where pCategory='shose'";
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="thumbnail">
							<a href="products.jsp?id=<%= rs.getString("pId")%>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
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
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		%>
				</div>
			</div>

		</div>


	</section>
	<%
		}
	%>
	
	
	
	
	<!-- 악세서리 -->
	<%
		if(category.equals("accessories")){
	%>
	<!-- 메인 부분 -->
	<section>
		<div class="container">
			<div class="top_banner">
				<div class="col-lg-12">
				<img src="../resources/images/accessories_banner.jpg" />
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="context">
				<div class="col-lg-12 text-center">
					<h1>Accessories</h1>
				</div>
			</div>
			
		
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
			<div class="product">
				<div class="row">
					<div class="col-lg-8">
						<p>Total : 100</p>
					</div>
					<div class="col-lg-4">
						<ul class="list-unstyled list-inline">
							<li><a href="#">인기상품</a></li>
							<li><a href="#">낮은가격</a></li>
							<li><a href="#">높은가격</a></li>
							<li><a href="#">상품명</a></li>
							<li><a href="#">신상품</a></li>
						</ul>
					</div>
					<hr>
		<%@ include file="../database/dbconn.jsp"%>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			String top = "select * from product where pCategory='accessories'";
			pstmt = conn.prepareStatement(top);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
					<div class="col-lg-3 col-md-4 col-sm-6">
						<div class="thumbnail">
							<a href="products.jsp?id=<%= rs.getString("pId")%>"><img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("pFilename") %>" /></a>
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
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		%>
				</div>
			</div>

		</div>


	</section>
	<%
		}
	%>
	<hr>
	<a id="MOVE_TOP_BTN" href="#"><img src="${pageContext.request.contextPath}/resources/images/up.jpg"></a>
	<jsp:include page="../footer.jsp"/>
</body>
</html>