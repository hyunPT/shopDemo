<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	
	<div class="jumbotron"> 
		<div class="container">
			<h1 class="display-3">회원정보</h1>
		</div>
	</div>
	
	<div class="container">
		<%
			String gubun = request.getParameter("gubun");
		
			if(gubun.equals("login")){
				out.println("<script>alert('정상적으로 로그인 되었습니다.');");
				out.println("location.href='../index.jsp';</script>");				
			}
			else if(gubun.equals("insert")){
				out.println("<script>alert('회원가입을 축하드립니다.');");
				out.println("location.href='../index.jsp';</script>");		
			}
			else if(gubun.equals("update")){
				out.println("<script>alert('정상적으로 회원정보가 수정되었습니다.');");
				out.println("location.href='../index.jsp';</script>");		
			}
			else if(gubun.equals("delete")){
				out.println("<script>alert('정상적으로 회원정보가 삭제되었습니다.');");
				out.println("location.href='../index.jsp';</script>");		
			}
			else if(gubun.equals("loginError")){
				out.println("<script>alert('아이디 혹은 비밀번호를 확인해 주세요');");
				out.println("location.href='../login/login.jsp';</script>");		
			}
			
		%>
	</div>
	
</body>
</html>