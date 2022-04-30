<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="order.OrderDTO"%>

<%
if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
if (isAdm == 1) {
	out.write("<script>잘못된 접근입니다</script>");
}%>

<jsp:useBean id="orderBean" class="order.OrderDAO" />
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper">
	<jsp:include page="submenu.jsp" />

	<div class="profile">
		<div class="pic"></div>
		<div class="info">
			<div class="name">
				<h2>별명</h2>
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
	<div class="plan">
		<div class="top">
			<h2>My POKE</h2>
			<%ArrayList<OrderDTO> pokeOrderList = orderBean.getPokeOrder(sessionId);
			int total = pokeOrderList.size();%>
			<span><%if (total != 0) out.println(pokeOrderList.get(0).getWeek());
			else out.println(0);%> week plan</span>
		</div>
			
		<div class="list">
			<ul>
				<%for(int i=0;i<total;i++){%>
					<li class="theme-box round">
						<div class="img">
							
						</div>
						<div class="content-right">
							<div class="info">
								<p class="name"><%=pokeOrderList.get(i).getName() %></p>
								<p class="ingre"><%=pokeOrderList.get(i).getIngre() %></p>
								<p class="day"><%=pokeOrderList.get(i).getDay() %></p>
							</div>
						</div>
					</li>
				<%} %>
			</ul>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />