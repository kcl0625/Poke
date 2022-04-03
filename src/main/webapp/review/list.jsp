<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="review.ReviewDTO" %>
<%@include file="/config.jsp" %>

<jsp:include page="/header.jsp" />

<jsp:useBean id="reviewBean" class="review.ReviewDAO" />

<link rel="stylesheet" href="<%=root %>/css/review.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">R</span>eview</h2>
		<p class="sub">싱싱한 리뷰</p>	
	</div>
	
	<div class="list">
		<a href="writeSkin.jsp"><i class="fas fa-pen"></i></a>
		<ul>
			<%
				ArrayList<ReviewDTO> reviewList = reviewBean.getReviewList();
				int total = reviewBean.getReviewList().size();
				for(int i=0;i<total;i++){%>
					<li id="review_<%=reviewList.get(i).getNo() %>" onclick="showReview(<%=reviewList.get(i).getNo() %>);"></li>
			<%} %>
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
	
	<div id="review-viewer"></div>
	<div id="mask"></div>
	
	<script>
		let showReview = (no) => {
			new Ajax.Request('view.jsp?no=' + no, {
				method: 'get',
				parameter: no,
				onComplete: (response) => {
					let viewer = document.querySelector('#review-viewer');
					viewer.innerHTML = response.responseText;
					viewer.classList.add('show');
					document.body.classList.add('open-review');
				}
			})
		}
		
		let closeReview = () => {
			let viewer = document.querySelector('#review-viewer');
			let mask = document.querySelector('#mask');
			viewer.innerHTML = '';
			viewer.classList.remove('show');
			document.body.classList.remove('open-review');
		}
	</script>
</div>
<jsp:include page="/footer.jsp" />