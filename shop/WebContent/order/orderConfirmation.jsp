<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList, java.net.URLDecoder" %>
<%@ page import = "dto.Product, dao.ProductRepository" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
</head>
<body>
	<%
		String cartId = session.getId();
		
		String shopping_cartId="";
		String shopping_name="";
		String shopping_zipCode="";
		String shopping_addressName="";
		String shopping_addressName2="";
		String shopping_phone1="";
		String shopping_phone2="";
		String shopping_phone3="";
		String shopping_email="";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				
				if(n.equals("shopping_cartId")) shopping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_name")) shopping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_zipCode")) shopping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_addressName")) shopping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_addressName2")) shopping_addressName2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_phone1")) shopping_phone1 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_phone2")) shopping_phone2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_phone3")) shopping_phone3 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("shopping_email")) shopping_email = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}

	%>
	
	<jsp:include page="../header.jsp"/>
	<div class="container">
		<br> <br><br><br>
		<h1 class="text-center">주문확인</h1>
	
	
	<br>
	<br>
	<section>
		<!-- 소메뉴 -->
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/mypage.jsp" class=>마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/border/order.jsp" class=>주문</a></li>
						<li><a href="#" class=>장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<br> <br>
	<div class="container">
	
	<div class="review">
		<ul>
			<li><strong>성명</strong> : <% out.println(shopping_name); %></li>
			<li><strong>주소</strong> : <% out.println(shopping_zipCode); %>
			 <%out.println(shopping_addressName); %>
			 <%out.println(shopping_addressName2); %></li>
			 <li><strong>상품정보</strong> : </li>
		</ul>
	</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<tr>
				<th class="text-center">상품명</th>
				<th class="text-center">색상 / 사이즈</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">합계</th>
				
			</tr>
			
			<%
				int sum=0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				
				if(cartList == null) cartList = new ArrayList<Product>();
				for(int i=0; i<cartList.size(); i++){
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum+=total;
			%>
			<tr class="text-center">
				<td><%=product.getPname() %></td>
				<td><%=product.getColor() %> / <%=product.getSize() %></td>
				<td><fmt:formatNumber value='<%= product.getQuantity() %>' pattern="#,###"/></td>
				<td><fmt:formatNumber value='<%= product.getUnitPrice() %>' pattern="#,###"/>원</td>
				<td><fmt:formatNumber value='<%= total %>' pattern="#,###"/>원</td>
			</tr>
			
			<%
				}
			%>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td class="text-center"><strong>총액:</strong></td>
				<td class="text-center text-danger"><strong><fmt:formatNumber value='<%=sum %>' pattern="#,###"/>원</strong></td>
			</tr>
		</table>
		
		<div class="text-center">
			<a href="shoppingInfo.jsp?cartId=<%= shopping_cartId%>" class="btn btn-secondary" role="button">이전</a>
			<a href="thankCustomer.jsp" class="btn btn-success" role="botton">주문완료</a>
			<a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
	
	</section>
	</div>
	<hr>
	<jsp:include page="../footer.jsp"/>
</body>
</html>