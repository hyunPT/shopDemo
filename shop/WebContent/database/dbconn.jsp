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
	<%
		Connection conn = null;
	
		try{
			String url = "jdbc:mysql://localhost:3306/shoppingmall";
			String user = "id";
			String passwd = "pw";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,passwd);
		}catch(SQLException e){
			out.println("SQLException: "+e.getMessage());
		}
	%>
</body>
</html>
