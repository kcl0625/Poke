<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">S</span>hop</h2>
		<p class="sub">추가구매도 가능해요<br>무엇이 있을까요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<li data-cate="전체">전체</li>
			<li data-cate="음료수">음료수</li>
			<li data-cate="에너지바">에너지바</li>
			<li data-cate="기타 간식">기타 간식</li>
			<li data-cate="굿즈">굿즈</li>
		</ul>
	</div>
	
	<div class="list">
		<ul>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<div class="content-bottom">
					<p class="name">이름1</p>
					<span class="price">￦0,000</span>
					
					<form name="">
						<a>+</a><input type="number" name="qua"><a>-</a>
						<button class="cart"><i class="fas fa-shopping-cart"></i></button>
					</form>
				</div>
			</li>
		</ul>
	</div>
	
	<div class="search">
		<form name="search">
			<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
			<button type="button" onclick="open(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
	C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
		</form>
	</div>
	
	<div class="paging">
		<div class="btn prev"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg></div>
		<nav>
			<a class="cur">1</a>
			<a>2</a>
			<a>3</a>
			<a>4</a>
			<a>5</a>
		</nav>
		<div class="btn next"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg></div>
	</div>
</div>
<jsp:include page="/footer.jsp" />