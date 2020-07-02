<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = (String) request.getAttribute("name");
	String category = (String) request.getParameter("category");
%>

 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container tr {
	line-height: 30px;
	height: 30px;
}

.container tr th {
	font-size: 20px;
	text-align: left;
}

.container tr td a {
	margin: 25px;
	font-size: 15px;
	color: #808080;
	text-decoration: none;
}

.container tr td a:hover {
	color: #ccc;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
</head>
<body>
<jsp:include page="../header.jsp" /><hr>

	<!-- 로그인 배너 -->
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">글쓰기</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=notice" class=>공지사항</a></li>
						<li><a
							href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=review"
							class=>리뷰</a></li>
						<li><a
							href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=event" class=>EVENT</a></li>
						<li><a
							href="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=qna" class=>Q&A</a></li>
					</ul>
				</div>
			</div>
		</div>
		<br><hr><br>
		
		
		<div class="container">
			<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post">
				<input type="hidden" name="id" class="form-control" value="${sessionId }" />
				
				<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control" placeholder="제목입력"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" class="form-control" cols="50" rows="5" placeholder="내용입력"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="<%= name%>" readonly="readonly"/>
				</div>
			</div>
			
			<input name="category" type="hidden" value="<%= category%>" readonly="readonly"/> 
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-warning" value="재작성" />
					<a href="./BoardListAction.do?pageNum=1" class="btn btn-info">이전으로</a>
				</div>
			</div>
			
			</form>
		</div>
	</section>
		<hr>
		<br>
		<br>
		
		<jsp:include page="../footer.jsp" />
</body>
</html>  