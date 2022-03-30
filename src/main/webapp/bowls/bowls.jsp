<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.ItemDTO" %>
<%@include file="/config.jsp" %>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />
<jsp:useBean id="pokeBean" class="order.ItemDAO" />

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/bowls.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">B</span>owls</h2>
		<p class="sub">직접 고르기 힘드시죠?<br>이런 메뉴들은 어떠세요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<%
			ArrayList<CategoryDTO> cateList = categoryBean.getCategory("make");
			int cateSize = cateList.size();
			for(int i=0;i<cateSize;i++){%>
					<li data-cate="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.cate)"><%=cateList.get(i).getName()%></li>
			<%} %>
		</ul>
	</div>
	
	<div class="list">
		<%ArrayList<ItemDTO> pokeList = pokeBean.getPoke();
		int pokeSize = pokeList.size();%>
		<p class="result">전체 - 총 <%=pokeSize %>개</p>

		<ul>
			<% for(int i=0;i<pokeSize;i++){
				int no = pokeList.get(i).getNo();
				String name = pokeList.get(i).getName();
				String desc = pokeList.get(i).getDescription();
				String ingre = pokeList.get(i).getIngre();
				int price = pokeList.get(i).getPrice();
				String filename = pokeList.get(i).getFilename();
				int custom = pokeList.get(i).getCustom();%>
					<li id="poke_<%=no %>" data-name="<%=name%>" data-price="<%=price%>" data-ingre="<%=ingre%>">
						<div class="img" style="background-image:url('<%=root%>/data/poke/<%=filename%>');"></div>
						<h2 class="name"><%=name %></h2>
						<p class="sub"><%=desc %><br><span class="ingre"><%=ingre %></span></p>
						<p class="price">￦<%=String.format("%,d", price)%></p>
						
						<div class="add">
							<a href="javascript:void(0);"
							<%if(isMem == 1 && isAdm == 0) {%>onclick="addMenu(<%=no %>, 'poke', '<%=name%>', '<%=ingre%>', <%=price%>, <%=custom%>);"<%}
							else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>>이대로 담기</a> / <a>수정하기</a>
							<svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg>
						</div>
					</li>
			<%} %>
		</ul>
	</div>
	
	<div class="search">
		<form name="search">
			<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
			<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
	C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
		</form>
	</div>
	
	<div class="paging">
		<div class="btn prev"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg></div>
		<nav>
			<a class="cur">1</a>
			<a>2</a>
			<a>3</a>
			<a>4</a>
			<a>5</a>
		</nav>
		<div class="btn next"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg></div>
	</div>
	
	<div id="mask"></div>
	<div id="popup"></div>
</div>
<jsp:include page="/footer.jsp" />