<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.*" %>
<%@ page import = "mvc.model.BoardDTO" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	ArrayList boardList = (ArrayList) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	String category = (String) request.getAttribute("category");
	
%>
	


 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css" />

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
	.table td a{
		text-decoration:none;
		color:black;
	}
	.table td a:hover{
		color:#aaa;
	}
	
	.page{
		float:right;
	}
</style>


<script>
function checkForm(){
	if(${sessionId == null}){
	alert("로그인이 필요합니다.");
	location.href="../login/login.jsp";
	return false;
	}
	
	if(${category.equals('notice')})
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>&category=notice";
	else if(${category.equals('review')})
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>&category=review";
	else if(${category.equals('event')})
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>&category=event";
	else if(${category.equals('qna')})
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>&category=qna";

	
}
</script>
</head>
<body>
	<jsp:include page="../header.jsp" /><hr>
	
	
	<!-- 공지사항 -->
	<c:if test="${category.equals('notice') }">
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">공지사항</h1>
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
		<hr>
		<br>
		<br>



		
		<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div class="text-left">
				<span class="badge badge-success">전체<%=total_record %>건</span>
				<!-- 게시판 등록버튼 -->
				<div class="page">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
				</div>
			</div><br><br>
			
			
			
			<div sytle="padding-top:50px">
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="50%" class="text-center">제목</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
						<th width="10%" class="text-center">작성자</th>
					</tr>
					<%
						int j = boardList.size()+1;
						for(int i=0;i<boardList.size();i++){
							BoardDTO notice = (BoardDTO)boardList.get(i);
							j--;
					%>
					<tr>
						<td width="10%" class="text-center"><%=j %></td>
						<td width="50%" class="text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td width="20%" class="text-center"><%=notice.getRegdate() %></td>
						<td width="10%" class="text-center"><%=notice.getHit() %></td>
						<td width="10%" class="text-center"><%=notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<!-- 페이지네이션 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>"/>
				<nav>
					<ul class="pagination">
						<li class="page-item">
							<a href="#" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<li class="page-item">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" />" >
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'>${i}</font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'>${i}</font>
								</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
				<li class="page-link">
						<a href="#" class="page-link" aria-label="Next">
							<span aria-heddin="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
				</nav>
			</div>
			
			<!-- 검색조건 화면 구성 -->
			
			<div align="right">
				<table>
					<tr>
						<td width="100%" align="center">&nbsp;&nbsp;
							<select name="items">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	</section>
	</c:if>
	
	
	
	<!-- 리뷰 -->
	<c:if test="${category.equals('review') }">
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">리뷰</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
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
		<hr>
		<br>
		<br>



	
		<div class="container">
		<form action="<c:url value="./BoardListAction.do?category=review"/>" method="post">
			<div class="text-left">
				<span class="badge badge-success">전체<%=total_record %>건</span>
				<!-- 게시판 등록버튼 -->
				<div class="page">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
				</div>
			</div><br><br>
			
			
			
			<div sytle="padding-top:50px">
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="50%" class="text-center">제목</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
						<th width="10%" class="text-center">작성자</th>
					</tr>
					<%
						int j = boardList.size()+1;
						for(int i=0;i<boardList.size();i++){
							BoardDTO notice = (BoardDTO)boardList.get(i);
							j--;
					%>
					<tr>
					
						<td width="10%" class="text-center"><%=j %></td>
						
						<td width="50%" class="text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td width="20%" class="text-center"><%=notice.getRegdate() %></td>
						<td width="10%" class="text-center"><%=notice.getHit() %></td>
						<td width="10%" class="text-center"><%=notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<!-- 페이지네이션 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>"/>
				<nav>
					<ul class="pagination">
						<li class="page-item">
							<a href="#" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<li class="page-item">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" />" >
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'>${i}</font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'>${i}</font>
								</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
				<li class="page-link">
						<a href="#" class="page-link" aria-label="Next">
							<span aria-heddin="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
				</nav>
			</div>
			
			<!-- 검색조건 화면 구성 -->
			
			<div align="right">
				<table>
					<tr>
						<td width="100%" align="center">&nbsp;&nbsp;
							<select name="items">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	</section>
	</c:if>
	
	
	
	<!-- 이벤트 -->
	<c:if test="${category.equals('event') }">
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">이벤트</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
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
		<hr>
		<br>
		<br>



		<!-- 공지사항 게시판 -->
		<div class="container">
		<form action="<c:url value="./BoardListAction.do?category=event"/>" method="post">
			<div class="text-left">
				<span class="badge badge-success">전체<%=total_record %>건</span>
				<!-- 게시판 등록버튼 -->
				<div class="page">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
				</div>
			</div><br><br>
			
			
			
			<div sytle="padding-top:50px">
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="50%" class="text-center">제목</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
						<th width="10%" class="text-center">작성자</th>
					</tr>
					<%
						int j = boardList.size()+1;
						for(int i=0;i<boardList.size();i++){
							BoardDTO notice = (BoardDTO)boardList.get(i);
							j--;
					%>
					<tr>
						<td width="10%" class="text-center"><%=j %></td>
						<td width="50%" class="text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td width="20%" class="text-center"><%=notice.getRegdate() %></td>
						<td width="10%" class="text-center"><%=notice.getHit() %></td>
						<td width="10%" class="text-center"><%=notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<!-- 페이지네이션 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>"/>
				<nav>
					<ul class="pagination">
						<li class="page-item">
							<a href="#" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<li class="page-item">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" />" >
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'>${i}</font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'>${i}</font>
								</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
				<li class="page-link">
						<a href="#" class="page-link" aria-label="Next">
							<span aria-heddin="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
				</nav>
			</div>
			
			<!-- 검색조건 화면 구성 -->
			
			<div align="right">
				<table>
					<tr>
						<td width="100%" align="center">&nbsp;&nbsp;
							<select name="items">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	</section>
	</c:if>
	
	
	
	<!--  Q&A -->
	<c:if test="${category.equals('qna') }">
	<div class="container-fluid">
		<br>
		<br>
		<h1 class="text-center">Q&A</h1>
	</div>
	<br>
	<br>
	<section>
		<div class="row">
			<div class="category">
				<div class="col-lg-12 ">
					<ul class="list-inline list-unstyled text-center">
						<li><a
							href="${pageContext.request.contextPath}/login/login.jsp" class=>로그인</a></li>
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
		<hr>
		<br>
		<br>



		<!-- 공지사항 게시판 -->
		<div class="container">
		<form action="<c:url value="./BoardListAction.do?category=qna"/>" method="post">
			<div class="text-left">
				<span class="badge badge-success">전체<%=total_record %>건</span>
				<!-- 게시판 등록버튼 -->
				<div class="page">
				<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
				</div>
			</div><br><br>
			
			
			
			<div sytle="padding-top:50px">
				<table class="table">
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="50%" class="text-center">제목</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
						<th width="10%" class="text-center">작성자</th>
					</tr>
					<%
						int j = boardList.size()+1;
						for(int i=0;i<boardList.size();i++){
							BoardDTO notice = (BoardDTO)boardList.get(i);
							j--;
					%>
					<tr>
						<td width="10%" class="text-center"><%=j %></td>
						<td width="50%" class="text-center"><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td width="20%" class="text-center"><%=notice.getRegdate() %></td>
						<td width="10%" class="text-center"><%=notice.getHit() %></td>
						<td width="10%" class="text-center"><%=notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			
			<!-- 페이지네이션 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>"/>
				<nav>
					<ul class="pagination">
						<li class="page-item">
							<a href="#" class="page-link" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<li class="page-item">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" />" >
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'>${i}</font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'>${i}</font>
								</c:otherwise>
							</c:choose>
						</a>
					</li>
				</c:forEach>
				<li class="page-link">
						<a href="#" class="page-link" aria-label="Next">
							<span aria-heddin="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</ul>
				</nav>
			</div>
			
			<!-- 검색조건 화면 구성 -->
			
			<div align="right">
				<table>
					<tr>
						<td width="100%" align="center">&nbsp;&nbsp;
							<select name="items">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
							</select>
							<input type="text" name="text" />
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	</section>
	</c:if>
	<br>
	<br>
	<hr>

	<jsp:include page="../footer.jsp" />
</body>
</html> 