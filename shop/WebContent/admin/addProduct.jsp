<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
header .navbar-nav li a {
	font-size: 14px;
	margin-left: 5px;
	margin-right: 5px;

}

header .navbar-nav li a:


header .contents {
	margin-left: 5px;
}

header .users {
	margin-right: 10px;
}

header .container-fluid {
	padding: 5px;
}

header .carousel-inner img {
	width: 100%;
}

section .category ul li a {
	margin: 25px;
	font-size: 15px;
	color: #808080;
	text-decoration: none;
}

section .category ul li a:hover {
	color: #ccc;
}
section .container .row .thumbnail img{
	opacity:1.0;
	filter:alpha(opacity=50);
}
section .container .row .thumbnail img:hover{
	opacity:0.5;
	fileter: alpha(opactiry=100);
}
footer .footer h3{
color: #808080;
}
footer .footer p{
color: #808080;
}
footer .footer a{
text-decoration:none;
color: #808080;
}
</style>

<script>
	function checkProduct(){
		var form = document.newProduct;
		var productId = document.getElementById("productId");
		
		if(form.productId.value==""){
			alert("상품 코드를 입력해주세요\n상의:P1xxx\n하의:P2xxx\n아우터:P3xxx\n신발:P4xxx\n악세서리:P5xxx");
			form.productId.focus();
			return false;
		}
		
		if(form.pname.value==""){
			alert("상품 이름를 입력해주세요");
			form.pname.focus();
			return false;
		}
		
		if(form.unitPrice.value==""){
			alert("상품 가격을 입력해주세요");
			form.unitPrice.focus();
			return false;
		}
		if(isNaN(form.unitPrice.value)){
			alert("[가격]\n숫자만 입력하세요");
			form.unitPrice.focus();
			return false;
		}
		
		
		if(form.units.value==""){
			alert("상품 재고량을 입력해주세요");
			form.unitsInStock.focus();
			return false;
		}
		if(isNaN(form.units.value)){
			alert("[재고량]\n숫자만 입력하세요");
			form.unitsInStock.value.focus();
			return false;
		}
		
		form.submit();
	}
</script>

</head>
<body>
		<jsp:include page="../header.jsp"/>
		
		<section>
		

			<!-- 소메뉴 -->
			<div class="row">
				<div class="category">
					<div class="col-lg-12 ">
						<ul class="list-inline list-unstyled text-center">
							<li><a href="product/top.jsp" class=>상의</a></li>
							<li><a href="product/pants.jsp" class=>하의</a></li>
							<li><a href="product/outer.jsp" class=>아우터</a></li>
							<li><a href="product/shose.jsp" class=>신발</a></li>
							<li><a href="product/accessories.jsp" class=>악세사리</a></li>
						</ul>
					</div>
				</div>
			</div>
			<hr>
			
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-5">상품등록</h1>
			</div>
		</div>
		<div class="container">
		<form name="newProduct" action="processAddProduct.jsp" class="form-horizontal" method="post"
			enctype="multipart/form-data">
		
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" name="productId" class="form-control" />
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control" />
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품가격</label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" class="form-control" />
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품분류</label>
				<div class="col-sm-3">
					<select class="form-control" name="category">
							<option value="Top">Top</option>
							<option value="Pants">Pants</option>
							<option value="Outer">Outer</option>
							<option value="Shose">Shose</option>
							<option value="Accessories">Accessories</option>
						</select>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품색상</label>
				<div class="col-sm-3">
					<label><input type="checkbox" value="Red" name="color"/>Red</label>
					<label><input type="checkbox" value="Blue" name="color"/>Blue</label>
					<label><input type="checkbox" value="Green" name="color"/>Green</label>
					<label><input type="checkbox" value="Black" name="color"/>Black</label>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">상품사이즈</label>
				<div class="col-sm-3">
					<label><input type="checkbox" value="big" name="size"/>big</label>
					<label><input type="checkbox" value="middle" name="size"/>middle</label>
					<label><input type="checkbox" value="small" name="size"/>small</label>
					<label><input type="checkbox" value="free" name="size"/>free</label>
				</div>
			</div><hr>
			
			<div class="form-group row">
				<label class="col-sm-2">재고수</label>
				<div class="col-sm-3">
					<input type="text" name="units" class="form-control" />
				</div>
			</div><hr>
			
				<div class="form-group row">
				<label class="col-sm-2">상품이미지</label>
				<div class="col-sm-3">
					<input type="file" name="filename" class="form-control" />
				</div>
			</div><hr>
			
				<div class="form-group row">
				<label class="col-sm-2">제품설명</label>
				<textarea name="description" id="description" cols="30" rows="5"></textarea>
			</div><hr>
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="checkProduct()"/>
				</div>
			</div>
			
			
			
		</form>
			</div>
		</section>
	
</body>
</html>