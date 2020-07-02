<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "dto.Product, dao.ProductRepository" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("cartId");
	
		if(id ==null || id.trim().equals("")){
			response.sendRedirect("../exception/exceptionNoPage.jsp");
			return;
		}
		
		session.invalidate();
		response.sendRedirect("../border/order.jsp");
	%>
</body>
</html>