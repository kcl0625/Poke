<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bowls.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">B</span>owls</h2>
		<p class="sub">직접 고르기 힘드시죠?<br>이런 메뉴들은 어떠세요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<li data-cate="육류">육류</li>
			<li data-cate="해산물">해산물</li>
			<li data-cate="야채 & 과일">야채 & 과일</li>
			<li data-cate="곡물">곡물</li>
			<li data-cate="견과류">견과류</li>
			<li data-cate="치즈">치즈</li>
			<li data-cate="소스">소스</li>
		</ul>
	</div>
	
	<div class="list">
		<p class="result">전체 - 총 0개</p>

		<ul>
			<li>
				<div class="img"></div>
				<h2 class="name">이름1</h2>
				<p class="sub">소개소개소개소개<br>재료1/재료2/재료3/재료4</p>
				<p class="price">￦00,000</p>
				
				<div class="add">
					<a>이대로 담기</a> / <a>수정하기</a>
					<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<h2 class="name">이름2</h2>
				<p class="sub">소개소개소개소개<br>재료1/재료2/재료3/재료4</p>
				<p class="price">￦00,000</p>
				
				<div class="add">
					<a>이대로 담기</a> / <a>수정하기</a>
					<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg>
				</div>
			</li>
			<li>
				<div class="img"></div>
				<h2 class="name">이름3</h2>
				<p class="sub">소개소개소개소개<br>재료1/재료2/재료3/재료4</p>
				<p class="price">￦00,000</p>
				
				<div class="add">
					<a>이대로 담기</a> / <a>수정하기</a>
					<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg>
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