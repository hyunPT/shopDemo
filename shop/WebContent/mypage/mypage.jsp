<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>
<%@ include file = "../database/dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
	
	<style>
.mypage tr {
	line-height: 30px;
	height: 30px;
}

.mypage tr th {
	font-size: 20px;
	text-align: center;
}

.mypage tr td a {
	margin: 25px;
	font-size: 15px;
	color: #808080;
	text-decoration: none;
}

.mypage tr td a:hover {
	color: #ccc;
}
img{
	width:100%;
	hieght:auto;
}

.mypage{
	

}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" /><hr>

	<!-- 로그인 배너 -->
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">마이페이지</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="container">
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="#" class=>관심상품</a></li>
						<li><a href="#" class=>주문조회</a></li>
						<li><a href="# " class=>쿠폰</a></li>
						<li><a href="# " class=>게시글</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
		<hr>
		<br>
		<br>
		
			<div class="mypage container">
			<div class="row">
				<div class="info">
				<h3>Infomation</h3>
					<div class="col-lg-4">
						<img src="../resources/images/love1.jpg" />
					</div>
			<%
				String id = request.getParameter("id");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
					<div class="col-lg-8">
						<h3><%=rs.getString("name") %>&nbsp;&nbsp;님 환영합니다.</h3>
			<%
			}
			%>
						<table class="table text-center">
							<tr>
								<th>회원등급</th>
								<th>적립금</th>
								<th>쿠폰</th>
								<th>구매건수</th>
							</tr>
							
							<tr>
								<td>Bronse</td>
								<td>1000원</td>
								<td>3장</td>
								<td>10건</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<br><hr><br>
			
			 <div class="row">
				<div class="order">
				<h3>Order list</h3>
				</div>
				
				<div class="col-lg-12 text-center">
					<table class="table">
						<tr>
							<th>주문일자</th>
							<th>주문번호</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>구매금액</th>
						</tr>
						
						<tr>
							<td>2020-02-02</td>
							<td>P1234</td>
							<td>배고플땐 라면!</td>
							<td>20</td>
							<td>15000</td>
						</tr>
					</table>
				</div>
			</div>
		
			<br><hr><br>
			
			<div class="row">
				<div class="border">
				<h3>Border list</h3>
				</div>
				
				<div class="col-lg-12 text-center">
					<table class="table">
						<tr>
							<th style=width:10%>분류</th>
							<th style=width:60%>글 제목</th>
							<th style=width:20%>작성일</th>
							<th style=width:10%>조회수</th>
						</tr>
						<%
				String sql2 = "select * from board where id=?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
						 <tr>
							<td><%=rs.getString("category") %></td>
							<td><a href="../BoardViewAction.do?num=<%=rs.getString("num") %>&pageNum=1"><%=rs.getString("subject") %></a></td>
							<td><%=rs.getString("regdate") %></td>
							<td><%=rs.getString("hit") %></td>
						</tr> 
						<%
						}
						%> 
					</table>
				</div>
			</div>
			
		
		



	</div>
	</section>
	<br>
	<br>
	<hr>

	<jsp:include page="../footer.jsp" />
</body>
</html>