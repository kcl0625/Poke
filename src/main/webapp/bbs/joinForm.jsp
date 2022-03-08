<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">J</span>oin Us</h2></div>
	<div class="join-box form-wrapper">
		<div class="procedure">
			<div class="item"><span class="num">1</span><span class="name">약관동의</span></div>
			<div class="arrow"></div>
			<div class="item cur"><span class="num">2</span><span class="name">정보입력</span></div>
			<div class="arrow"></div>
			<div class="item"><span class="num">3</span><span class="name">가입완료</span></div>
		</div>
		<jsp:include page="memForm.jsp" />
			
		<div class="pn" style="flex-direction: column;align-items: center;">
			<a class="ui-btn point big" onclick="formSubmit(memForm);">회원가입</a>
			<a class="ui-btn big" href="${pageContext.request.contextPath}/index.jsp">취소</a>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />