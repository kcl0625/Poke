<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%@ page import="order.ItemDAO"%>
<%@ page import="order.ItemDAO"%>
<%@ page import="bbs.board.*"%>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

MemberDAO mdao = new MemberDAO();
BoardDAO bdao = new BoardDAO();

int reviewNo = Integer.parseInt(request.getParameter("no"));
BoardDTO review = bdao.showReview(reviewNo);
int star = review.getStar();

MemberDTO mdto = mdao.getMember(review.getId());
%>

<a class="close" href="javascript:closeReview();">
	<span></span>
	<span></span>
</a>
<div class="theme-box round">
	<div class="photo" style="background-image:url('<%=root%>/data/review/<%=review.getFileName()%>');"></div>
	
	<div class="review-area">
		<div class="review-header">
			<div class="user-info">
				<div class="pic" style="background-image:url('<%=root%>/data/member/<%=mdto.getId()%>/<%=mdto.getProfpic() %>')"></div>
				<p class="name"><%=mdto.getNick() %></p>
			</div>
			<div class="poke-info">
				<p class="poke-name"><%=review.getPoke() %></p>
				<p class="poke-ingre"><%=review.getIngre() %></p>
				<div class="star-ratings">
					<%for(int i=5;i>=1;i--){%>
						<input type="radio" id="<%=i %>-star" name="rating" value="<%=i %>" v-model="ratings" onclick="return false;" <%if (i == star) { %> checked="true" <%} %> />
						<label for="<%=i %>-star" class="star pr-<%=i %>"><i class="fas fa-star"></i></label>
					<%}%>
				</div>
				<div class="add-btns">
					<a href="javascript:void(0);"
					<%if(isMem == 1 && isAdm == 0) {%>onclick="location.href='<%=root %>/make/modify.jsp?name=<%=review.getPoke() %>&ingre=<%=review.getIngre()%>'"<%}
					else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>>메뉴 수정하기</a>
				</div>
			</div>
		</div>
		<div class="review-content">
			<p><%=review.getContent() %></p>
		</div>
	</div>
</div>