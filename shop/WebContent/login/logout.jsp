<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();
		out.println("<script>alert('정상적으로 로그아웃 되었습니다.');");
		out.println("location.href='../index.jsp';</script>");	
	%>
</body>
</html>