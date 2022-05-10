<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.board.*" %>
<%@include file="/config.jsp" %>

<jsp:include page="/header.jsp" />

<jsp:useBean id="reviewBean" class="bbs.board.BoardDAO" />

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int pageNum = Integer.parseInt(request.getParameter("page"));
%>

<link rel="stylesheet" href="<%=root%>/css/review.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">R</span>eview</h2>
		<p class="sub">싱싱한 리뷰</p>	
	</div>
	
	<div class="list">
		<%if (isMem == 1 && isAdm == 0) {%><a href="writeSkin.jsp"><i class="fas fa-pen"></i></a><%} %>
		<ul>
			<%
			ArrayList<BoardDTO> reviewList = reviewBean.getReviewList(pageNum, 9);
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
	
	<%int pageMax = reviewBean.getReviewPageMax(9);%>
	<div class="paging">
		<nav>
			<%for(int i=0;i<pageMax;i++){%>
				<a href="list.jsp?page=<%=i%>"><%=i+1 %></a>
			<%} %>
		</nav>
	</div>
	
	<div id="review-viewer"></div>
	
	<script>
		let showReview = (no) => {
			new Ajax.Request('view.jsp?no=' + no, {
				method: 'get',
				onComplete: (response) => {
					let viewer = document.querySelector('#review-viewer');
					viewer.innerHTML = response.responseText;
					viewer.classList.add('show');
					document.body.classList.add('open');
				}
			})
		}
		
		let closeReview = () => {
			let viewer = document.querySelector('#review-viewer');
			let mask = document.querySelector('#mask');
			viewer.innerHTML = '';
			viewer.classList.remove('show');
			document.body.classList.remove('open');
		}
	</script>
</div>
<jsp:include page="/footer.jsp" />