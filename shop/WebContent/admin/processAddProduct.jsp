<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Product, dao.ProductRepository" %>

<%@ page import = "com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ include file = "../database/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		String filename="";
		String realFolder="C:\\Users\\user\\Desktop\\ShoppingMall\\shop\\WebContent\\resources\\images";
		int maxSize=5*1024*1024; 
		String encType = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		
		
		
		String productId = multi.getParameter("productId");
		String pname = multi.getParameter("pname");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String category = multi.getParameter("category");
		String color = multi.getParameter("color");
		String size = multi.getParameter("size");
		String units = multi.getParameter("units");
		
		Integer price,count;
		
		if(unitPrice.isEmpty()) price=0;
		else price=Integer.valueOf(unitPrice);
		
		
		if(units.isEmpty()) count=0;
		else count = Integer.valueOf(units);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt =null;
		
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, productId);
		pstmt.setString(2, pname);
		pstmt.setInt(3, price);
		pstmt.setString(4, description);
		pstmt.setString(5, category);
		pstmt.setString(6, color);
		pstmt.setString(7, size);
		pstmt.setString(8, fileName);
		pstmt.setInt(9, count);
		pstmt.execute();
		
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		
		
		 response.sendRedirect("../index.jsp"); 
		
	%>
</body>
</html>