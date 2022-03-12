<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<div class="wrapper">
	<jsp:include page="submenu.jsp" />

	<div class="profile">
		<div class="pic"></div>
		<div class="info">
			<div class="name">
				<h2>별명</h2>
				<a href="edit.jsp"><i class="fas fa-cog"></i></a>
			</div>
			<div class="sub-info">
				<p>작성리뷰<span>00</span></p>
				<p>보유 포인트<span>0,000</span></p>
			</div>
		</div>
	</div>
	<div class="procedure">
		<a href="">운송장 번호 조회</a>
		<div>
			<p class="num">1</p>
			<span>주문완료</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">2</p>
			<span>입금확인</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">3</p>
			<span>배송준비</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">4</p>
			<span>배송완료</span>
		</div>
	</div>
	<div class="plan">
		<div class="top">
			<h2>My POKE</h2>
			<span>0 week plan</span>
		</div>
			
		<div class="list">
			<ul>
				<li class="theme-box round">
					<div class="img"></div>
					<div class="content-right">
						<div class="info">
							<p class="name">이름</p>
							<p class="ingre">재료1/재료2/재료3</p>
						</div>
						<p class="price">￦00,000</p>
						<form name="">
							<a>+</a><input type="number" name="qua"><a>-</a>
						</form>
						<div class="btns">
							<a href=""><i class="fas fa-pen"></i></a>
							<a href=""><i class="fas fa-trash"></i></a>
						</div>
					</div>
				</li>
				<li class="theme-box round">
					<div class="img"></div>
					<div class="content-right">
						<div class="info">
							<p class="name">이름</p>
							<p class="ingre">재료1/재료2/재료3</p>
						</div>
						<p class="price">￦00,000</p>
						<form name="">
							<a>+</a><input type="number" name="qua"><a>-</a>
						</form>
						<div class="btns">
							<a href=""><i class="fas fa-pen"></i></a>
							<a href=""><i class="fas fa-trash"></i></a>
						</div>
					</div>
				</li>
				<li class="theme-box round">
					<div class="img"></div>
					<div class="content-right">
						<div class="info">
							<p class="name">이름</p>
							<p class="ingre">재료1/재료2/재료3</p>
						</div>
						<p class="price">￦00,000</p>
						<form name="">
							<a>+</a><input type="number" name="qua"><a>-</a>
						</form>
						<div class="btns">
							<a href=""><i class="fas fa-pen"></i></a>
							<a href=""><i class="fas fa-trash"></i></a>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />