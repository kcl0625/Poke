<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<div class="wrapper">
	<jsp:include page="submenu.jsp" />

	<div class="form-wrapper">
		<jsp:include page="/bbs/memForm.jsp" />
		
		<div class="pn" style="flex-direction: column;align-items: center;">
			<a class="ui-btn point big" onclick="formSubmit(memForm);">회원가입</a>
			<a class="ui-btn big" href="index.jsp">취소</a>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp" />