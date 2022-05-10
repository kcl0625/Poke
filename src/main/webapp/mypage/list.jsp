<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.board.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int pageNum = Integer.parseInt(request.getParameter("page"));
BoardDAO dao = new BoardDAO();
%>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper review">
	<jsp:include page="submenu.jsp" />
	<div class="list">
		<div class="page-sub-title">
			<h2><span class="point salary">M</span>y Review</h2>
		</div>
		<ul>
			<%
			ArrayList<BoardDTO> reviewList = dao.getMyReviewList(pageNum, 9, sessionId);
			for(int i=0;i<reviewList.size();i++){
			%>
				<li id="review_<%=reviewList.get(i).getNo() %>"
				onclick="showReview(<%=reviewList.get(i).getNo() %>);"
				style="background-image:url(<%=root%>/data/review/<%=reviewList.get(i).getFileName()%>);"></li>
			<%}
				if (reviewList.size() == 0) out.println("<p class=\"txt-center no-data\">아직 리뷰가 없어요<br>첫 리뷰를 작성해주세요!</p>");
			%>
		</ul>
	</div>
	
	<%int pageMax = dao.getMyReviewPageMax(9, sessionId);%>
	<div class="paging">
		<nav>
			<%for(int i=0;i<pageMax;i++){%>
				<a href="list.jsp?page=<%=i%>"><%=i+1 %></a>
			<%} %>
		</nav>
	</div>
</div>
<jsp:include page="/footer.jsp" />