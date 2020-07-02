<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		
		if(cookies !=null){
			for(int i=0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				
				if(n.equals("Shopping_cartId")) shopping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
		}
	%>
	
	<jsp:include page = "../header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	</div>
	
	<div class="container">
		<p><a href="../index.jsp" class="btn btn primary">돌아가기</a></p>
	</div>
</body>
</html>

<%	
/* 세션 정보 모두 삭제 */
session.removeAttribute("cartlist");

/* 쿠키에 저장된 배송정보를 모두 삭제 */
for(int i=0; i<cookies.length; i++){
	Cookie thisCookie = cookies[i];
	
	String n = thisCookie.getName();
	
	if(n.equals("Shopping_cartId")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_name")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_shoppingDate")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_country")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_zipCode")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_addresssName")) thisCookie.setMaxAge(0);
	if(n.equals("Shopping_addressName2")) thisCookie.setMaxAge(0);
}
%>