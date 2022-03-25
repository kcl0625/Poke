<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="review.*"%>

<jsp:useBean id="reviewBean" class="review.ReviewDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));

ArrayList<ReviewDTO> review = reviewBean.showReview(no);

int star = review.get(0).getStar();
String content = review.get(0).getContent();
%>

<a class="close" href="javascript:closeReview();">
	<span></span>
	<span></span>
</a>
<div class="theme-box round">
	<div class="photo"></div>
	
	<div class="review-area">
		<div class="review-header">
			<div class="user-info">
				<div class="pic"></div>
				<p class="name">이름이름</p>
			</div>
			<div class="poke-info">
				<p class="poke-name">POKE - 1</p>
				<p class="poke-ingre">재료1/재료2/재료3/재료4</p>
				<div class="star-ratings">
					<%for(int i=5;i>=1;i--){%>
						<input type="radio" id="<%=i %>-star" name="rating" value="<%=i %>" v-model="ratings" onclick="return false;" <%if (i == star) { %> checked="true" <%} %> />
						<label for="<%=i %>-star" class="star pr-<%=i %>"><i class="fas fa-star"></i></label>
					<%}%>
				</div>
				<div class="add-btns">
					<a href="">이 구성으로 담기</a>/
					<a href="">수정하기</a>
				</div>
			</div>
		</div>
		<div class="review-content">
			<p><%=content %></p>
		</div>
	</div>
</div>