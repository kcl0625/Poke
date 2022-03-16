<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
<div id="fullpage">
<div class="wrapper section">
	<div id="ingre-wrapper">
		<div class="row">
			<div class="item"></div>
			<div class="item"></div>
			<div class="item">
				<svg viewBox="0 0 50 50" style="transform:scaleX(-1);"><path class="stroke only" d="M10,0C4.5,0,0,4.5,0,10v40h40c5.5,0,10-4.5,10-10V0H10z"/></svg>
			</div>
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path1"><path class="fill salmon" d="M9.998,50h40V0h-50v40C-0.002,45.5,4.498,50,9.998,50z"/></clipPath>
					<path class="fill salmon" d="M9.998,50h40V0h-50v40C-0.002,45.5,4.498,50,9.998,50z"/>
					<image x="-6" y="4" href="${pageContext.request.contextPath}/data/ingre/vegeNfru/coriander.png" clip-path="url(#path1)"></image>
				</svg>
			</div>
			<div class="item"></div>
		</div>
		
		<div class="row">
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path2"><path d="M49.998,40V0h-50v49.999h40C45.498,50,49.998,45.5,49.998,40z"/></clipPath>
					<path class="fill cheese" d="M49.998,40V0h-50v49.999h40C45.498,50,49.998,45.5,49.998,40z"/>
					<image x="-10" y="3" href="${pageContext.request.contextPath}/data/ingre/etc/whiteMushroom.png" clip-path="url(#path2)"></image>
				</svg>
			</div>
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path3"><circle cx="25" cy="25" r="25"/></clipPath>
					<circle class="fill salary" cx="25" cy="25" r="25"/>
					<image x="15" y="13" href="${pageContext.request.contextPath}/data/ingre/seafood/salmon.png" clip-path="url(#path3)"></image>
				</svg>
				
			</div>
			<div class="item">
				<svg viewBox="0 0 50 50" style="transform:scaleY(-1);"><path class="stroke only salary" d="M0,50h40c5.5,0,10-4.5,10-10V0L0,50z"/></svg>
			</div>
			<div class="item"></div>
			<div class="item">
				<svg viewBox="0 0 50 50"><path class="stroke only" d="M40,0H0v50h40c5.5,0,10-4.5,10-10V10C50,4.5,45.5,0,40,0z"/></svg>
			</div>
		</div>
		
		<div class="row">
			<div class="item"></div>
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path4"><path d="M50,10c0-5.5-4.5-10-10-10H10C4.5,0,0,4.5,0,10v30c0,5.5,4.5,10,10,10h40V10z"/></clipPath>
					<path class="fill salmon" d="M50,10c0-5.5-4.5-10-10-10H10C4.5,0,0,4.5,0,10v30c0,5.5,4.5,10,10,10h40V10z"/>
					<image x="-8" y="13" href="${pageContext.request.contextPath}/data/ingre/etc/oats.png" clip-path="url(#path4)"></image>
				</svg>
			</div>
			<div class="item"></div>
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path5"><polygon points="50,0 50,50 0,50 "/></clipPath>
					<polygon class="fill cheese" points="50,0 50,50 0,50 "/>
					<image x="-8" y="16" href="${pageContext.request.contextPath}/data/ingre/vegeNfru/avocado.png" clip-path="url(#path5)"></image>
				</svg>
			</div>
			<div class="item"></div>
		</div>
		
		<div class="row">
			<div class="item">
				<svg viewBox="0 0 50 50"><polygon class="stroke only cheese" points="0,0 50,50 0,50 "/></svg>
			</div>
			<div class="item">
				<svg viewBox="0 0 50 50"><path class="stroke only" d="M40,0H0v50h50V10C50,4.5,45.5,0,40,0z"/></svg>
			</div>
			<div class="item"></div>
			<div class="item">
				<svg viewBox="0 0 50 50"><circle class="stroke only salmon" cx="25" cy="25" r="25"/></svg>
			</div>
			<div class="item">
				<svg viewBox="0 0 50 50">
					<clipPath id="path6"><path d="M10,0C4.5,0,0,4.5,0,10v30c0,5.5,4.5,10,10,10h30c5.5,0,10-4.5,10-10V0H10z"/></clipPath>
					<path class="fill salary" d="M10,0C4.5,0,0,4.5,0,10v30c0,5.5,4.5,10,10,10h30c5.5,0,10-4.5,10-10V0H10z"/>
					<image x="15" y="-3" href="${pageContext.request.contextPath}/data/ingre/vegeNfru/cherryTomato.png" clip-path="url(#path6)"></image>
				</svg>
			</div>
		</div>
	</div>
	
	<div class="main-txt">
		<h1><span class="point salmon">D</span>esign <span class="point salary">Y</span>our<br>
		<span class="point cheese">O</span>wn <span class="point salmon">B</span>owl
		</h1>
		
		<p class="sub-txt">; one of the Hawaiian dishes,<br>in which diced fish served</p>
		<h2 class="sub-title">내가 좋아하는 것들만 담아서</h2>
	</div>
