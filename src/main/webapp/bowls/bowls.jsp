<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.*" %>
<%@page import="order.ItemDAO" %>
<%@page import="order.ItemDTO" %>

<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");
int pageNum = Integer.parseInt(request.getParameter("page"));

ItemDAO dao = new ItemDAO();
ArrayList<ItemDTO> pokeList = dao.getPokeList(cate, pageNum, 3);%>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/bowls.css">
<script src="<%=root%>/js/order.js"></script>

<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">B</span>owls</h2>
		<p class="sub">직접 고르기 힘드시죠?<br>이런 메뉴들은 어떠세요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<%
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> cateList = categoryDAO.getCategory("poke");
			int cateSize = cateList.size();
			for(int i=0;i<cateSize;i++){%>
					<li <%if (cate.equals(cateList.get(i).getName())) out.println("class=\"cur\"");%>><a href="bowls.jsp?cate=<%=cateList.get(i).getName()%>&page=0"><%=cateList.get(i).getName()%></a></li>
			<%} %>
		</ul>
	</div>

	<div class="list">
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
	</div>

	<div class="search">
		<form name="search">
			<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
			<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
		C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
		</form>
	</div>
	
	<%ItemDAO itemDAO = new ItemDAO();
	int pageMax = itemDAO.getPokeListPageMax(cate, 3);%>
	<div class="paging">
		<nav>
			<%for(int i=0;i<pageMax;i++){%>
				<a href="bowls.jsp?cate=<%=cate%>&page=<%=i%>"><%=i+1 %></a>
			<%} %>
		</nav>
	</div>

	<div id="popup"></div>
</div>
<jsp:include page="/footer.jsp" />