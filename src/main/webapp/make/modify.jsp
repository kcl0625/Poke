<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.IngreDTO" %>
<%@page import="order.ItemDTO" %>
<%@page import="order.ItemDAO" %>
<%@include file="/config.jsp" %>

<%
if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
if (isAdm == 1) {
	out.write("<script>alert('관리자는 주문할 수 없습니다');location.href = '" + root + "/index.jsp';</script>");
}
String selectedPoke = request.getParameter("name"); 
String ingreStr = request.getParameter("ingre");

ItemDAO dao = new ItemDAO();
ItemDTO poke = dao.getPoke(selectedPoke, ingreStr);
%>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />
<jsp:useBean id="ingreBean" class="order.IngreDAO" />
<jsp:useBean id="cartBean" class="order.cart.CartDAO" />

<link rel="stylesheet" href="<%=root %>/css/make.css">
<script src="<%=root %>/js/make.js"></script>
<jsp:include page="/header.jsp" />

<div class="wrapper">
	<div class="making">
		<h1><span class="point salmon">M</span>ake<br>M<span class="point salary">y</span><br><span class="point cheese">O</span>wn<br>B<span class="point salmon">o</span>wl</h1>
		<div class="category">
			<ul>
				<%
				ArrayList<CategoryDTO> cateList = categoryBean.getCategory("make");
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
		<div class="form-wrapper">
			<form name="menu" method="post" action="<%=root %>/member/modMenu.jsp" style="width: 100%;">
				<input type="hidden" name="no">
				<input type="hidden" name="ingre">
				<input type="hidden" name="price">
				<input type="hidden" name="cal">
				<div id="bowl" ondragover="drop();" ondrop="addItem(event);">
					<div class="write-name">
						<input type="text" name="name" id="name" onsubmit="return false;" value="<%=selectedPoke%>">
						<hr class="line">
					</div>
					<span class="indicator"></span>
					<svg viewBox="0 0 100 50"><path class="stroke only" d="M99.5,0c0,27.339-22.162,49.5-49.5,49.5C22.662,49.5,0.5,27.339,0.5,0" /></svg>
					
					<%int totPrice = 0;
					double totCal = 0;
										
					for (int i=0;i<poke.getIngreList().size();i++){
						String nameIngre = poke.getIngreList().get(i).getName();
						int priceIngre = poke.getIngreList().get(i).getPrice();
						double calIngre = poke.getIngreList().get(i).getCal();
						String filenameIngre = poke.getIngreList().get(i).getFileName();
						
						totPrice += priceIngre;
						totCal += calIngre;%>
						<div id="item_<%=i%>" class="item ingre_<%=i%>" onclick="dropItem(this)" onmouseenter="showInfo(this, event)" onmouseleave="hideInfo(this, event)"
						data-name="<%=nameIngre%>" data-price="<%=priceIngre%>" data-cal="<%=calIngre%>">
							<img src="<%=root%>/data/ingre/<%=filenameIngre%>">
						</div>
					<%}	%>
				</div>
				
				<div class="receipt">
					<div class="paper">
						<div class="head">
							<legend>receipt</legend>
							<a class="clear" href="javascript:clear();"><i class="fas fa-trash"></i></a>
						</div>
						<div class="list">
							<ul>
								<%for (int i=0;i<poke.getIngreList().size();i++){
									String nameIngre = poke.getIngreList().get(i).getName();
									int priceIngre = poke.getIngreList().get(i).getPrice();
									double calIngre = poke.getIngreList().get(i).getCal();
									String filenameIngre = poke.getIngreList().get(i).getFileName();%>
									<li class="ingre ingre_<%=i%>" data-name="<%=nameIngre %>">
										<span class="name"><%=nameIngre %></span>
										<span class="cal"><%=calIngre %>kcal</span>
										<span class="dot">···</span>
										<span class="price">￦<%=String.format("%,d", priceIngre) %></span>
									</li>
								<%}%>
							</ul>
						</div>
						<div class="total">
							<p id="price">￦<%=totPrice %></p>
							<p id="cal"><%=totCal %>kcal</p>
						</div>
					</div>
					<button id="submit" type="button" class="ui-btn point big full">담기</button>
				</div>
			</form>
			
			<script>
			let submitBtn = document.querySelector("#submit");
			
			submitBtn.addEventListener('click', () => {
				menuMod(menu.no.value, 'poke', menu.name.value, menu.price.value, 1);
			})
			</script>
		</div>
	</div>
</div>
<div id="popup"></div>
<jsp:include page="/footer.jsp" />