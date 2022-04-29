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
	shopItem = shopBean.getEtc();
} else {
	shopItem = shopBean.getEtc(cate);
}

for(int i=0;i<shopItem.size();i++) {
	String no = shopItem.get(i).getNo();
	String name = shopItem.get(i).getName();
	int price = shopItem.get(i).getPrice();
	String filename = shopItem.get(i).getFilename();%>
	<li id="item_<%=no %>">
		<div class="img" onclick="showDesc(<%=no%>);" style="background-image: url('<%=root %>/data/mealkit/<%=filename %>');"></div>
		<div class="content-bottom">
			<p class="name"><%=name %></p>
			<span class="price">￦<%=String.format("%,d", price) %></span>
			<div class="qua">
				<a href="javascript:void(0);" onclick="adjust('+', this)">+</a>
				<input type="number" name="quantity" value="1">
				<a href="javascript:void(0);" onclick="adjust('-', this)">-</a>
				<button class="cart" type="button"
					<%if(isMem == 1 && isAdm == 0) {%>onclick="addCart(<%=no%>, 'etc', '<%=name%>', this.closest('.qua').querySelector('input').value, '<%=price%>');"<%}
					else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>><i class="fas fa-shopping-cart"></i></button>
			</div>
		</div>
	</li>
<%}%>