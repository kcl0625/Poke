<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="review.*"%>

<jsp:useBean id="reviewBean" class="review.ReviewDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));

ReviewDAO dao = new ReviewDAO();
ArrayList<ReviewDTO> review = reviewBean.showReview(no);

int star = review.get(0).getStar();
String content = review.get(0).getContent();
%>
<div id="mask"></div>
<div class="review-viewer theme-box round">
	<div class="photo"></div>
	
	<div class="review-area">
		<div class="review-header">
			<p>별점: <%=star %></p>
		</div>
		<div class="review-content">
			<p><%=content %></p>
		</div>
	</div>
</div>