<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.board.*" %>
<%@include file="/config.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
String board = request.getParameter("bbs");

BoardDAO dao = new BoardDAO();
dao.deleteArticle(no, board);
%>
<script>history.back();</script>