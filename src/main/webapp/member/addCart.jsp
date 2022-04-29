<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.cart.CartDAO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="itemBean" class="order.ItemDTO">
	<jsp:setProperty name="itemBean" property="*" />
</jsp:useBean>
<jsp:useBean id="cartBean" class="order.cart.CartDAO" />
<%if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
}
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
Date date = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = format.format(date);

CartDAO dao = new CartDAO();
ItemDTO item = itemBean;

String type = String.valueOf(item.getType());
int qua = item.getQuantity();

ArrayList<ItemDTO> cartList = cartBean.getPokeCart(sessionId);
int pokeSize = cartList.size();
int max = 6;%>
<a class="close" href="javascript:close();">
	<span></span>
	<span></span>
</a>
<%if(type.equals("poke")) {
	if(pokeSize < max) {
		dao.addCart(item, sessionId, now);%>
		<div class="theme-box round">
			<p class="header">장바구니에 담겼어요</p>
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
	<% } else { %>
		<div class="theme-box round">
			<p class="header">이런!</p>
			<div class="content">
				<p>장바구니에 담을 수 없어요<br>최대 <%=max %>개까지 담을 수 있어요</p>
			</div>
		</div>
	<% }
} else {
	dao.addCart(item, qua, sessionId, now);%>
	<div class="theme-box round">
		<p class="header">장바구니에 담겼어요</p>
		<div class="content">
			<div class="top-content">
				<p class="name">
				<% out.println(item.getName());
				if(item.getQuantity() != 0)
					out.println(" * " + item.getQuantity());%>
				</p>
			<span class="border"></span>
			<p class="price">￦<%=String.format("%,d", item.getPrice()) %></p>
			</div>
			<%if (item.getIngre() != null){ %><span class="ingre"><%=item.getIngre() %></span><%} %>
		</div>
		<a href="<%=root %>/member/cart.jsp">장바구니로</a>
		<div class="clear"></div>
	</div>
<% }%>