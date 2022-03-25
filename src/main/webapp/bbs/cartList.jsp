<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/cart.css">
<%
String[] day = {"월", "화", "수", "목", "금", "토", "일"};
String[] dayEng = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
%>
<div class="wrapper">
	<form name="cart" method="post" action="orderForm.jsp">
		<div class="page-title">
			<h2><span class="point cheese">C</span>art</h2>	
		</div>
		<div class="cart-left">
			<div class="plan list-container">
				<div class="list-container-top">
					<h3>plan</h3>
					<div class="select">
						<input type="hidden" name="poke_name" value="POKE - 1">
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
						<li class="theme-box round">
							<div class="img"></div>
							<div class="item-info">
								<fieldset class="day">
								<%for(int i=0;i<day.length;i++) {%>
									<input type="checkbox" name="day" id="<%=dayEng[i]%>">
									<label for="<%=dayEng[i]%>"><%=day[i]%></label>
								<%} %>
								</fieldset>
								<h3 class="name">이름1</h3>
								<p class="ingre">재료1/재료2/재료3/재료4</p>
							</div>
							
							<p class="price">￦00,000</p>
							
							<fieldset class="quantity">
								<a>+</a><input type="number" name="qua"><a>-</a>
							</fieldset>
							<div class="btns">
								<button class="cart"><i class="fas fa-pen"></i></button>
								<button class="cart"><i class="fas fa-trash"></i></button>
							</div>
						</li>
						
						<li class="theme-box round">
							<div class="img"></div>
							<div class="item-info">
								<fieldset class="day">
								<%for(int i=0;i<day.length;i++) {%>
									<input type="checkbox" name="day" id="<%=dayEng[i]%>">
									<label for="<%=dayEng[i]%>"><%=day[i]%></label>
								<%} %>
								</fieldset>
								<h3 class="name">이름1</h3>
								<p class="ingre">재료1/재료2/재료3/재료4</p>
							</div>
							
							<p class="price">￦00,000</p>
							
							<fieldset class="quantity">
								<a>+</a><input type="number" name="qua"><a>-</a>
							</fieldset>
							<div class="btns">
								<button class="cart"><i class="fas fa-pen"></i></button>
								<button class="cart"><i class="fas fa-trash"></i></button>
							</div>
						</li>
						
						<li class="theme-box round">
							<div class="img"></div>
							<div class="item-info">
								<fieldset class="day">
								<%for(int i=0;i<day.length;i++) {%>
									<input type="checkbox" name="day" id="<%=dayEng[i]%>">
									<label for="<%=dayEng[i]%>"><%=day[i]%></label>
								<%} %>
								</fieldset>
								<h3 class="name">이름1</h3>
								<p class="ingre">재료1/재료2/재료3/재료4</p>
							</div>
							
							<p class="price">￦00,000</p>
							
							<fieldset class="quantity">
								<a>+</a><input type="number" name="qua"><a>-</a>
							</fieldset>
							<div class="btns">
								<button class="cart"><i class="fas fa-pen"></i></button>
								<button class="cart"><i class="fas fa-trash"></i></button>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="etc list-container">
				<div class="list-container-top">
					<h3>etc</h3>	
				</div>
				
				<div class="item-list">
					<ul>
						<li class="theme-box round">
							<div class="img"></div>
							<div class="item-info">
								<h3 class="name">이름1</h3>
							</div>
							
							<p class="price">￦00,000</p>
							
							<fieldset class="quantity">
								<a>+</a><input type="number" name="qua"><a>-</a>
							</fieldset>
							<div class="btns">
								<button class="cart"><i class="fas fa-trash"></i></button>
							</div>
						</li>
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
							<span>￦00,000</span>*<span>1</span>
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
</div>
<jsp:include page="/footer.jsp" />