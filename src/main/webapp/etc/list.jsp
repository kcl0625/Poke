<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.ItemDTO"%>
<%@page import="order.ItemDAO"%>

<%@include file="/config.jsp" %>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");
int pageNum = Integer.parseInt(request.getParameter("page"));

ItemDAO dao = new ItemDAO();
ArrayList<ItemDTO> pokeList = dao.getPokeList(cate, pageNum, 3);%>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/etc.css">
<div class="wrapper">
	<div class="page-title">
		<h2><span class="point salmon">S</span>hop</h2>
		<p class="sub">포케 말고도 다른 하와이안 음식을 즐겨보세요<br>무엇이 있을까요?</p>	
	</div>
	
	<div class="page category">
		<ul>
			<li <%if (cate.equals("전체")) out.println("class=\"cur\"");%>>
				<a href="list.jsp?cate=전체&page=0">전체</a>
			</li>
			<%
			ArrayList<CategoryDTO> cateList = categoryBean.getCategory("etc");
			int total = cateList.size();
			for(int i=0;i<total;i++){%>
				<li <%if (cate.equals(cateList.get(i).getName())) out.println("class=\"cur\"");%>>
					<a href="list.jsp?cate=<%=cateList.get(i).getName()%>&page=0"><%=cateList.get(i).getName()%></a>
				</li>
			<%} %>
		</ul>
	</div>
	
	<div class="list">
		<ul>
			<%
			ArrayList<ItemDTO> etcItem = new ArrayList<ItemDTO>();
			
			if(cate.equals("전체")){
				etcItem = dao.getEtc(pageNum, 9);
			} else {
				etcItem = dao.getEtc(cate, pageNum, 9);
			}
			
			for(int i=0;i<etcItem.size();i++) {
				String no = etcItem.get(i).getNo();
				String name = etcItem.get(i).getName();
				int price = etcItem.get(i).getPrice();
				String filename = etcItem.get(i).getFilename();%>
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
		<nav>
			<%
			int pageMax = 0;
			if (cate.equals("전체")) pageMax = dao.getEtcListPageMax(9); 
			else pageMax = dao.getEtcListPageMax(cate, 9);
			for(int i=0;i<pageMax;i++){%>
				<a href="list.jsp?cate=<%=cate%>&page=<%=i%>"><%=i+1 %></a>
			<%} %>
		</nav>
	</div>
	
	<div id="popup"></div>
	
	<script>
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