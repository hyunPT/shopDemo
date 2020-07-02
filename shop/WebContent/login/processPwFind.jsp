<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>

<style>
	.find{
		border:1px solid #ccc;
	}
</style>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String email = request.getParameter("email");
	%>

	
	
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/shoppingmall" 
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
	
	<sql:query dataSource="${dataSource }" var="resultSet">
		select * from member where id =? and email=?
		
		<sql:param value="${param.id }"/>
		<sql:param value="${param.email }"/>
	</sql:query>
	
	
	<c:if test="${resultSet.rowCount>0 }">
	
		<jsp:include page="../header.jsp"/><hr>
	
	<!-- 로그인 배너 -->
	<div class="container-fluid">
		<br><br><h1 class="text-center">비밀번호 찾기</h1>
	</div><br><br>
	<section>
	<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a href="${pageContext.request.contextPath}/join/join.jsp" class=>회원가입</a></li>
						<li><a href="#" class=>마이페이지</a></li>
						<li><a href="#" class=>주문</a></li>
						<li><a href="#" class=>장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr><br><br>
		
		
		<div class="row">
				<div class="category2 container" style=width:40%;>
					<div class="col-lg-12">
						<ul class=" list-unstyled text-center">
							<li style=margin-bottom:20px;><img src="${pageContext.request.contextPath}/resources/images/check.jpg" alt="" /></li>
							<li style=margin-bottom:20px;><strong>고객님 비밀번호 찾기가 완료 되었습니다.</strong></li>
							<li style=margin-bottom:20px;><pre>고객님의 비밀번호 찾기가 성공적으로 이루어졌습니다.
항상 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하겠습니다.</pre></li>
							<li class="find ">
								<c:forEach var="row" items="${resultSet.rows}">
								<ul class="list-unstyled text-center">
									<li>아이디 : <c:out value="${row.id}"/></li>
									<c:set var="pw" value="${row.pw }"/>
									<li>비밀번호 : <strong>${fn:substring(pw,0,4) }<c:forEach begin="1" end="${fn:length(pw)-4}">*</c:forEach></strong></li>
									<li>이메일 : <c:out value="${row.email}"/></li>
									<li><b>즐거운 쇼핑 하세요!</b></li>
								</ul>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<br><br>
			<div class="text-center container">
					<a href="${pageContext.request.contextPath}/login/login.jsp" class="btn btn-primary">로그인</a>
			</div>
	</section>
	<br><hr><br>
		
		<jsp:include page="../footer.jsp"/>
	</c:if>
	
	<c:if test="${resultSet.rowCount==0 }">
		<%
			out.println("<script>alert('이름이나 이메일을 다시 한번 확인 해주세요.');");
			out.println("location.href='./idFind.jsp';</script>");
		%>
	</c:if>
	
	
	
	  
</body>
</html>