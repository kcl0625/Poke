<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.*" %>
<%@page import="order.*" %>
<%@page import="order.cart.*" %>
<%@include file="/config.jsp" %>

<%
if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
if (isAdm == 1) {
	out.write("<script>alert('관리자는 주문할 수 없습니다');location.href = '" + root + "/index.jsp';</script>");
}%>

<link rel="stylesheet" href="<%=root %>/css/make.css">
<script src="<%=root %>/js/make.js"></script>
<jsp:include page="/header.jsp" />

<div class="wrapper">
	<div class="show-tooltip">
		<p><i class="fas fa-info-circle"></i> 도움말</p>
											
		<div class="tooltip theme-box solid round" style="width: 15em;">
			<p>재료 슬라이더에서 재료를 드래그해서 그릇에 담아보세요</p>
		</div>
	</div>

	<div class="making">
		<h1><span class="point salmon">M</span>ake<br>M<span class="point salary">y</span><br><span class="point cheese">O</span>wn<br>B<span class="point salmon">o</span>wl</h1>
		<div class="category">
			<ul>
				<%
				CategoryDAO categoryDAO = new CategoryDAO();
				ArrayList<CategoryDTO> cateList = categoryDAO.getCategory("make");
				int total = cateList.size();
				for(int i=0;i<total;i++){%>
					<li data-cate="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.cate);"><%=cateList.get(i).getName()%></li>
				<%} %>
			</ul>
		</div>
		
		<div class="slider">
			<div class="btn prev"><svg viewBox="0 0 25 50" onclick="prev();"><polyline class="stroke only" points="25,0 0,25 25,50"/></svg></div>
			<div class="btn next"><svg viewBox="0 0 25 50" onclick="next();"><polyline class="stroke only" points="0,0 25,25 0,50"/></svg></div>
			
			<div class="slider-container"><ul></ul></div>
			<script>
			selectCategory = (cate) => {
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
						document.querySelector('.slider-container ul').innerHTML = response.responseText;
						slide();
					}
				})
			}
			
			selectCategory('<%=cateList.get(0).getName()%>');
			</script>
		</div>
		<%
		CartDAO cartDAO = new CartDAO();
		ArrayList<ItemDTO> cartList = cartDAO.getPokeCart(sessionId);
		int pokeSize = cartList.size();
		%>
		<div class="form-wrapper">
			<form name="menu" method="post" action="<%=root %>/member/addCart.jsp" style="width: 100%;">
				<input type="hidden" name="ingre">
				<input type="hidden" name="price">
				<input type="hidden" name="cal">
				
				<div id="bowl" ondragover="drop();" ondrop="addItem(event);">
					<div class="write-name">
						<input type="text" name="name" id="name" onsubmit="return false;" value="POKE - <%=pokeSize + 1%>">
						<hr class="line">
					</div>
					<span class="indicator">이름을 지어보세요</span>
					<svg viewBox="0 0 100 50"><path class="stroke only" d="M99.5,0c0,27.339-22.162,49.5-49.5,49.5C22.662,49.5,0.5,27.339,0.5,0" /></svg>
				</div>
				
				<div class="receipt">
					<div class="paper">
						<div class="head">
							<legend>receipt</legend>
							<a class="clear" href="javascript:clear();"><i class="fas fa-trash"></i></a>
						</div>
						<div class="list">
							<ul></ul>
						</div>
						<div class="total">
							<p id="price">￦0</p>
							<p id="cal">0kcal</p>
						</div>
					</div>
					<div class="btns">
						<button id="submit" type="button" class="ui-btn point big">담기</button>
						<button type="button" class="ui-btn big" onclick="location.href='<%=root %>/member/cart.jsp'">장바구니로</button>
					</div>
				</div>
			</form>
			<script>
			let submitBtn = document.querySelector("#submit");
			
			submitBtn.addEventListener('click', () => {
				let no = Math.floor(Math.random() * 90000 + 10000);
				menuSubmit(no, 'poke', menu.name.value, menu.price.value, 1);
			})
			</script>
		</div>
	</div>
</div>
<div id="popup"></div>
<jsp:include page="/footer.jsp" />