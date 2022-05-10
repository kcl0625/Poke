<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper review">
	<jsp:include page="submenu.jsp" />
	<div class="list">
		<div class="page-sub-title">
			<h2><span class="point salary">M</span>y Review</h2>
		</div>
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