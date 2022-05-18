<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.board.*" %>
<%@include file="/config.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
BoardDTO article = dao.getBoard(no, "qna");
%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/view.skin.bbs.css">
<div class="wrapper qna">
	<jsp:include page="submenu.jsp" />
	<div class="view-area">
		<div class="article-info">
			<div class="article-header">
				<p class="category">Q&A</p>
				<h3 class="article-title"><%=article.getTitle() %></h3>
			</div>
			<a class="back" href="javascript:history.back();"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="50,0 25,25 50,50"></polyline></svg>back</a>
			<span class="date"><%=article.getDate() %></span>
		</div>
		<div class="article theme-box">
			<%if(!article.getFileName().equals("")) {%><img src="<%=root%>/data/member/<%=sessionId %>/<%=article.getFileName()%>"><%} %>
			<p><%=article.getContent() %></p>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />