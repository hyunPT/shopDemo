<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#line{
height:500px;
}
.clear{
clear:both;
}
</style>
<script>
	function deleteConfirm(id){
		if(confirm("해당 상품을 삭제하시겠습니까?")==true)
			location.href = "./deleteProduct.jsp?id=+id";
		else return;
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	
	<div class="container">
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
							<p>
								<a href="updateProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-success" role="button">수정&raquo;</a>
								<a href="deleteProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
							</p>
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
							<p>
								<a href="updateProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-success" role="button">수정&raquo;</a>
								<a href="deleteProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
							</p>
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
							<p>
								<a href="updateProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-success" role="button">수정&raquo;</a>
								<a href="deleteProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
							</p>
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
							<p>
								<a href="updateProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-success" role="button">수정&raquo;</a>
								<a href="deleteProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
							</p>
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
							<p>
								<a href="updateProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-success" role="button" >수정&raquo;</a>
								<a href="deleteProduct.jsp?id=<%= rs.getString("pId")%>" class="btn btn-danger" role="button">삭제&raquo;</a>
							</p>
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
	</div>
</body>
</html>