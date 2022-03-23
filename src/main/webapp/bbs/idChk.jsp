<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();
String res = dao.idChk(id);
%>