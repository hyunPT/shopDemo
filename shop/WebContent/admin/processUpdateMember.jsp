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
		String pw = request.getParameter("pw");
		String mail1 = request.getParameter("mail");
		String mail2 = request.getParameter("mail2");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String postcd = request.getParameter("zipCode");
		String address = request.getParameter("addressName");
		String address2 = request.getParameter("addressName2");
		
		String mail = mail1+mail2;
		String phone = phone1+"-"+phone2+"-"+phone3;
	%>
	
	<sql:setDataSource var="dataSource" url ="jdbc:mysql://localhost:3306/shoppingmall"
	driver="com.mysql.jdbc.Driver" user="id" password="pw"/>
	
	<sql:update dataSource="${dataSource }" var="resultSet">
		update member set pw=?,email=?,name=?,phone=?,address=?,address2=?,postcd=? where id=?
		
		<sql:param value="<%=pw %>"/>
		<sql:param value="<%=mail %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=address %>"/>
		<sql:param value="<%=address2 %>"/>
		<sql:param value="<%=postcd %>"/>
		<sql:param value="<%=id %>"/>
	</sql:update>
	
	<c:redirect url="../join/resultMember.jsp?gubun=update"/>
</body>
</html>
