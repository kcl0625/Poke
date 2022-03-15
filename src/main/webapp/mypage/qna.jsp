<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<div class="wrapper qna">
	<jsp:include page="submenu.jsp" />
	<div class="page-sub-title">
		<h2>Q<span class="point salary">&</span>A</h2>
		
		<div class="search">
			<form name="search">
				<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
				<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
		C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
			</form>
		</div>
	</div>
	<div class="list">
		<ul>
			<li>
				<a href="view.skin.jsp">질문 제목1
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">제목2
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">제목3
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">제목4
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">이것도 제목
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">6번째 제목
				<span class="date">00.00.00</span></a>
			</li>
			<li>
				<a href="">질문 7
				<span class="date">00.00.00</span></a>
			</li>
		</ul>
	</div>
</div>
<jsp:include page="/footer.jsp" />