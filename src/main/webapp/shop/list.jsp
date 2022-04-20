<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.ItemDTO"%>

<%@include file="/config.jsp" %>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/shop.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">S</span>hop</h2>
		<p class="sub">포케 말고도 다른 하와이안 음식을 즐겨보세요<br>무엇이 있을까요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<li data-cate="전체" onclick="selectCategory(this.dataset.cate)">전체</li>
			<%
			ArrayList<CategoryDTO> cateList = categoryBean.getCategory("shop");
			int total = cateList.size();
			for(int i=0;i<total;i++){%>
					<li data-cate="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.cate)"><%=cateList.get(i).getName()%></li>
			<%} %>
		</ul>
	</div>
	
	<div class="list">
		<ul></ul>
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
	
	<div id="popup"></div>
	
	<script>
		let selectCategory = (cate) => {
			let categoryLi = document.querySelectorAll('.category li');
			for(let i=0;i<categoryLi.length;i++){
				categoryLi[i].classList.remove('cur');
				if(categoryLi[i].dataset.cate == cate)
					categoryLi[i].classList.add('cur');
			}
			
			new Ajax.Request('item.jsp?cate=' + cate, {
				method: 'get',
				parameter: cate,
				onComplete: (response) => {
					document.querySelector('.list ul').innerHTML = response.responseText;
				}
			})
		}
		
		selectCategory('전체');
		
		let showDesc = (no) => {
			let viewer = document.querySelector('#popup');
			viewer.classList.add('desc');
			viewer.classList.remove('cart');
			new Ajax.Request('view.jsp?no=' + no, {
				method: 'get',
				parameter: no,
				onComplete: (response) => {
					viewer.innerHTML = response.responseText;
					viewer.classList.add('show');
					document.body.classList.add('open');
				}
			})
		}
		
		let adjust = (opr, btn) => {
			let qua = btn.closest('.qua').querySelector('input[name="quantity"]');
			if(opr == '+') {
				qua.value++;
			} else {
				if(qua.value != 1) qua.value--;
			}
		}
	</script>
</div>
<jsp:include page="/footer.jsp" />