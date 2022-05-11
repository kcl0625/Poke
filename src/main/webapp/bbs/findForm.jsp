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
	<div class="form-wrapper">
		<form name="findId" action="findId.jsp" method="post" class="form-item">
			<legend>id</legend>
			<fieldset>
				<div class="input-item">
					<input class="full" type="text" id="name" name="name">
					<label for="name">이름</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="tel" name="tel">
					<label for="tel">연락처</label>
					<span class="indicator"></span>
				</div>
			</fieldset>
			<a class="ui-btn point full">아이디 찾기</a>
		</form>
		<hr class="line">
		<form name="findPw" action="findPw.jsp" method="post" class="form-item">
			<legend>pw</legend>
			<fieldset>
				<div class="input-item">
					<input class="full" type="text" id="name" name="name">
					<label for="name">이름</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="id" name="id">
					<label for="id">아이디</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="tel" name="tel">
					<label for="tel">연락처</label>
					<span class="indicator"></span>
				</div>
			</fieldset>
			<a class="ui-btn point full">비밀번호 찾기</a>
		</form>
	</div>
</div>
<script>

</script>
<jsp:include page="/footer.jsp" />