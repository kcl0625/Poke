<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@include file="/config.jsp" %>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/notice.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">N</span>otice</h2>
		<p class="sub">이벤트 및 공지사항</p>	
	</div>
	
	<div class="select">
		<input type="hidden" name="poke_name" value="POKE - 1">
		<div class="selected select-item">전체</div>
		<div class="select-wrapper">
			<ul>
				<li class="select-item" data-data="전체" style="--i: 1;">전체</li>
				<%
				ArrayList<CategoryDTO> cateList = categoryBean.getCategory("shop");
				int total = cateList.size();
				for(int i=0;i<total;i++){%>
					<li class="select-item" data-data="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.data);" style="--i: <%=i + 2%>"><%=cateList.get(i).getName()%></li>
				<%} %>
			</ul>
		</div>
	</div>
	
	<div class="list">
		<ul>
			<li>
				<span class="cate">Notice</span>
				<a class="title" href="viewSkin.jsp">공지사항 제목</a>
				<span class="date">00.00.00</span>
			</li>
			
			<li>
				<span class="cate">Event</span>
				<a class="title" href="view.skin.jsp">이벤트 제목</a>
				<span class="date">00.00.00</span>
			</li>
			<li>
				<span class="cate">Notice</span>
				<a class="title" href="view.skin.jsp">공지사항 제목</a>
				<span class="date">00.00.00</span>
			</li>
			<li>
				<span class="cate">Notice</span>
				<a class="title" href="view.skin.jsp">공지사항 제목</a>
				<span class="date">00.00.00</span>
			</li>
			<li>
				<span class="cate">Event</span>
				<a class="title" href="view.skin.jsp">이벤트 제목</a>
				<span class="date">00.00.00</span>
			</li>
			<li>
				<span class="cate">Event</span>
				<a class="title" href="view.skin.jsp">이벤트 제목</a>
				<span class="date">00.00.00</span>
			</li>
			<li>
				<span class="cate">Event</span>
				<a class="title" href="view.skin.jsp">이벤트 제목</a>
				<span class="date">00.00.00</span>
			</li>
		</ul>
	</div>
	
	<div class="search">
		<form name="search">
			<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
			<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
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