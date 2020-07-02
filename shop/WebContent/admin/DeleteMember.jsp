<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	%>
	<sql:setDataSource var="dataSource" url ="jdbc:mysql://localhost:3306/shoppingmall"
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
	
	<sql:update dataSource="${dataSource }" var="resultSet">
		delete from member where id=?
		<sql:param value="<%=id %>"/>
	</sql:update>
	
	<c:redirect url="../join/resultMember.jsp?gubun=delete" />
	</body>
</html>