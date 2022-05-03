<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="order.OrderDTO"%>
<%@page import="order.ItemDTO"%>
<%@page import="member.MemberDTO"%>

<jsp:useBean id="memberBean" class="member.MemberDAO" />
<jsp:useBean id="orderBean" class="order.OrderDAO" />
<%
if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
if (isAdm == 1) {
	out.write("<script>잘못된 접근입니다</script>");
}
MemberDTO member = memberBean.getMember(sessionId);
%>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper">
	<jsp:include page="submenu.jsp" />

	<div class="profile">
		<div class="pic"></div>
		<div class="info">
			<div class="name">
				<h2><%=member.getNick() %></h2>
				<a href="edit.jsp"><i class="fas fa-cog"></i></a>
			</div>
			<div class="sub-info">
				<p>작성리뷰<span>00</span></p>
				<p>보유 포인트<span>0,000</span></p>
			</div>
		</div>
	</div>
	<div class="procedure">
		<a href="">운송장 번호 조회</a>
		<div>
			<p class="num">1</p>
			<span>주문완료</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">2</p>
			<span>입금확인</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">3</p>
			<span>배송준비</span>
		</div>
		<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"></polyline></svg>
		<div>
			<p class="num">4</p>
			<span>배송완료</span>
		</div>
	</div>
	<div class="plan order-list-container">
		<div class="top">
			<h2>My POKE</h2>
			<%OrderDTO pokeOrder = orderBean.getPokeOrder(sessionId);
			ArrayList<ItemDTO> pokeOrderArr = pokeOrder.getPoke();
			
			int total = 0;
			int week = 0;
			if(pokeOrderArr != null) {
				total = pokeOrderArr.size();
				week = pokeOrder.getWeek();
			}%>
			<span><%=week%> week plan</span>
		</div>
			
		<div class="list">
			<ul>
				<%if(pokeOrderArr != null) {
					for(int i=0;i<total;i++){%>
					<li class="theme-box round">
						<div class="img">
							<%if (pokeOrderArr.get(i).getFilename() != null) { %>
								<img src="<%=root %>/data/poke/<%=pokeOrderArr.get(i).getFilename()%>">
							<%} else { %>
								<svg viewBox="0 0 50 33.431"><path class="stroke only" d="M49.5,8.431c0,13.53-10.968,24.5-24.5,24.5 c-13.531,0-24.5-10.97-24.5-24.5 M13.377,12.084c-2.762,0-5,2.218-5,4.953c0,2.736,2.238,4.956,5,4.956s5-2.22,5-4.956 C18.377,14.302,16.139,12.084,13.377,12.084z M33.276,14.931c-2.761,0-5,2.314-5,5.17c0,2.854,2.239,5.17,5,5.17s5-2.316,5-5.17 C38.276,17.245,36.037,14.931,33.276,14.931z M27.085,0.5c-2.762,0-5.001,2.282-5.001,5.097c0,2.814,2.239,5.096,5.001,5.096 c2.761,0,4.999-2.281,4.999-5.096C32.084,2.782,29.846,0.5,27.085,0.5z"/></svg>
							<%} %>
						</div>
						<div class="content-right">
							<div class="info">
								<p class="name"><%=pokeOrderArr.get(i).getName() %></p>
								<p class="ingre"><%=pokeOrderArr.get(i).getIngre() %></p>
								<p class="day"><%=pokeOrderArr.get(i).getDay() %></p>
							</div>
						</div>
					</li>
					<%}	
				} else {
					out.println("<p class=\"txt-center\">메뉴 주문 내역이 없습니다</p>");
				} %>
			</ul>
		</div>
	</div>
	<div class="etc order-list-container">
		<div class="top">
			<h2>Etc</h2>
		</div>
			
		<div class="list">
			<ul>
				<% ArrayList<ItemDTO> etcArr = orderBean.getEtcOrder(sessionId);
				for (int i=0;i<etcArr.size();i++){%>
					<li class="theme-box round">
						<p class="name"><%=etcArr.get(i).getName() %> * <%=etcArr.get(i).getQuantity() %></p>
						<p class="price"><%=String.format("%,d", etcArr.get(i).getPrice() * etcArr.get(i).getQuantity()) %></p>
					</li>
				<%} %>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />