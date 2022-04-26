<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>

<jsp:useBean id="memberBean" class="member.MemberDTO">
	<jsp:setProperty property="*" name="memberBean" />
</jsp:useBean>

<%
MemberDAO dao = new MemberDAO();
MemberDTO member = memberBean;
dao.updateMember(member);

response.sendRedirect(root + "/mypage/edit.jsp");
%>