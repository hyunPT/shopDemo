<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />

<style>

.table-responsive table tr th{
	text-align:center;
}
.table-responsive table tr td{
	text-align:center;
}

tr .name a {
	color: #808080;
	text-decoration: none;
}

.name a:hover {
	color: #ccc;
} 
</style>
</head>
<body>
	<jsp:include page="../header.jsp" /><hr>

	<%
		String cartId = session.getId();
	%>

	<!-- 로그인 배너 -->
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">장바구니</h1>
	</div>
	<br>
	<br>
	<section>
		
		<div class="container">
		<h3>Order List</h3>
				<div class="row">
				<table width="100%">
					<tr>
						<td align="right"><a href="../order/AllRemoveCart.jsp?cartId=<%= cartId%>" class="btn btn-danger">전체삭제</a>
					</tr>
				</table>
				</div>
				<br>
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
						<th>색상/사이즈</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
						<th>삭제</th>
					</tr>
					
					<%
						int sum=0;
					
						ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
						
						if(cartList == null) cartList = new ArrayList<Product>();
						
						for(int i=0; i<cartList.size(); i++){
							Product product = cartList.get(i);
							int total = product.getUnitPrice()*product.getQuantity();
							sum = sum+total;
						
					%>

					<tr>
						<td width=10%><%= product.getProductId() %></td>
						<td class="name" width=50%><a href="../product/products.jsp?id=<%= product.getProductId()%>"><%= product.getPname() %></a></td>
						<td width="10%"><%= product.getColor() %> / <%=product.getSize() %></td>
						<td width="10%"><fmt:formatNumber value="<%= product.getUnitPrice() %>" pattern="#,###"/>원</td>
						<td width="10%"><%=product.getQuantity() %></td>
						<td width="10%"><fmt:formatNumber value="<%=total %>" pattern="#,###"/>원</td>
						<td width="10%"><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="btn btn-danger">삭제</a></td>
					</tr>
					<%
						}
					%>
					<tr class="text-right">
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><fmt:formatNumber value="<%= sum %>" pattern="#,###"/>원</th>
					</tr>
		
				</table>
			</div>
			
			
			<div class="row">
				<table width="100%">
					<tr>
						<td align="right"><a href="../index.jsp" class="btn btn-primary">쇼핑 계속하기</a>
						<a href="../order/shoppingInfo.jsp?cartId=<%= cartId%>" class="btn btn-success">주문하기</a>
						</td>
					</tr>
				</table>
				</div>

			<div class="row">
				<div class="col-md-7 text-right">
					<ul class="pagination">
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
			</div>
		</div>





	</section>
	<br>
	<br>
	<hr>

	<jsp:include page="../footer.jsp" />
</body>
</html>