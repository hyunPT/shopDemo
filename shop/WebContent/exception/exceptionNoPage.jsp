<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page = "../header.jsp"/>
	<div class="container">
	<div class="jumbotron">
		<h2 class="alert alert-danager">존재하지 않는 페이지입니다.</h2>
	</div>
	
	
		<p><%=request.getRequestURL() %>?<%= request.getQueryString() %></p>
		<p><a href="${pageContext.request.contextPath}/index.jsp">되돌아 가기</a></p>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>