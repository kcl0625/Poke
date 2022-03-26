<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="order.ItemDTO"%>

<jsp:useBean id="itemBean" class="order.ItemDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));

ItemDTO item = itemBean.showView(no);

String desc = item.getDescription();
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
				
				<div class="add-btns">
					<a href="">이 구성으로 담기</a>/
					<a href="">수정하기</a>
				</div>
			</div>
		</div>
		<div class="review-content">
			<p><%=desc %></p>
		</div>
	</div>
</div>