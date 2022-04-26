<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>

<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/join.css">
<style>
.wrapper {padding-top: 0;}
footer {margin-top: 0;}
</style>
<jsp:useBean id="memberBean" class="member.MemberDTO">
	<jsp:setProperty property="*" name="memberBean" />
</jsp:useBean>

<%
MemberDAO dao = new MemberDAO();
MemberDTO member = memberBean;
dao.join(member);
%>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">J</span>oin Us</h2></div>
	<div class="join-box form-wrapper form-item">
		<div class="procedure">
			<div class="item"><span class="num">1</span><span class="name">약관동의</span></div>
			<div class="arrow"></div>
			<div class="item"><span class="num">2</span><span class="name">정보입력</span></div>
			<div class="arrow"></div>
			<div class="item cur"><span class="num">3</span><span class="name">가입완료</span></div>
		</div>
		<div class="theme-box leaf txt-center">
			가입을 축하합니다!<br>
			다양한 혜택이 당신을 기다리고 있어요
		</div>
			
		<div class="pn" style="flex-wrap: wrap;">
	    	<a class="ui-btn full" onclick="<%=root%>/bbs/loginForm.jsp">Log in</a>
		    <a class="ui-btn point full" href="<%=root%>/index.jsp">Main</a>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />