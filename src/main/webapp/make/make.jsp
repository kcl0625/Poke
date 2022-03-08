<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/make.css">
<div class="wrapper">
	<div class="making">
		<h1><span class="point salmon">M</span>ake<br>M<span class="point salary">y</span><br><span class="point cheese">O</span>wn<br>B<span class="point salmon">o</span>wl</h1>
		<div class="slider">
			<div class="category">
				<ul>
					<li data-cate="육류">육류</li>
					<li data-cate="해산물">해산물</li>
					<li data-cate="야채 & 과일">야채 & 과일</li>
					<li data-cate="곡물">곡물</li>
					<li data-cate="견과류">견과류</li>
					<li data-cate="치즈">치즈</li>
					<li data-cate="소스">소스</li>
				</ul>
			</div>
			<div class="btn prev" onclick="prev();"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg></div>
			<div class="btn next" onclick="next();"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 0,50"/></svg></div>
			
			<div class="slider-container">
				<ul>
					<li data-name="불고기" data-price="1000" data-cal="100" data-origin="소고기: 국내산/마늘: 국내산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/meat/bulgogi.png"></div>
						<span class="name">불고기</span>
					</li>
					<li data-name="아보카도" data-price="1500" data-cal="220" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/vegeNfru/avocado.png"></div>
						<span class="name">아보카도</span>
					</li>
					<li data-name="연어" data-price="2500" data-cal="230" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/seafood/salmon.png"></div>
						<span class="name">연어</span>
					</li>
					<li data-name="참치" data-price="3500" data-cal="300" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/seafood/tuna.png"></div>
						<span class="name">참치</span>
					</li>
					<li data-name="방울토마토" data-price="1000" data-cal="310" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/vegeNfru/cherryTomato.png"></div>
						<span class="name">방울토마토</span>
					</li>
					<li data-name="고수" data-price="1500" data-cal="120" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/vegeNfru/coriander.png"></div>
						<span class="name">고수</span>
					</li>
					<li data-name="귀리" data-price="1500" data-cal="120" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/etc/oats.png"></div>
						<span class="name">귀리</span>
					</li>
					<li data-name="양송이" data-price="1500" data-cal="120" data-origin="재료1: 00산/재료2: 00산/재료3: 00산" onmouseover="showInfo(this);" onmouseout="hideInfo(this);" ondragstart="dragStart(this);">
						<div class="item" draggable="true"><img src="${pageContext.request.contextPath}/data/ingre/etc/whiteMushroom.png"></div>
						<span class="name">양송이</span>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="form-wrapper">
			<form name="menu" method="post" action="${pageContext.request.contextPath}/bbs/menuRes.jsp">
				<div id="bowl" ondragover="drop();" ondrop="addItem(event);">
					<div class="write-name">
						<input type="text" name="poke_name" id="poke_name" onsubmit="return false;" value="POKE">
						<hr class="line">
					</div>
					<span class="indicator"></span>
					<svg viewBox="0 0 100 50"><path class="stroke only" d="M99.5,0c0,27.339-22.162,49.5-49.5,49.5C22.662,49.5,0.5,27.339,0.5,0" /></svg>
				</div>
				
				<div class="receipt">
					<input type="hidden" name="ingre">
					<div class="paper">
						<div class="head">
							<legend>receipt</legend>
							<a class="clear" href="javascript:clear();"><i class="fas fa-trash"></i></a>
						</div>
						<div class="list">
							<ul></ul>
						</div>
						<div class="total">
							<p class="price"><input type="text" name="price" value="￦0" readonly></p>
							<p class="cal"><input type="text" name="cal" value="0kcal" readonly></p>
						</div>
					</div>
					<button type="button" class="ui-btn point big full" onclick="addCart(event);">담기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/make.js"></script>
<jsp:include page="/footer.jsp" />