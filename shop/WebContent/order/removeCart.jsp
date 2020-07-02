<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product, dao.ProductRepository" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		
		 if(id==null || id.trim().equals("")){
			response.sendRedirect("../exception/exceptionNoPage.jsp");
			return;
		}
		
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
		
		Product goodsQnt = new Product();
		
		for(int i=0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			
			if(goodsQnt.getProductId().equals(id)) cartList.remove(goodsQnt);
		}
		response.sendRedirect("../border/order.jsp"); 
	%>
</body>
</html>