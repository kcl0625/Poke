<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%@include file="/config.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String id = request.getParameter("memId");

MemberDAO dao = new MemberDAO();
dao.deleteMember(id);

if (isMem == 1 & isAdm == 0) {
	session.invalidate();
	response.sendRedirect(root + "/member/bye.jsp");
} else if (isAdm == 1) {
	response.sendRedirect(root + "/admin/memberList.jsp");
}
%>