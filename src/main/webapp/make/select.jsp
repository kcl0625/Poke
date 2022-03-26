<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.IngreDTO"%>
<%@ page import="order.IngreDAO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="ingreBean" class="order.IngreDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

IngreDAO dao = new IngreDAO();
ArrayList<IngreDTO> ingre = ingreBean.selectCate(cate);

for(int i=0;i<ingre.size();i++) {
	String name = ingre.get(i).getName();
	int price = ingre.get(i).getPrice();
	double cal = ingre.get(i).getCal();
	String origin = ingre.get(i).getOrigin();
	String fileName = ingre.get(i).getFileName();
	%>
	<li data-name="<%=name %>" data-price="<%=price %>" data-cal="<%=cal %>" data-origin="<%=origin %>" ondragstart="dragStart(this);" onmouseenter="showInfo(this, event);" onmouseleave="hideInfo(this, event);">
		<div class="item" draggable="true"><img src="<%=root %>/data/ingre/<%=fileName %>.png"></div>
		<span class="name"><%=name %></span>
	</li>
<%}%>