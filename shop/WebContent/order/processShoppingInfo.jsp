<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cartId = new Cookie("shopping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
		Cookie name = new Cookie("shopping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
		Cookie addressName = new Cookie("shopping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
		Cookie addressName2 = new Cookie("shopping_addressName2",URLEncoder.encode(request.getParameter("addressName2"),"utf-8"));
		Cookie phone1 = new Cookie("shopping_phone1",URLEncoder.encode(request.getParameter("phone1"),"utf-8"));
		Cookie phone2 = new Cookie("shopping_phone2",URLEncoder.encode(request.getParameter("phone2"),"utf-8"));
		Cookie phone3 = new Cookie("shopping_phone3",URLEncoder.encode(request.getParameter("phone3"),"utf-8"));
		Cookie email = new Cookie("shopping_email",URLEncoder.encode(request.getParameter("email"),"utf-8"));
		
		
		cartId.setMaxAge(24*60*60);
		name.setMaxAge(24*60*60);
		addressName.setMaxAge(24*60*60);
		addressName2.setMaxAge(24*60*60);
		phone1.setMaxAge(24*60*60);
		phone2.setMaxAge(24*60*60);
		phone3.setMaxAge(24*60*60);
		email.setMaxAge(24*60*60);
		
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(addressName);
		response.addCookie(addressName2);
		response.addCookie(phone1);
		response.addCookie(phone2);
		response.addCookie(phone3);
		response.addCookie(email);
		
		response.sendRedirect("orderConfirmation.jsp");
		
	%>
</body>
</html>