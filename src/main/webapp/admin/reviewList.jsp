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
	ArrayList<BoardDTO> review = dao.getReviewList(pageNum, 10);
%>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="tbl-section">
		<h2 class="tbl-title">리뷰 목록</h2>
		<table>
		<tr>
			<th></th>
			<th>아이디</th>
			<th>포케 이름</th>
			<th>구성</th>
			<th>내용</th>
			<th>별점</th>
			<th>작성일</th>
			<th></th>
			<th></th>
		</tr>
		<%for (int i=0;i<review.size();i++) {%>
			<tr>
				<td><%=review.get(i).getNo() %></td>
				<td><%=review.get(i).getId() %></td>
				<td><%=review.get(i).getPoke() %></td>
				<td><%=review.get(i).getIngre() %></td>
				<td><%=review.get(i).getContent() %></td>
				<td><%=review.get(i).getStar() %></td>
				<td><%=review.get(i).getDate() %></td>
				<td><a class="ui-btn" href="javascript:void(0);" onclick="showReview(<%=review.get(i).getNo()%>);">내용보기</a></td>
				<td><a class="ui-btn point" href="<%=root%>/bbs/delArticle.jsp?no=<%=review.get(i).getNo()%>&bbs=review">삭제하기</a></td>
			</tr>
		<% } %>
	</table>
	</div>
	
	<div id="review-viewer"></div>
<script>
let showReview = (no) => {
	new Ajax.Request('ajax/showReview.jsp?no=' + no, {
		method: 'get',
		onComplete: (response) => {
			let viewer = document.querySelector('#review-viewer');
			viewer.innerHTML = response.responseText;
			viewer.classList.add('show');
			document.body.classList.add('open');
		}
	})
}
</script>
<jsp:include page="adm.footer.jsp" />