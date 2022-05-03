<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.ItemDAO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="itemBean" class="order.ItemDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

ItemDAO dao = new ItemDAO();
ArrayList<ItemDTO> pokeList = itemBean.getPokeList(cate);%>
<p class="result">전체 - 총 <%=pokeList.size() %>개</p>
<ul>
<% for(int i=0;i<pokeList.size();i++) {
	String no = pokeList.get(i).getNo();
	String name = pokeList.get(i).getName();
	String desc = pokeList.get(i).getDescription();
	String ingre = pokeList.get(i).getIngre();
	int price = pokeList.get(i).getPrice();
	String filename = pokeList.get(i).getFilename();
	int custom = pokeList.get(i).getCustom(); %>
	<li id="poke_<%=no %>" data-name="<%=name%>" data-price="<%=price%>" data-ingre="<%=ingre%>">
		<div class="img" style="background-image:url('<%=root%>/data/poke/<%=filename%>');"></div>
		<h2 class="name"><%=name %></h2>
		<p class="sub"><%=desc %><br><span class="ingre"><%=ingre %></span></p>
		<p class="price">￦<%=String.format("%,d", price)%></p>
						
		<div class="add">
			<a href="javascript:void(0);"
			<%if(isMem == 1 && isAdm == 0) {%>onclick="addMenu(<%=no %>, 'poke', '<%=name%>', '<%=ingre%>', <%=price%>, <%=custom%>);"<%}
			else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>>이대로 담기</a> /
			<a href="javascript:void(0);"
			<%if(isMem == 1 && isAdm == 0) {%>onclick="location.href='<%=root %>/make/modify.jsp?name=<%=name %>&ingre=<%=ingre%>'"<%}
			else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>>수정하기</a>
			<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg>
		</div>
	</li>
<%}%>
</ul>