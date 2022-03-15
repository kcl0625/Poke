<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
<%
String[] day = {"월", "화", "수", "목", "금", "토", "일"};
String[] dayEng = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
%>
<div class="wrapper">
	<form name="cart" method="post">
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
								<li class="select-item" data-data="1" style="--i: 1;">1주</li>
								<li class="select-item" data-data="2" style="--i: 2;">2주</li>
								<li class="select-item" data-data="3" style="--i: 3;">3주</li>
								<li class="select-item" data-data="4" style="--i: 4;">4주</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="item-list">
					<ul>
						<li class="theme-box round">
							<div class="img"></div>
							<div class="poke-info">
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
						
					</ul>
				</div>
			</div>
		</div>
	</form>
</div>
<jsp:include page="/footer.jsp" />