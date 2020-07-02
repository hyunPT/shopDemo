<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function loginCheck(){
		if(${sessionId == null}){
			alert("로그인이 필요합니다.");
			location.href="../login/login.jsp";
			return false;
			}
	}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
</head>
<body>
	<jsp:include page="../header.jsp"/><hr>
	
	<!-- 로그인 배너 -->
	<div class="container-fluid">
		<br><br><h1 class="text-center">로그인</h1>
	</div><br><br>
	<section>
	<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a href="${pageContext.request.contextPath}/join/join.jsp" class=>회원가입</a></li>
						<li><a href="#" role="button" onclick="loginCheck()">마이페이지</a></li>
						<li><a href="#"  role="button" onclick="loginCheck()">주문</a></li>
						<li><a href="#"  role="button" onclick="loginCheck()">장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>
			<hr><br><br>
	<!-- 로그인 폼 -->
	<div class="container">
		<%
			String error= request.getParameter("error");
			if(error!=null){
				out.println("<div class='alert alert-danger'>");
				out.println("아이디와 비밀번호를 확인해 주세요");
				out.println("</div>");
			}
		%>
		<div class="login center-block">
		<form class="form-signin" action="processLoginMember.jsp" method="post">
	<div class="form-group">
		<input type="text"  class="form-control input-lg" id="ID" name="id" placeholder="아이디 입력"/>
	</div>	
	
	<div class="form-group">
		<input type="password"  class="form-control input-lg" id="PW" name="pw" placeholder="비밀번호 입력"/>
	</div>	
	<br>
	<div class="checkbox">
		<label><input type="checkbox" />입력정보 기억</label>
	</div>
	<br>

	<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
	</form>
	<br>
	
	<div class="row">
				<div class="category">
					<div class="col-lg-12 ">
						<ul class="list-inline list-unstyled text-center">
							<li><a href="${pageContext.request.contextPath}/join/join.jsp" class=>회원가입</a></li>
							<li><a href="idFind.jsp" class=>ID 찾기</a></li>
							<li><a href="pwFind.jsp" class=>비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>

	</div>
	</div>
	</section><br><br>
	<hr>
	
	<jsp:include page="../footer.jsp"/>
</body>



		
</html>