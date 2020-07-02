<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="adminHeader.jsp"/>


		<section>
		

			<!-- 소메뉴 -->
			<div class="row">
				<div class="category">
					<div class="col-lg-12 ">
						<ul class="list-inline list-unstyled text-center">
							<li><a href="product/top.jsp" class=>상의</a></li>
							<li><a href="product/pants.jsp" class=>하의</a></li>
							<li><a href="product/outer.jsp" class=>아우터</a></li>
							<li><a href="product/shose.jsp" class=>신발</a></li>
							<li><a href="product/accessories.jsp" class=>악세사리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<hr>
			
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-5">상품수정</h1>
			</div>
		</div>
		
	<%@ include file = "../database/dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where pId =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
	%>
		<div class="container">
		<form name="newProduct" action="processUpdateProduct.jsp" class="form-horizontal" method="post"
			enctype="multipart/form-data">
			
			<img src="${pageContext.request.contextPath }/resources/images/<%=rs.getString("pFilename") %>" alt="image" style="width:80%" />
			<br><hr><br>
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control"  value="<%= rs.getString("pId")%>" readonly/>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control" value="<%= rs.getString("pName")%>"/>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control"  value="<%= rs.getString("pUnitPrice")%>"/>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품분류</label>
				<div class="col-sm-3">
					<select class="form-control" name="category">
						<%
							if(rs.getString("pCategory").equals("Top")){
						%>
							<option value="Top" selected>Top</option>
							<option value="Pants">Pants</option>
							<option value="Outer">Outer</option>
							<option value="Shose">Shose</option>
							<option value="Accessories">Accessories</option>
						<%
							}
						%>
							<%
							if(rs.getString("pCategory").equals("Pants")){
						%>
							<option value="Top">Top</option>
							<option value="Pants" selected>Pants</option>
							<option value="Outer">Outer</option>
							<option value="Shose">Shose</option>
							<option value="Accessories">Accessories</option>
						<%
							}
						%>
							<%
							if(rs.getString("pCategory").equals("Outer")){
						%>
							<option value="Top">Top</option>
							<option value="Pants">Pants</option>
							<option value="Outer" selected>Outer</option>
							<option value="Shose">Shose</option>
							<option value="Accessories">Accessories</option>
						<%
							}
						%>
							<%
							if(rs.getString("pCategory").equals("Shose")){
						%>
							<option value="Top">Top</option>
							<option value="Pants">Pants</option>
							<option value="Outer">Outer</option>
							<option value="Shose" selected>Shose</option>
							<option value="Accessories">Accessories</option>
						<%
							}
						%>
						<%
							if(rs.getString("pCategory").equals("Accessories")){
						%>
							<option value="Top">Top</option>
							<option value="Pants">Pants</option>
							<option value="Outer">Outer</option>
							<option value="Shose">Shose</option>
							<option value="Accessories" selected>Accessories</option>
						<%
							}
						%>
						
						
						</select>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품색상</label>
				<div class="col-sm-3">
						<%
						if(rs.getString("pColor").equals("Red")){
						%>
								<label><input type="checkbox" value="Red" name="color" checked="checked"/>Red</label>
								<label><input type="checkbox" value="Blue" name="color"/>Blue</label>
								<label><input type="checkbox" value="Green" name="color"/>Green</label>
								<label><input type="checkbox" value="Black" name="color"/>Black</label>
						<%
							}
						%>
						<%
						if(rs.getString("pColor").equals("Blue")){
						%>
								<label><input type="checkbox" value="Red" name="color"/>Red</label>
								<label><input type="checkbox" value="Blue" name="color" checked="checked"/>Blue</label>
								<label><input type="checkbox" value="Green" name="color"/>Green</label>
								<label><input type="checkbox" value="Black" name="color"/>Black</label>
						<%
							}
						%>
						<%
						if(rs.getString("pColor").equals("Green")){
						%>
								<label><input type="checkbox" value="Red" name="color"/>Red</label>
								<label><input type="checkbox" value="Blue" name="color"/>Blue</label>
								<label><input type="checkbox" value="Green" name="color" checked="checked"/>Green</label>
								<label><input type="checkbox" value="Black" name="color"/>Black</label>
						<%
							}
						%>
						<%
						if(rs.getString("pColor").equals("Black")){
						%>
								<label><input type="checkbox" value="Red" name="color"/>Red</label>
								<label><input type="checkbox" value="Blue" name="color"/>Blue</label>
								<label><input type="checkbox" value="Green" name="color"/>Green</label>
								<label><input type="checkbox" value="Black" name="color" checked="checked"/>Black</label>
						<%
							}
						%>
						
				
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품사이즈</label>
				<div class="col-sm-3">
						<%
						if(rs.getString("pSize").equals("big")){
						%>
							<label><input type="checkbox" value="big" name="size" checked="checked"/>big</label>
							<label><input type="checkbox" value="middle" name="size"/>middle</label>
							<label><input type="checkbox" value="small" name="size"/>small</label>
							<label><input type="checkbox" value="free" name="size"/>free</label>
						<%
							}
						%>
						<%
						if(rs.getString("pSize").equals("middle")){
						%>
							<label><input type="checkbox" value="big" name="size"/>big</label>
							<label><input type="checkbox" value="middle" name="size" checked="checked"/>middle</label>
							<label><input type="checkbox" value="small" name="size"/>small</label>
							<label><input type="checkbox" value="free" name="size"/>free</label>
						<%
							}
						%>
						<%
						if(rs.getString("pSize").equals("small")){
						%>
							<label><input type="checkbox" value="big" name="size"/>big</label>
							<label><input type="checkbox" value="middle" name="size"/>middle</label>
							<label><input type="checkbox" value="small" name="size" checked="checked"/>small</label>
							<label><input type="checkbox" value="free" name="size"/>free</label>
						<%
							}
						%>
						<%
						if(rs.getString("pSize").equals("free")){
						%>
							<label><input type="checkbox" value="big" name="size"/>big</label>
							<label><input type="checkbox" value="middle" name="size"/>middle</label>
							<label><input type="checkbox" value="small" name="size"/>small</label>
							<label><input type="checkbox" value="free" name="size" checked="checked"/>free</label>
						<%
							}
						%>
					
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" name="units" class="form-control" value="<%=rs.getString("pUnits") %>"/>
				</div>
			</div><hr>
			
				<div class="form-group row">
				<label class="col-sm-2">상품이미지</label>
				<div class="col-sm-3">
					<input type="file" name="filename" class="form-control" />
				</div>
			</div><hr>
			
				<div class="form-group row">
				<label class="col-sm-2">제품설명</label>
				<textarea name="description" id="description" cols="30" rows="5"></textarea>
			</div><hr>
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정"/>
				</div>
			</div>
			
			
			
		</form>
			</div>
			<%
		}
			%>
		</section>
		<jsp:include page = "../footer.jsp"/>
</body>
</html>