<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 우편번를 위한 다음API 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/mapAPI.js"></script>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 달력선택을 위한스크립트 및 jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="../resources/js/calendar.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />



		<%
			String sessionId = (String) session.getAttribute("sessionId");
		%>
		
		<sql:setDataSource var = "dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/shoppingmall" user="root" password="1234" />
		
		<sql:query dataSource="${dataSource }" var="result">
		select * from member where id =?
		<sql:param value="${sessionId }" />
		</sql:query>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<hr>
	<div class="container">
		<br> <br>
		<h1 class="text-center">주문하기</h1>
	</div>
	<br>
	<br>
	<section>
		<!-- 소메뉴 -->
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/mypage.jsp" class=>마이페이지</a></li>
						<li><a href="${pageContext.request.contextPath}/border/order.jsp" class=>주문</a></li>
						<li><a href="#" class=>장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<br> <br>
	
		
		<div class="container text-center">
			<form action="processShoppingInfo.jsp" class="form-horizontal" method="post">
				<input type="hidden" name="cartId" value="<%= request.getParameter("cartId") %>" />
				
				
			
			<div class="text-center col-sm-offset-2">
			
			
			<c:forEach var="row" items="${result.rows}">
			<div class="form-group row">
				<label class="col-sm-2">받으시는 분</label>
				<div class="col-sm-3">
					<input name= "name" type="text" class="form-control" value="<c:out value="${row.name}"/>"/>
				</div>
			</div><hr>
			
			
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input id= "zipCode" name= "zipCode" type="text" class="form-control" value="<c:out value="${row.postcd}"/>"/>
				</div>
				<div class="col-sm-2">
					<input type="button" value="우편번호 찾기" onclick="Postcode()" class="btn btn-primary" value=""/>
				</div>
			</div>
			
			
			
			<!-- 다음API 주소 사용 -->
			<div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-6">
					<input id = "addressName" name= "addressName" type="text" class="form-control" value="<c:out value="${row.address}"/>"/>
				</div>
			</div> 
			
			<div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-6">
					<input id = "addressName2" name= "addressName2" type="text" class="form-control" value="<c:out value="${row.address2}"/>"/>
				</div>
			</div><hr>
			
			
			<div class="form-group">
						<div class="row">
							<label class="col-sm-2">휴대전화</label>
							<div class="col-sm-2">
								<select name="phone1" id="phone1" class="form-control">
									<c:set var="phone" value="${row.phone}"/>
									
									<c:set var="phone1" value="${phone.substring(0,3) }"/>
									<c:set var="phone2" value="${phone.substring(4,8) }"/>
									<c:set var="phone3" value="${phone.substring(9,13) }"/>
									
									<c:if test="${phone1.equals('010') }">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="018">018</option>
									</c:if>
									
									<c:if test="${phone1.equals('011') }">
									<option value="010">010</option>
									<option value="011" selected>011</option>
									<option value="018">018</option>
									</c:if>
									
									<c:if test="${phone1.equals('018') }">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="018" selected>018</option>
									</c:if>
								</select>
							</div>
							<div class="col-sm-2">
								<input type="text" name="phone2" class="form-control" value="${phone2 }"/>
							</div>
							<div class="col-sm-2">
								<input type="text" name="phone3"
									class="form-control col-sm-2"  value="${phone3 }"/>
							</div>
						</div>
					</div><hr>
					
					
					
					<div class="form-group">
						<label class="col-sm-2">이메일</label> 
						<div class="col-sm-5">
							<input type="email" name="email" class="form-control" id="EMAIL" placeholder="ex)happy@example.com"  value="<c:out value="${row.email}"/>"/>
						</div>
					</div>
			</c:forEach>
			
			
			<div class="form-group row">
				<div class="col-sm-offset-1 col-sm-10">
					<a href="cart.jsp?cartId=<%= request.getParameter("cartId")%>"
					class="btn btn-secondary" role="button">이전</a>
					
					<input type="submit" class="btn btn-primary" value="주문하기" />
					
					<a href="checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
				</div>
			</div><hr>
			
			</div>
			</form>
		</div>
	</section>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>