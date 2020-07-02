<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="mvc.model.BoardDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardDTO notice = (BoardDTO) request.getAttribute("board");
int num = (Integer) request.getAttribute("num");
int nowpage = (Integer) request.getAttribute("page");
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
		<h1 class="text-center">상세 글 보기</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
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
		<form name ="newUpdate" action="./BoardUpdateAction.do?num=<%= notice.getNum()%>&pageNum=<%= nowpage%>" method="post">
			<div class="from-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control" value="<%= notice.getSubject() %>" />
				</div>
			</div><hr>
			
			<div class="from-group row">
				<label class="col-sm-2 control-label">내용</label>
				
				<!-- word-break : 줄바꿈 속성 (textarea 줄 끝까지 갔을때의 줄바꿈 )
					word-break:break-all -> 문자 단위로 줄바꿈
					word-break:keep-all -> 단어 단위로 줄바꿈
				 -->
				<div class="col-sm-6" style="word-break:break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"><%= notice.getContent() %></textarea>
				</div>
			</div><hr>
			
			<div class="from-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" value="<%= notice.getName() %>" readonly="readonly"/>
				</div>
			</div><br>
			
			<div class="from-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<c:set var="userId" value="<%=notice.getId() %>"/>
					<p><a href="./BoardListAction.do?pageNum=<%= nowpage%>" class="btn btn-primary">목록</a>
					<c:if test="${sessionId == userId }">
							<input type="submit" class="btn btn-success" value="수정"/>
							<a href="./BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger">삭제</a>
					</c:if>
					</p>
					
					
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