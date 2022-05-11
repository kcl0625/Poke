<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.board.*" %>
<%@include file="/config.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");
int pageNum = Integer.parseInt(request.getParameter("page"));

BoardDAO dao = new BoardDAO();
%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypage.css">
<div class="wrapper qna">
	<jsp:include page="submenu.jsp" />
	<div class="page-sub-title">
		<h2>Q<span class="point salary">&</span>A</h2>
		
		<div class="search">
			<form name="search">
				<div class="input-item"><input type="text" name="keyword" autocomplete="off"></div>
				<button type="button" onclick="openSearch(event);"><svg viewBox="0 0 14 14"><path class="stroke only" d="M10.832,5.417c0,2.993-2.424,5.419-5.416,5.419
		C2.425,10.836,0,8.41,0,5.417C0,2.425,2.425,0,5.416,0C8.408,0,10.832,2.425,10.832,5.417z M9.246,9.248l4.901,4.903"/></svg></a>
			</form>
		</div>
	</div>
	<div class="list">
		<ul><%ArrayList<BoardDTO> qnaList = dao.getMyQnaList(sessionId, pageNum, 7, "qna");%>
			<%for(int i=0;i<qnaList.size();i++){%>
				<li>
					<a href="viewSkin.jsp?no=<%=qnaList.get(i).getNo()%>"><%=qnaList.get(i).getTitle() %>
					<span class="date"><%=qnaList.get(i).getDate() %></span></a>
				</li>
			<%} %>
		</ul>
	</div>
	<a class="write" href="writeSkin.jsp"><i class="fas fa-pen"></i></a>
</div>
<jsp:include page="/footer.jsp" />