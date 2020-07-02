<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<script src="${pageContext.request.contextPath}/resources/js/mapAPI.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/validation.js"></script>
<body>
	<jsp:include page="../header.jsp" /><hr>


	<!-- 회원가입 배너 -->
	<div class="container-fluid">
		<br> <br>
		<h1 class="text-center">회원정보 수정</h1>
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
							href="${pageContext.request.contextPath}/login/logout.jsp" class=>로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/order/order.jsp" class=>장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>
		<hr>
		<br> <br>

		<%
			String id = request.getParameter("id");
			String mail = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String address2 = request.getParameter("address2");
			String postcd = request.getParameter("postcd");
			
			String phone2 = phone.substring(4, 8);
			String phone3 = phone.substring(9, 13);
			
		%>
		<c:set var = "email" value="${fn:substringBefore(mail,'@') }"/>

		<!-- 회원가입 폼 -->
		<div class="container">
			<div class="join center-block">
				<form name="frm" action="processUpdateMember.jsp" method="post">
					<div class="form-group">
						<label for="InputId">아이디</label> <input type="text" name="id"
							class="form-control input-lg" id="ID"
							placeholder="영문 또는 숫자 조합, 6자이상 15자 이하" value="<%= id%>" readonly/>
					</div>
					<hr>

					<div class="form-group">
						<label for="InputPw">비밀번호</label> <input type="password" name="pw"
							class="form-control input-lg" id="PW"
							placeholder="영문+숫자 조합 4~12자 이내" />
					</div>
					<hr>

					<div class="form-group">
						<label for="InputPw_check">비밀번호 확인</label> <input type="password"
							name="pw_check" class="form-control input-lg" id="PW_check"
							placeholder="비밀번호 확인란" />
					</div>
					<hr>
					<div class="form-gourp">
						<label>이메일</label><br>
						<div class="col-sm-4">
							<input type="text" name="mail" class="form-control input-lg" id="EMAIL" value="<c:out value="${email}"/>"/>
						</div>
						<div class="col-sm-4">
							<select class="form-control input-lg" name="mail2">
								<option value="@naver.com">@naver.com</option>
								<option value="@gmail.com">@gmail.com</option>
								<option value="@daum.net">@daum.com</option>
							</select>
						</div>
					</div>
				

					<br><br><hr><div class="form-group">
						<label for="InputName">이름</label> <br>
						<div class="col-sm-4">
						<input type="text" name="name" class="form-control input-lg" id="name" maxlength=5 value="<%= name%>"/>
						</div>
					</div>
					<br><br><hr>

					<div class="form-group">
						<div class="row">
							<div class="col-xs-3">
								<label for="InputPhone">휴대전화</label>
							</div>
							<br> <br>
							<div class="col-xs-3">
								<select name="phone1" id="phone1" class="form-control input-lg">
									<option value="010">010</option>
									<option value="010">011</option>
									<option value="010">018</option>
								</select>
							</div>
							<div class="col-xs-3">
								<input type="text" name="phone2" class="form-control input-lg" maxlength=4 value="<%= phone2%>"/>
							</div>
							<div class="col-xs-3">
								<input type="text" name="phone3"
									class="form-control input-lg col-xs-2" maxlength=4 value="<%= phone3%>"/>
							</div>
						</div>
					</div>

					<!-- 다음API 주소 사용 -->
					<hr>
					<div class="form-group row">
					
						<label class="col-sm-2" >주소</label><br><br>
						<div class="col-sm-3">
							<input id="zipCode" name="zipCode" type="text"
								class="form-control input-lg"  value="<%= postcd%>"/> 
						</div>
						<div class="col-sm-4">
								<input type="button" value="우편번호 찾기"
								onclick="Postcode()" class="btn btn-info btn-lg"/>
						</div>
					
					</div><br>
					

					<div class="form-group row">
						<div class="col-sm-8">
							<input id="addressName" name="addressName" type="text"
								class="form-control input-lg"  value="<%= address%>"/>
						</div>
						<div class="col-sm-2">
							<p>기본주소</p>
						</div>
					</div>

					<div class="form-group row">
						<div class="col-sm-8">
							<input id="addressName2" name="addressName2" type="text"
								class="form-control input-lg"  value="<%= address2%>"/>
						</div>
						<div class="col-sm-2">
							<p>상세주소</p>
						</div>
					</div>
					<jsp:useBean id = "now" class="java.util.Date"/>
				
					<br>
					<hr>
					<br>
					<button type="button" class="btn btn-primary btn-lg btn-block" onclick="loginCheck()">회원정보 수정</button>
				</form>
				<br> <br>
			</div>
		</div>
	</section>
	<hr>
	<jsp:include page="../footer.jsp" /><hr>
</body>
</html>