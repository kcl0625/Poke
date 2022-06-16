<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.cart.CartDAO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="itemBean" class="order.ItemDTO">
	<jsp:setProperty name="itemBean" property="*" />
</jsp:useBean>
<%if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
}
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String no = request.getParameter("pokeNo");

int rand = (int)(Math.random() * 90000 + 10000);
no = String.valueOf(rand);

CartDAO dao = new CartDAO();
ItemDTO item = itemBean;

LocalDateTime now = LocalDateTime.now();
String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

dao.modMenu(item, no, sessionId, formatedNow);
%>
<a class="close" href="javascript:close();">
	<span></span>
	<span></span>
</a>
<div class="theme-box round">
	<p class="header">메뉴가 담겼어요</p>
	<div class="content">
		<div class="top-content">
			<p class="name"><%=item.getName() %></p>
		<span class="border"></span>
		<p class="price">￦<%=String.format("%,d", item.getPrice()) %></p>
		</div>
	</div>
	<a href="<%=root %>/member/cart.jsp">장바구니로</a>
	<div class="clear"></div>
</div>