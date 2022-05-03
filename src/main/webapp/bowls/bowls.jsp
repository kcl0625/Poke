<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.ItemDTO" %>
<%@include file="/config.jsp" %>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />

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
			ArrayList<CategoryDTO> cateList = categoryBean.getCategory("poke");
			int cateSize = cateList.size();
			for(int i=0;i<cateSize;i++){%>
					<li data-cate="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.cate)"><%=cateList.get(i).getName()%></li>
			<%} %>
		</ul>
	</div>
	<div class="list">
		
	</div>
	<script>
	let selectCategory = (cate) => {
		let categoryLi = document.querySelectorAll('.category li');
		for(let i=0;i<categoryLi.length;i++){
			categoryLi[i].classList.remove('cur');
			if(categoryLi[i].dataset.cate == cate)
				categoryLi[i].classList.add('cur');
		}
		
		new Ajax.Request('select.jsp?cate=' + cate, {
			method: 'get',
			parameter: cate,
			onComplete: (response) => {
				document.querySelector('.list').innerHTML = response.responseText;
				slide();
			}
		})
	}
	selectCategory('<%=cateList.get(0).getName()%>');
	</script>
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

	<div id="popup"></div>
</div>
<jsp:include page="/footer.jsp" />