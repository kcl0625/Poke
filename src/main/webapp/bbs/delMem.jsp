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

<%
MemberDAO dao = new MemberDAO();
dao.deleteMember(sessionId);

session.invalidate();
%>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">B</span>ye!</h2></div>
	<div class="join-box form-wrapper form-item">
		<div class="theme-box leaf txt-center">
			그동안 POKE와 함께 해주셔서 감사합니다.<br>
			다음에 또 만나요!
		</div>
			
		<div class="pn" style="flex-wrap: wrap;">
		    <a class="ui-btn point full" href="<%=root%>/index.jsp">Main</a>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />