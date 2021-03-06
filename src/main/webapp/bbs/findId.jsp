<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>
<%
String id = "";
String name = request.getParameter("name");
String tel = request.getParameter("tel");

MemberDAO dao = new MemberDAO();
id = dao.findId(name, tel);
%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>}/css/login.css">
<style>
.wrapper {
	padding-top: 0;
	height: 100vh;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	align-content: center;
	max-width: 380px;
}
.ui-btn {margin-top: 50px;}
footer {margin-top: 0;}
</style>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">F</span>inding</h2></div>
	<div class="theme-box leaf">
		<%if(!id.equals(""))
			out.println("<p class=\"txt-center\">회원님의 아이디는<br><strong>" + id + "</strong><br>입니다</p>");
		else
			out.println("<p class=\"txt-center\">입력하신 정보와 일치하는 아이디가 없습니다.</p>");%> 
	</div>
	<a href="<%=root %>/bbs/loginForm.jsp" class="ui-btn point full">Log in</a>
</div>
<script>

</script>
<jsp:include page="/footer.jsp" />