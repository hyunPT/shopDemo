<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
</head>
<body>
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
						<li><a href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr><br><br>
		
		
	<div class="login center-block">
		<form class="form-signin" action="processPwFind.jsp" method="post">
	<div class="form-group">
		<input type="text"  class="form-control input-lg  col-md-offset-3" style=width:50%; id="ID" name="id" placeholder="아이디 입력"/>
	</div>	
	
	<div class="form-group">
		<input type="text"  class="form-control input-lg col-md-offset-3" style=width:50%; id="EMAIL" name="email" placeholder="이메일 입력"/>
	</div>	
	<br>
	<br>

	<button type="submit" class="btn btn-primary btn-lg btn-block col-md-offset-3" style=width:50%;>비밀번호 찾기</button>
	</form>
	<br>
	
	<div class="row">
				<div class="category">
					<div class="col-lg-12 ">
						<ul class="list-inline list-unstyled text-center">
							<li><a href="${pageContext.request.contextPath}/join/join.jsp" class=>회원가입</a></li>
							<li><a href="idFind.jsp" class=>비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
	</div>
	</section><br><br><hr>
	
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>