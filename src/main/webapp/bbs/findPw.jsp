<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>
<%
String pw = "";
String name = request.getParameter("name");
String id = request.getParameter("id");
String tel = request.getParameter("tel");

MemberDAO dao = new MemberDAO();
pw = dao.findPw(name, id, tel);
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
		<%if(!pw.equals(""))
			out.println("<p class=\"txt-center\">회원님의 비밀번호 앞 2자리는<br><strong>" + pw.substring(0, 2) + "</strong><br>입니다</p>");
		else
			out.println("<p class=\"txt-center\">입력하신 정보와 일치하는 비밀번호가 없습니다.</p>");%>  
	</div>
	<a href="<%=root %>/bbs/loginForm.jsp" class="ui-btn point full">Log in</a>
</div>
<script>

</script>
<jsp:include page="/footer.jsp" />