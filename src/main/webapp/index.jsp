<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.IngreDTO"%>
<%@ page import="order.IngreDAO"%>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.ItemDAO"%>
<%@include file="/config.jsp" %>

<jsp:include page="header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/main.css">

	<div id= "main" class="wrapper">
		<div class="main-txt">
			<h1><span class="point salmon">D</span>esign <span class="point cheese">Y</span>our<br>
			<span class="point salary">O</span>wn <span class="point salmon">B</span>owl
			</h1>
			
			<p class="sub-txt">; one of the Hawaiian dishes,<br>in which diced fish served</p>
			<h2 class="sub-title">내가 좋아하는 것들만 담아서 만드는 나만의 포케</h2>
		</div>
		<div class="main-bg">
			<svg viewBox="0 0 150 100">
				<clipPath id="bg-mask"><path d="M1.378,0c0,0-11.667,33.5,32.883,55.199C60.379,67.921,75.105,80.167,70.027,100h80.186V0H1.378z"/></clipPath>
				<image href="<%=root %>/img/main.jpg" clip-path="url(#bg-mask)"></image>
			</svg>
		</div>
		<span class="arrow"></span>
	</div>
	<div id="about" class="wrapper">
		<div class="txt-area txt-right">
			<h2 class="section-title"><span class="point salmon">P</span>O<span class="point cheese">K</span><span class="point salary">E</span>(포케)가 뭔가요?</h2>
			<p class="section-txt">
				포케는 하와이 사람들이 생선을 소금, 해초, 으깬 이아모나, 쿠쿠이 너트 등에 버무려 즐긴 것에서 시작되었어요. 과거 하와이에는 세계 각국에서 이민자들이 몰려왔는데요, 이 이주민들의 모국의 식재료를 더하면서 포케가 다양해졌어요.
				오늘날에는 후리카케 연어, 문어, 육포, 포르투갈식 염장 대구 등 다양한 재료들이 들어가지요.<br><br>
				이제 포케는 하와이뿐만 아니라 LA, 캔자스 시티, 뉴욕 등 미국 곳곳에서 굉장히 대중적인 음식이 되었어요. 또한 미국을 넘어서 일본, 우리나라에 이르기까지 정말 많은 사람들이 포케를 맛보고 즐길 수 있습니다.
			</p>
		</div>
		<div class="img"><img src="<%=root %>/img/main-img.png" alt="main-img"></div>
	</div>
	<div id="make" class="wrapper">
		<!-- 첫번째 -->
		<div class="section-slide">
			<div class="slide-item">
				<div class="txt-area section-main-txt">
					<h2 class="section-title">Wh<span class="point salmon">a</span>t's<br>
					y<span class="point salary">o</span>ur<br>
					f<span class="point salary">a</span>v<span class="point salmon">o</span>rit<span class="point cheese">e</span>s?
					</h1>
					<p class="section-sub-title">내가 <span class="point cheese">좋아하는</span> 재료들로<br>나만의 <span class="point salmon">POKE</span>를!</p>
					<p class="section-txt">어떤 것들이 준비되어있을까요?<br>당신을 위해 다양하게 준비했어요</p>
					<a href="javascript:move();"><span class="point cheese">E</span>xpl<span class="point salmon">o</span>re <span class="point salary">N</span>ow</a>
				</div>
				
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
								<image x="-6" y="4" href="<%=root %>/data/ingre/coriander.png" clip-path="url(#path1)"></image>
							</svg>
						</div>
						<div class="item"></div>
					</div>
					
					<div class="row">
						<div class="item">
							<svg viewBox="0 0 50 50">
								<clipPath id="path2"><path d="M49.998,40V0h-50v49.999h40C45.498,50,49.998,45.5,49.998,40z"/></clipPath>
								<path class="fill cheese" d="M49.998,40V0h-50v49.999h40C45.498,50,49.998,45.5,49.998,40z"/>
								<image x="-10" y="3" href="<%=root %>/data/ingre/whiteMushroom.png" clip-path="url(#path2)"></image>
							</svg>
						</div>
						<div class="item">
							<svg viewBox="0 0 50 50">
								<clipPath id="path3"><circle cx="25" cy="25" r="25"/></clipPath>
								<circle class="fill salary" cx="25" cy="25" r="25"/>
								<image x="15" y="13" href="<%=root %>/data/ingre/salmon.png" clip-path="url(#path3)"></image>
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
								<image x="-8" y="13" href="<%=root %>/data/ingre/oats.png" clip-path="url(#path4)"></image>
							</svg>
						</div>
						<div class="item"></div>
						<div class="item">
							<svg viewBox="0 0 50 50">
								<clipPath id="path5"><polygon points="50,0 50,50 0,50 "/></clipPath>
								<polygon class="fill cheese" points="50,0 50,50 0,50 "/>
								<image x="-8" y="16" href="<%=root %>/data/ingre/avocado.png" clip-path="url(#path5)"></image>
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
								<image x="15" y="-3" href="<%=root %>/data/ingre/cherryTomato.png" clip-path="url(#path6)"></image>
							</svg>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 재료담기 -->
			<div class="slide-item">
				<div class="txt-area">
					<p>재료를 담고</p>
				</div>
				
				<div class="select select-ingre">
					<ul>
					<%IngreDAO ingreDAO = new IngreDAO();
					ArrayList<IngreDTO> ingre = ingreDAO.get5Ingre();
					
					for(int i=0;i<ingre.size();i++) {
						String fileName = ingre.get(i).getFileName();%>
						<li class="item" ondragstart="dragStart(this);" draggable="true">
							<img src="<%=root %>/data/ingre/<%=fileName %>">
						</li>
					<%}%>
					</ul>
					<span>재료들을 드래그해서 그릇에 담아주세요</span>
				</div>
			</div>
			
			<!-- 요일선택 -->
			<div class="slide-item">
				<div class="select select-day">
					<svg viewBox="0 0 100 100">
						<defs><path id="circle" d="M0,50a50,50 0 1,0 100,0a50,50 0 1,0 -100,0"></path></defs>
						<text>
							<textPath class="fill" xlink:href="#circle">
								<tspan>mon</tspan>&nbsp;&nbsp;
								<tspan>tue</tspan>&nbsp;&nbsp;
								<tspan>wed</tspan>&nbsp;&nbsp;
								<tspan>thu</tspan>&nbsp;&nbsp;
								<tspan>fri</tspan>&nbsp;&nbsp;
								<tspan>sat</tspan>
							</textPath>
						</text>
					</svg>
					
					<div class="txt-area">
						<p>요일을 선택하고</p>
					</div>
				</div>
			</div>
			<div class="slide-item">
				<div class="selected">
					<ul></ul>
				</div>
				<div class="week">
					<p>구독도 내 마음대로</p>
					<ul>
						<li class="theme-box round">1 week</li>
						<li class="theme-box round">2 week</li>
						<li class="theme-box round">3 week</li>
						<li class="theme-box round">4 week</li>
					</ul>
				</div>
			</div>
			
			<!-- fixed element -->
			<div class="bowl fixed" ondragover="drop();" ondrop="addItem(event);">
				<svg viewBox="0 0 100 50"><path class="stroke only" d="M99.5,0c0,27.339-22.162,49.5-49.5,49.5C22.662,49.5,0.5,27.339,0.5,0"></path></svg>
			</div>
			<div class="go-next-slide fixed" onclick="move()"><span class="arrow"></span>next</div>
			
			<script>
				let sectionSlide = document.querySelector('.section-slide');
				let slideItem = sectionSlide.querySelectorAll('.slide-item');
				let cur = 0;
					
				let day = sectionSlide.querySelectorAll('.select-day tspan');
				let selected = [];
				for(let i=0;i<day.length;i++){
					day[i].addEventListener('click', () => {
						day[i].classList.toggle('selected');
						selected.push(day[i].innerHTML);
					})
				}
				
				let move = () => {
					let selectedDayUl = sectionSlide.querySelector('ul');
					if (cur == 0) {
						document.querySelector('.bowl').classList.add('show');
						document.querySelector('.go-next-slide').classList.add('show');
					}
					
					if (cur < slideItem.length - 1) cur++;
					sectionSlide.style.left = -cur * 100 + 'vw';
					
					if (cur == slideItem.length - 1) {
						document.querySelector('.section-slide').classList.add('last');
						let selectedUl = document.querySelector('.selected ul');
						for(let i=0;i<selected.length;i++) {
							let li = document.createElement('li');
							selectedUl.appendChild(li);
							li.innerHTML = selected[i];
						}
					} else document.querySelector('.section-slide').classList.remove('last');
				}
				
				let dragged;
				let ingreList = [];
				let dragStart = (item) => {
					dragged = item;
				}
				let drop = () => {
					event.preventDefault();
				}
				
				let addItem = (e) => { //재료 추가
					let bowl = document.querySelector('.bowl');
					
					if (ingreList.length != 5){
						let imgSrc = dragged.querySelector('img').getAttribute('src');
						
						let div = document.createElement('div');
						div.classList.add('item');
						div.innerHTML = '<img src="' + imgSrc + '">';
						
						bowl.appendChild(div);
						ingreList.push('추가');
					}
				}
				
				window.addEventListener('scroll', () => {
					let h = window.innerHeight;
					let top = window.scrollY;
					
					let fixedElm =  document.querySelectorAll('.fixed');
					let ingreWrapper = document.querySelector('#ingre-wrapper');
					
					fixedElm[0].classList.remove('show');
					fixedElm[1].classList.remove('show');
					
					if(top >= h * 2 - 100 && top < h * 3 - 100) {
						ingreWrapper.classList.add('show');
						fixedElm[0].classList.add('show');
						fixedElm[1].classList.add('show');
					}
				})
			</script>
		</div>
	</div>
	
	<div id="offer" class="wrapper">
		<%
		ItemDAO pokeDAO = new ItemDAO();
		ArrayList<ItemDTO> poke = pokeDAO.get8Poke();
		%>
		<div class="section-content book">
			<div class="paper theme-box round">
				<p>고민이 되시나요?<br>
				Bowls에서는 저희가 추천하는 조합을 선택하고, 내가 원하는대로 수정할 수 있어요.
				</p>
				<div class="item-wrapper">
					<%for (int i=0;i<Math.floor(poke.size()/2);i++){%>
						<div class="item">
							<img src="<%=root%>/data/poke/<%=poke.get(i).getFilename()%>">
						</div>
					<%}%>
				</div>
			</div>
			
			<div class="binder">
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
				<span></span>
			</div>
			
			<div class="paper theme-box round">
				<div class="item-wrapper">
					<%for (int i=(int)Math.ceil(poke.size()/2);i<poke.size();i++){%>
						<div class="item">
							<img src="<%=root%>/data/poke/<%=poke.get(i).getFilename()%>">
						</div>
					<%} %>
				</div>
				<p>다른 사람의 리뷰를 참고해보는 것은 어떨까요?<br>
				리뷰를 보고 마음에 드는 조합이 있다면 나도 그렇게 먹어볼 수 있어요.
			</div>
			
			<%for (int i=1;i<=3;i++) {%>
				<div class="paper theme-box round dummy" style="--i: <%=i%>;"></div>
			<%} %>
			<%for (int i=1;i<=3;i++) {%>
				<div class="paper theme-box round dummy" style="--i: <%=i%>;"></div>
			<%} %>
		</div>
	</div>


<jsp:include page="footer.jsp" />