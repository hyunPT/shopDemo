<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*, java.sql.*" %>
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
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where pId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "update product set pName=?,pUnitPrice=?,pDescription=?,pCategory=?,pColor=?,pSize=?,pFilename=?,pUnits=? where pId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, pname);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setString(5, color);
			pstmt.setString(6, size);
			pstmt.setString(7, fileName);
			pstmt.setInt(8, count);
			pstmt.setString(9, productId);
			pstmt.executeUpdate();
		}
		/* 이미지 파일 첨부 안한경우 */
		else{
			sql = "update product set pName=?,pUnitPrice=?,pDescription=?,pCategory=?,pColor=?,pSize=?,pUnits=? where pId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setString(5, color);
			pstmt.setString(6, size);
			pstmt.setInt(7, count);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		}
	}
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp");
	%>
</body>
</html>