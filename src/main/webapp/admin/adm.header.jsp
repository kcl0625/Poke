<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@include file="/config.jsp" %>
<jsp:include page="/header.sub.jsp" />
<link rel="stylesheet" href="css/admin.css">
<header>
	<div class="center">
		<div id="gnb_open" onclick="openGnb();">
	    	<span></span>
	    	<span></span>
	    </div>
	    <script>
	    	let openGnb = () => {document.querySelector('body').classList.toggle('open-gnb');}
	    </script>
	    <div id="logo">
	    	<a href="<%=root%>/index.jsp">
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
	                <li style="--i: 1;"><a href="index.jsp">메인</a></li>
	                <li style="--i: 2;"><a href="ingreList.jsp">재료 관리</a></li>
	                <li style="--i: 3;"><a href="menuList.jsp">메뉴 관리</a></li>
	                <li style="--i: 4;"><a href="shopList.jsp">별매상품 관리</a></li>
	                <li style="--i: 5;"><a href="memberList.jsp">회원 관리</a></li>
	                <li style="--i: 6;"><a href="noticeList.jsp">공지 및 이벤트 관리</a></li>
	                <li style="--i: 7;"><a href="reviewList.jsp">리뷰관리</a></li>
	                <li style="--i: 8;"><a href="freqList.jsp">자주 묻는 질문 관리</a></li>
	                <li style="--i: 9;"><a href="qnaList.jsp">1:1 질문</a></li>
	            </ul>
	        </div>
	    </div>
	    <div id="header-right-btn">
	    	
	    </div>
	</div>
</header>
<section id="body">