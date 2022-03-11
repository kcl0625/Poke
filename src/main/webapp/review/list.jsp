<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/review.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">R</span>eview</h2>
		<p class="sub">싱싱한 리뷰</p>	
	</div>
	
	<div class="list">
		<a href="writeReview.jsp"><i class="fas fa-pen"></i></a>
		<ul>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
			<li style="background: url('');"></li>
		</ul>
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