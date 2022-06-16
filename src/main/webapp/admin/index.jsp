<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="member.*" %>
<%@page import="order.OrderDAO" %>
<%@page import="order.OrderDTO" %>
<%@ page import="bbs.board.*"%>
<%@include file="/config.jsp" %>

<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="tbl-section">
		<h2 class="tbl-title">최근 주문</h2>
		<a href="orderList.jsp?page=0">전체보기</a>
		<table>
			<tr>
				<th>주문 번호</th>
				<th>아이디</th>
				<th>주문자명</th>
				<th>총 구매액수</th>
				<th>주문일자</th>
				<th></th>
			</tr>
			<%
			OrderDAO oDAO = new OrderDAO();
			ArrayList<OrderDTO> order = oDAO.getOrderList(0, 5);
			for(int i = 0;i<order.size();i++){%>
				<tr>
					<td><%=order.get(i).getNo() %></td>
					<td><%=order.get(i).getId() %></td>
					<td><%=order.get(i).getName() %></td>
					<td><%=String.format("%,d", order.get(i).getPrice()) %></td>
					<td><%=order.get(i).getDate() %></td>
					<td><a class="ui-btn point" href="showOrder.jsp?no=<%=order.get(i).getNo() %>&id=<%=order.get(i).getId()%>">자세히 보기</a></td>
				</tr>
			<%} %>
		</table>
	</div>

	<div class="tbl-section">
		<h2 class="tbl-title">최근 가입 회원</h2>
		<a href="memberList.jsp?page=0">전체보기</a>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>가입일자</th>
				<th></th>
				<th></th>
			</tr>
			<%
			MemberDAO mDAO = new MemberDAO();
			ArrayList<MemberDTO> member = mDAO.getMemberList(0, 5);
			for(int i = 0;i<member.size();i++){%>
				<tr>
					<td><%=member.get(i).getId() %></td>
					<td><%=member.get(i).getName() %></td>
					<td><%=member.get(i).getNick() %></td>
					<td><%=member.get(i).getDate() %></td>
					<td><a class="ui-btn" href="<%=root %>/bbs/editMem.jsp?memId=<%=member.get(i).getId() %>">회원 수정</a></td>
					<td><a class="ui-btn point" href="<%=root %>/bbs/delMem.jsp?memId=<%=member.get(i).getId() %>">회원 삭제</a></td>
				</tr>
			<%} %>
		</table>
	</div>
	
	<div class="tbl-section">
		<h2 class="tbl-title">최근 리뷰</h2>
		<a href="reviewList.jsp?page=0">전체보기</a>
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
		<%
		BoardDAO bdao = new BoardDAO();
		ArrayList<BoardDTO> review = bdao.getReviewList(0, 5);
		for (int i=0;i<review.size();i++) {%>
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
</div>
<jsp:include page="adm.footer.jsp" />