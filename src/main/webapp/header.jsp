<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/header.sub.jsp" />
<header>
	<div class="center">
		<div id="gnb_open" onclick="openGnb();">
	    	<span></span>
	    	<span></span>
	    </div>
	    	
	    <script>
	    	let openGnb = () => {document.querySelector('body').classList.toggle('open');}
	    </script>
	    <div id="logo">
	    	<a href="${pageContext.request.contextPath}/index.jsp">
	    		<svg viewBox="0 0 188 188">
	    			<path class="fill salary" d="M120 0c-7 0-12 5-12 12v68h68c7 0 12-5 12-12V0h-68z"/>
	    			<path class="fill salmon" d="m80 183-61-35 61-35z"/>
	    			<path class="stroke cheese" stroke="#5451E5" d="M108 148h80"/>
	    			<path class="stroke only" d="M120 0c-7 0-12 5-12 12v68h68c7 0 12-5 12-12V0h-68zM0 188V0h68c7 0 12 5 12 12v56c0 7-5 12-12 12H18m90 28h80m-80 80h80M80 113l-61 35 61 35v-70z"/>
				</svg>
    		</a>
	    </div>
	    <div id="gnb">
	    	<div class="menu">
	            <ul>
	                <li style="--i: 1;"><a href="${pageContext.request.contextPath}/about.jsp">About</a></li>
	                <li style="--i: 2;"><a href="${pageContext.request.contextPath}/make.jsp">Make</a></li>
	                <li style="--i: 3;"><a href="">Bowls</a></li>
	                <li style="--i: 4;"><a href="">Shop</a></li>
	                <li style="--i: 5;"><a href="">Notice</a></li>
	                <li style="--i: 6;"><a href="">Review</a></li>
	            </ul>
	        </div>
	        <div class="login">
	            <ul>
	                <li style="--i: 7;"><a href="">My POKE</a></li>
	                <li style="--i: 8;"><a href="${pageContext.request.contextPath}/bbs/login.jsp">Log in</a></li>
	            </ul>
	        </div>
	    </div>
	    <div id="cart"><a href=""><i class="fas fa-shopping-cart"></i></a></div>
	</div>
	<div class="left side"><p>everyday, every meal</p></div>
	<div class="right side"><p>best Ingredients, best Experiences</p></div>
</header>
<section id="body">