</div>
<div class="wrapper section">
	<div class="img"><img src="${pageContext.request.contextPath}/img/main-img.png" alt="main-img"></div>
	<div class="txt-area">
		<h2 class="section-title"><span class="point salmon">P</span>O<span class="point cheese">K</span><span class="point salary">E</span>(포케)가 뭔가요?</h2>
		<p class="section-txt">
			포케는 하와이 사람들이 생선을 소금, 해초, 으깬 이아모나, 쿠쿠이 너트 등에 버무려 즐긴 것에서 시작되었어요. 과거 하와이에는 세계 각국에서 이민자들이 몰려왔는데요, 이 이주민들의 모국의 식재료를 더하면서 포케가 다양해졌어요.
			오늘날에는 후리카케 연어, 문어, 육포, 포르투갈식 염장 대구 등 다양한 재료들이 들어가지요.<br><br>
			이제 포케는 하와이뿐만 아니라 LA, 캔자스 시티, 뉴욕 등 미국 곳곳에서 굉장히 대중적인 음식이 되었어요. 또한 미국을 넘어서 일본, 우리나라에 이르기까지 정말 많은 사람들이 포케를 맛보고 즐길 수 있습니다.
		</p>
	</div>
</div>
<div class="wrapper section">
	<div class="txt-area txt-right">
		<h2 class="section-title">Wh<span class="point salmon">a</span>t's<br>
		y<span class="point salary">o</span>ur<br>
		f<span class="point salary">a</span>v<span class="point salmon">o</span>rit<span class="point cheese">e</span>s?
		</h1>
		<p class="section-sub-title">내가 <span class="point cheese">좋아하는</span> 재료들로<br>나만의 <span class="point salmon">POKE</span>를!</p>
		<p class="section-txt">어떤 것들이 준비되어있을까요?<br>당신을 위해 다양하게 준비했어요</p>
	</div>
	
	<div class="section-content"></div>
	
	<div class="txt-area">
		<p class="section-txt">Make에서 내가 좋아하는 것들만 골라서 주문할 수 있어요.</p>
		
		<a href="${pageContext.request.contextPath}/make/make.jsp"><span class="point cheese">E</span>xpl<span class="point salmon">o</span>re <span class="point salary">N</span>ow
		<svg viewBox="0 0 25 50"><polyline class="stroke only" points="0,0 25,25 0,50"/></svg>
		</a>
	</div>
</div>
<div class="wrapper section">
	<div class="txt-area">
		<p class="section-txt">고민이 될 때에는<br>레시피 북이나<br>다른 사람의 리뷰를 참고해보는 것은 어떨까요?<br><br>
		분명 마음에 드는 것을 찾을 수 있을 거예요.</p>
	</div>
	
	<div class="section-content"></div>
	
	<div class="txt-area">
		<p class="section-txt">Bowls에서는 저희가 추천하는 조합을 선택하고,<br>내가 원하는대로 수정할 수 있어요.</p>
	</div>
</div>
<div class="wrapper section">
	<div class="txt-area">
		<p>각 포케별로 요일을 선택하고</p>
	</div>
	
	<div class="section-content" style="width: 50%; margin: 0 auto;">
		<ul>
			<li>1 week</li>
			<li>2 week</li>
			<li>3 week</li>
			<li>4 week</li>
		</ul>
	</div>
	
	<div class="txt-area">
		<p>내가 원하는 기간만큼 구독할 수 있어요.</p>
	</div>
</div>
</div>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fullpage.css">
<script src="${pageContext.request.contextPath}/js/fullpage.js"></script>
<script>
new fullpage('#fullpage', {
	licenseKey: '',
	scrollingSpeed: 1500
});
</script>
<jsp:include page="footer.jsp" />