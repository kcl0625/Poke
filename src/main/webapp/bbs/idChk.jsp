<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

MemberDAO dao = new MemberDAO();
int res = dao.idChk(id);

//성공여부 확인 : 개발자용
if (res == 0) System.out.println("이미 존재하는 아이디입니다.");
else System.out.println("사용 가능한 아이디입니다.");
%>