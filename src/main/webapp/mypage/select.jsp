<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.board.*"%>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

BoardDAO dao = new BoardDAO();
ArrayList<BoardDTO> ques = dao.getFreqList(cate);

for(int i=0;i<ques.size();i++) {%>
	<li class="question-item" onclick="openAns(this);">
		<div class="ques">
			Q. 질문 <%=i+1 %> ― <%=ques.get(i).getQues() %>
			<svg viewBox="0 0 50 25"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 50,0"></polyline></svg>
		</div>
		<div class="answer">
			<p>
			A. <%=ques.get(i).getAns() %>
			</p>
		</div>
	</li>
<%}%>