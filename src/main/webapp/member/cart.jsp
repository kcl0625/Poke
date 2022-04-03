<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="order.ItemDTO"%>
<%@include file="/config.jsp" %>
<%if (isAdm == 1) out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
if (isMem == 0) response.sendRedirect(root + "/bbs/loginForm.jsp");%>

<jsp:useBean id="cartBean" class="order.cart.CartDAO" />

<link rel="stylesheet" href="<%=root %>/css/cart.css">
<jsp:include page="/header.jsp" />
<%
String[] day = {"월", "화", "수", "목", "금", "토", "일"};
String[] dayEng = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
%>
<div class="wrapper">
	<form name="cart" method="post" action="orderForm.jsp">
		<input type="hidden" name="planPrice">
		<input type="hidden" name="planWeek">
		<input type="hidden" name="etcPrice">
		<input type="hidden" name="totPrice">
		<input type="hidden" name="orderPlan">
		<input type="hidden" name="orderEtc">
		
		<div class="page-title">
			<h2><span class="point cheese">C</span>art</h2>	
		</div>
		<div class="cart-left">
			<div class="plan list-container">
				<div class="list-container-top">
					<h3>plan</h3>
					<div class="select">
						<input type="hidden" name="week" value="POKE - 1">
						<div class="selected select-item">1주</div>
						<div class="select-wrapper">
							<ul>
								<li class="select-item" data-data="1주" style="--i: 1;">1주</li>
								<li class="select-item" data-data="2주" style="--i: 2;">2주</li>
								<li class="select-item" data-data="3주" style="--i: 3;">3주</li>
								<li class="select-item" data-data="4주" style="--i: 4;">4주</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="item-list">
					<ul>
						<% ArrayList<ItemDTO> pokeList = cartBean.getPokeCart(sessionId);
						ArrayList<ItemDTO> etcList = cartBean.getEtcCart(sessionId);
						
						if(pokeList.size() == 0){
							out.println("<p style=\"width: 100%;\" class=\"txt-center\">내역이 없습니다</p>");
						} else {
							for(int i=0;i<pokeList.size();i++){
								String name = pokeList.get(i).getName();
								String ingre = pokeList.get(i).getIngre();
								int price = pokeList.get(i).getPrice();
								int custom = pokeList.get(i).getCustom();
								String filename = pokeList.get(i).getFilename();%>
								<li id="item_<%=i %>" class="theme-box round">
									<input type="hidden" name="poke_<%=i %>_ingre" id="poke_<%=i %>_ingre" value="<%=ingre%>">
									<input type="hidden" name="poke_<%=i %>_price" id="poke_<%=i %>_price">
									<div class="img">
										<% if(custom == 1){%>
											<svg viewBox="0 0 50 33.431"><path class="stroke only" d="M49.5,8.431c0,13.53-10.968,24.5-24.5,24.5 c-13.531,0-24.5-10.97-24.5-24.5 M13.377,12.084c-2.762,0-5,2.218-5,4.953c0,2.736,2.238,4.956,5,4.956s5-2.22,5-4.956 C18.377,14.302,16.139,12.084,13.377,12.084z M33.276,14.931c-2.761,0-5,2.314-5,5.17c0,2.854,2.239,5.17,5,5.17s5-2.316,5-5.17 C38.276,17.245,36.037,14.931,33.276,14.931z M27.085,0.5c-2.762,0-5.001,2.282-5.001,5.097c0,2.814,2.239,5.096,5.001,5.096 c2.761,0,4.999-2.281,4.999-5.096C32.084,2.782,29.846,0.5,27.085,0.5z"/></svg>
										<%} else {%>
											<img src="<%=root %>/data/poke/<%=filename%>">
										<%} %> 
									</div>
									<div class="item-info">
										<fieldset class="day">
										<%for(int j=0;j<day.length;j++) {%>
											<input type="checkbox" name="day" id="poke_<%=i %>_<%=dayEng[j]%>">
											<label for="poke_<%=i %>_<%=dayEng[j]%>"><%=day[j]%></label>
										<%} %>
										</fieldset>
										<h3 class="name"><%=name %></h3>
										<p class="ingre"><%=ingre %></p>
									</div>
									
									<p class="price">￦<%=String.format("%,d", price) %></p>
									
									<div class="qua">
										<a href="javascript:void(0);" onclick="adjust('+', this)">+</a>
										<input type="number" name="quantity" value="1">
										<a href="javascript:void(0);" onclick="adjust('-', this)">-</a>
									</div>
									<div class="btns">
										<button class="mod" type="button" onclick="modify(poke_<%=i %>_ingre.value);"><i class="fas fa-pen"></i></button>
										<button class="del" type="button"><i class="fas fa-trash"></i></button>
									</div>
								</li>
							<%}
						} %>
					</ul>
					<script>
						let modify = (ingre) => {
							
						}
					</script>
				</div>
			</div>
			<div class="etc list-container">
				<div class="list-container-top">
					<h3>etc</h3>	
				</div>
				
				<div class="item-list">
					<ul>
						<%
						if(etcList.size() == 0) {
							out.println("<p style=\"width: 100%;\" class=\"txt-center\">내역이 없습니다</p>");
						} else {
							for(int i=0;i<etcList.size();i++){
								String name = etcList.get(i).getName();
								int price = etcList.get(i).getPrice();
								int qua = etcList.get(i).getQuantity();
								String filename = etcList.get(i).getFilename();%>
								<li id="item_<%=i %>" class="theme-box round">
									<div class="img" style="background-image:url('<%=root%>/data/mealkit/<%=filename%>');"></div>
									<div class="item-info">
										<h3 class="name"><%=name %></h3>
									</div>
									
									<p class="price">￦<%=String.format("%,d", price) %></p>
									
									<div class="qua">
										<a href="javascript:void(0);" onclick="adjust('+', this)">+</a>
										<input type="number" name="quantity" value="<%=qua%>">
										<a href="javascript:void(0);" onclick="adjust('-', this)">-</a>
									</div>
									<div class="btns">
										<button class="cart" type="button"><i class="fas fa-trash"></i></button>
									</div>
								</li>
							<%}
						} %>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="cart-right">
			<div class="receipt">
				<div class="price">
					<div class="plan txt-right">
						<span class="price-name">플랜 금액</span>
						<p>(
							<span class="plan-price">￦00,000</span>*<span class="plan-week">1</span>
						)</p>
					</div>
					<div class="additional txt-right">
						<span class="price-name">추가 구매</span>
						<p>￦00,000</p>
					</div>
					<div class="ship txt-right">
						<span class="price-name">배송비</span>
						<p>￦00,000</p>
					</div>
					<span>+</span>
				</div>
				<div class="total">
					<span>total</span>
					<span class="total-price">￦00,000</span>
				</div>
			</div>
			<button class="ui-btn full point" type="submit">주문하기</button>
		</div>
	</form>
	<script>
		let adjust = (opr, btn) => {
			let qua = btn.closest('.qua').querySelector('input[name="quantity"]');
			if(opr == '+') {
				qua.value++;
			} else {
				if(qua.value != 1) qua.value--;
			}
			
			let planTot = [];
		}
		
		let planSelect = document.querySelectorAll('.select-wrapper li');
		planSelect.forEach((item, i) => {
			planSelect[i].addEventListener('click', () => {
				let week = planSelect[i].dataset.data.substr(0, 1);
				let receiptWeek = document.querySelector('.plan-week');
				receiptWeek.innerText = week;
			})
		})
	</script>
</div>
<jsp:include page="/footer.jsp" />