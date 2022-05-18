<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDAO" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="bbs.board.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");
int pageNum = Integer.parseInt(request.getParameter("page"));
String keyword = request.getParameter("keyword");

BoardDAO dao = new BoardDAO();
%>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/notice.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">N</span>otice</h2>
		<p class="sub">이벤트 및 공지사항</p>	
	</div>
	<div class="page category">
		<ul>
			<li <%if (cate.equals("전체")) out.println("class=\"cur\"");%>>
				<a href="list.jsp?cate=전체&page=0">전체</a>
			</li>
			<%
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> cateList = categoryDAO.getCategory("notice");
			int cateSize = cateList.size();
			for(int i=0;i<cateSize;i++){%>
				<li <%if (cate.equals(cateList.get(i).getName())) out.println("class=\"cur\"");%>><a href="list.jsp?cate=<%=cateList.get(i).getName()%>&page=0"><%=cateList.get(i).getName()%></a></li>
			<%} %>
		</ul>
	</div>
	
	<div class="list">
		<ul>
			<%
			ArrayList<BoardDTO> noticeList = new ArrayList<BoardDTO>();
			noticeList = dao.searchBoard(pageNum, 7, keyword, "notice");
			
			for(int i=0;i<noticeList.size();i++){ %>
				<li>
					<span class="cate"><%=noticeList.get(i).getCate() %></span>
					<a class="title" href="viewSkin.jsp?no=<%=noticeList.get(i).getNo() %>"><%=noticeList.get(i).getTitle() %></a>
					<span class="date"><%=noticeList.get(i).getDate() %></span>
				</li>
			<%} 
			if(noticeList.size() == 0) out.println("<p class=\"txt-center\">검색결과가 없습니다</p>");
			
			%>
		</ul>
	</div>
	
	<div class="search">
		<form name="search" action="search.jsp?cate=전체&page=0" method="post">
			<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
			<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
	C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
		</form>
	</div>
	
	<% int pageMax = dao.getSearchBoardListPageMax(keyword, 7, "notice");%>
	<div class="paging">
		<nav>
			<%for(int i=0;i<pageMax;i++){%>
				<a href="search.jsp?cate=<%=cate%>&page=<%=i%>&keyword=<%=keyword%>"><%=i+1 %></a>
			<%} %>
		</nav>
	</div>
</div>
<jsp:include page="/footer.jsp" />