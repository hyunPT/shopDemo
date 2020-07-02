<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/shoppingmall" 
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
	
	<sql:query dataSource="${dataSource }" var="resultSet">
		select * from member where id =? and pw=?
		
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=pw %>"/>
	</sql:query>
	
	<c:if test="${resultSet.rowCount>0 }">
		<%
			session.setAttribute("sessionId", id);
		%>
		<c:redirect url ="../join/resultMember.jsp?gubun=login"/>
	</c:if>
	
	<c:if test="${resultSet.rowCount==0 }">
		<c:redirect url ="../join/resultMember.jsp?gubun=loginError"/>
	</c:if>
</body>
</html>