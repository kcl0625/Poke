<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.ItemDAO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="shopBean" class="order.ItemDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

ItemDAO dao = new ItemDAO();
ArrayList<ItemDTO> shopItem = new ArrayList<ItemDTO>();

if(cate.equals("전체")){
	shopItem = shopBean.getShop();
} else {
	shopItem = shopBean.getShop(cate);
}

for(int i=0;i<shopItem.size();i++) {
	int no = shopItem.get(i).getNo();
	String name = shopItem.get(i).getName();
	int price = shopItem.get(i).getPrice();%>
	<li id="item_<%=no %>">
		<div class="img" onclick="showDesc(<%=no%>);"></div>
		<div class="content-bottom">
			<p class="name"><%=name %></p>
			<span class="price">￦<%=price %></span>
						
			<form name="">
				<a>+</a><input type="number" id="qua_<%=no %>" name="qua_<%=no %>" value="1"><a>-</a>
				<button class="cart"><i class="fas fa-shopping-cart"></i></button>
			</form>
		</div>
	</li>
<%}%>