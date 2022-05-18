<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<link rel="stylesheet" href="<%=root %>/css/mypage.css">
<a class="show-submenu" onclick="openSubmenu(this);"><svg viewBox="0 0 50 25"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 50,0"></polyline></svg></a>
<div class="submenu">
	<ul>
		<li><a href="index.jsp">My POKE</a></li>
		<li><a href="list.jsp?page=0">My Review</a></li>
		<li><a href="freq.jsp">자주 묻는 질문</a></li>
		<li><a href="qna.jsp?page=0">Q&A</a></li>
	</ul>
</div>
<script>
	let openSubmenu = (btn) => {
		btn.classList.toggle('show');
	}
</script>