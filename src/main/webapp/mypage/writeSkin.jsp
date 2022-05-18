<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper qna">
	<jsp:include page="submenu.jsp" />
	<div class="page-sub-title">
		<h2>Q<span class="point salary">&</span>A</h2>
	</div>
	<div class="qna-form">
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
	<script>
	let formSubmit = () => {
		if(!write.title.value) {
			let msg = '제목을 입력해주세요';
			printMsg(msg, document.querySelector('.input-item .indicator'));
		} else {
			write.submit();
		}
	}
	</script>
</div>
<jsp:include page="/footer.jsp" />