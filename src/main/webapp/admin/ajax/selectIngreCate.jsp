<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.IngreDTO"%>
<%@ page import="order.IngreDAO"%>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

IngreDAO dao = new IngreDAO();
ArrayList<IngreDTO> ingre = dao.selectCate(cate);

for(int i=0;i<ingre.size();i++) {
	String name = ingre.get(i).getName();
	int price = ingre.get(i).getPrice();
	double cal = ingre.get(i).getCal();
	String origin = ingre.get(i).getOrigin();
	String fileName = ingre.get(i).getFileName();%>
	<li data-name="<%=name %>" data-price="<%=price%>" data-cal="<%=cal %>" onclick="addItem(this);">
		<div class="item"><img src="<%=root %>/data/ingre/<%=fileName %>"></div>
		<p class="name"><%=name %></p>
		
		<div class="theme-box round solid ingre-info">
			<%=cal %>kcal<br>
			￦<%=String.format("%,d", price) %><br>
			<%=origin %>
		</div>
	</li>
<%}%>