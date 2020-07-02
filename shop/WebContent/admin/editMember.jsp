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
	<%@ include file="../header.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원관리</h1>
		</div>
	</div>
	
	<sql:setDataSource var="dataSource" url="jdbc:mysql://localhost:3306/shoppingmall"
	driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
	
	<sql:query var="resultSet" dataSource="${dataSource }">
		select * from member
	</sql:query>
	
	<div class="container">
		<table border="1">
		<tr class="text-center">
			<c:forEach var="columnName" items="${resultSet.columnNames }">
				<th width="100" class="text-center"><c:out value="${columnName }" /></th>
			</c:forEach>
			<th class="text-center">수정</th>
			<th class="text-center">삭제</th>
		</tr>
		

		

		<c:forEach var="row" items="${resultSet.rowsByIndex }">
		<tr class="text-center">
			<c:forEach var="column" items="${row }" varStatus="i">
				<td>
					<c:if test="${column != null }">
						<c:out value="${column }"/>
					</c:if>
					<c:if test="${column == null }">
						&nbsp;
					</c:if>
				</td>
			</c:forEach>
			<td><a href="UpdateMember.jsp?id=${row[0] }&email=${row[2]}&name=${row[3]}&phone=${row[4]}&address=${row[5]}&address2=${row[6]}&postcd=${row[7]}"><input type="submit" class="btn btn-info" value="수정" /></a></td>
			<td><a href="DeleteMember.jsp?id=${row[0] }"><input type="submit" class="btn btn-danger" value="삭제" /></a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>