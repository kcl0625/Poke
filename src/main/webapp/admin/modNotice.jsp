<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.IngreDAO"%>
<%@ page import="order.IngreDTO"%>
<%@ page import="bbs.*"%>
<%@include file="/config.jsp" %>

<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<form name="write" action="<%=root%>/bbs/write.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board" value="qna">
		<input type="hidden" name="id" value="<%=sessionId%>">
		<input type="hidden" name="cate">
		<input type="file" name="photo">
		<div class="input-item">
			<input type="text" name="title" placeholder="제목을 입력해주세요">
			<span class="indicator"></span>
		</div>
		<textarea name="content" placeholder="내용을 입력해주세요"></textarea>

		<button type="button" class="ui-btn point" onclick="formSubmit();">작성완료</button>
	</form>
</div>
<jsp:include page="adm.footer.jsp" />