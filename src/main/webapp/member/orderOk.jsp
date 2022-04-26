<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>

<%if (isAdm == 1) out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
if (isMem == 0) response.sendRedirect(root + "/bbs/loginForm.jsp");%>
<jsp:include page="/header.jsp" />

<div class="wrapper form-item">
	<div class="theme-box leaf txt-center">
		<p>
		주문이 완료되었어요!<br>
		안전하게 보내드릴게요
		</p>
	</div>
	<a class="ui-btn full point" href="<%=root%>/index.jsp" style="margin-top: 50px;">메인으로</a>
</div>
<jsp:include page="/footer.jsp" />