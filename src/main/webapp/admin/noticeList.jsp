<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="bbs.board.*" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String cate = request.getParameter("cate");
int pageNum = Integer.parseInt(request.getParameter("page"));
%>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<form name="ingre">
		<table>
		<tr>
			<th style="width: 3.5em;">번호</th>
			<th>제목</th>
			<th style="width: 7em;"></th>
		</tr>
		<%BoardDAO boardDAO = new BoardDAO();
			ArrayList<BoardDTO> article = boardDAO.getBoardList(cate, pageNum, 10, "notice");
						
			for(int i=0;i<article.size();i++) {%>
				<tr>
					<td style="width: 3.5em;"><%=article.get(i).getNo() %></td>
					<td><%=article.get(i).getTitle()%></td>
					<td><a class="ui-btn point" href="modNotice.jsp?no=<%=article.get(i).getNo() %>">수정하기</a></td>
				</tr>
			<%}%>
		</table>
		
		<%int pageMax = boardDAO.getBoardListPageMax(cate, 10, "notice");%>
		<div class="paging">
			<nav>
				<%for(int i=0;i<pageMax;i++){%>
					<a href="ingreList.jsp?page=<%=i%>"><%=i+1 %></a>
				<%} %>
			</nav>
		</div>
	</form>
</div>
<jsp:include page="adm.footer.jsp" />