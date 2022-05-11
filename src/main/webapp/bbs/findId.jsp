<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>}/css/login.css">
<style>
form.form-item {flex-wrap: wrap; height: 400px; align-content: space-between;}
form.form-item > * {width: 100%;}
form.form-item legend {font-weight: 200; font-size: 2.2rem;}
@media all and (min-width: 1281px) {
	.wrapper {padding-top: 0;}
	footer {margin-top: 0;}
}
</style>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">F</span>inding</h2></div>
	<div class="theme-box leaf">
		<p class="txt-center">회원님의 아이디는<br></p>
	</div>
	<a href="<%=root %>/bbs/loginForm.jsp" class="ui-btn point full">Log in</a>
</div>
<script>

</script>
<jsp:include page="/footer.jsp" />