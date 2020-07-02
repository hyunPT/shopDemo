<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
	<!-- 헤더부분 -->
	<header>
	
		<%
			String sessionId = (String) session.getAttribute("sessionId");
		%>
		
		<sql:setDataSource var = "dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/shoppingmall" user="root" password="1234" />
		
		<sql:query dataSource="${dataSource }" var="result">
		select * from member where id =?
		<sql:param value="${sessionId }" />
		</sql:query>
		
		<!-- 네비게이션 바 -->
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <ul class="nav navbar-nav ml-auto">
      <li class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
      <li class="dropdown"><a class="btn-lg dropdown-toggle" data-toggle="dropdown" href="#">Board<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=notice"/>">공지사항</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=event"/>">이벤트</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=qna"/>">Q&A</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/BoardListAction.do?pageNum=1&category=review"/>">상품리뷰</a></li>
        </ul>
      </li>      
      
      <li class="dropdown"><a class="btn-lg dropdown-toggle" data-toggle="dropdown" href="#">Product<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/product/product.jsp?category=top"/>">Top</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/product/product.jsp?category=pants"/>">Pants</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/product/product.jsp?category=outer"/>">Outer</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/product/product.jsp?category=shose"/>">Shose</a></li>
          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/product/product.jsp?category=accessories"/>">Accessories</a></li>
        </ul>
      </li>             
    </ul>
    <ul class="nav navbar-nav navbar-right">
	   	 <c:choose>
			<c:when test="${empty sessionId}">
      <li><a  class="btn-lg dropdown-toggle" href="<c:url value="${pageContext.request.contextPath}/login/login.jsp"/>"><span class="glyphicon glyphicon-user"></span>&nbsp;login</a></li>
      <li><a  class="btn-lg dropdown-toggle" href="<c:url value="${pageContext.request.contextPath}/join/join.jsp"/>"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Sign up</a></li>
			</c:when>
			<c:when test="${sessionId == 'admin'}">
				<li style="padding-top:13px; color:#808080;font-size:16px"><c:forEach var="row" items="${result.rows}">[<c:out value="${row.name}"/></c:forEach>님]</li>
			      <li class="dropdown active"><a class="btn-lg dropdown-toggle" data-toggle="dropdown" href="#">Admin Menu</a>
			        <ul class="dropdown-menu">
		              <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/admin/addProduct.jsp"/>">상품 등록</a></li>		              
		              <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/admin/editProduct.jsp"/>">상품 편집</a></li>
			          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/login/logout.jsp"/>">로그아웃 </a></li>
				      <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/admin/editMember.jsp"/>">회원 수정&삭제</a></li>
			        </ul>
			      </li>  
			</c:when>
			<c:when test="${sessionId != 'admin'}">
				<li style="padding-top:13px; color:#808080;font-size:16px"><c:forEach var="row" items="${result.rows}">[<c:out value="${row.name}"/></c:forEach>님]</li>
				<li style="font-weight:bold" class="nav-item"><a class="btn-lg nav-link" href="<c:url value="${pageContext.request.contextPath}/login/logout.jsp"/>">로그아웃 </a></li>
				<li class="dropdown active"><a class="btn-lg dropdown-toggle" data-toggle="dropdown" href="#">메뉴</a>
			        <ul class="dropdown-menu">
			        	<c:forEach var="row" items="${result.rows}">
		              <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/admin/UpdateMember.jsp?id=${row.id }&email=${row.email}&name=${row.name}&phone=${row.phone}&address=${row.address}&address2=${row.address2}&postcd=${row.postcd}"/>">회원정보 수정</a></li>
		              <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/mypage/mypage.jsp?id=${row.id }"/>">마이페이지</a></li>
		              </c:forEach>
			          <li class="list-group-item"><a href="<c:url value="${pageContext.request.contextPath}/order/order.jsp"/>">장바구니</a></li>
			        </ul>
			      </li>  
			</c:when>	
		 </c:choose>
    </ul>
  </div>
</nav>	
</header>
</body>

<script>
	$('.carousel').carousel(){}
</script>
</html>