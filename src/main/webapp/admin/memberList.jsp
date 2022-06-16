<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="member.*" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
int pageNum = Integer.parseInt(request.getParameter("page"));
%>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="tbl-section">
		<h2 class="tbl-title">회원 목록</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>가입일자</th>
				<th></th>
				<th></th>
			</tr>
			<%
			MemberDAO mDAO = new MemberDAO();
			ArrayList<MemberDTO> member = mDAO.getMemberList(pageNum, 10);
			for(int i = 0;i<member.size();i++){%>
				<tr>
					<td><%=member.get(i).getId() %></td>
					<td><%=member.get(i).getName() %></td>
					<td><%=member.get(i).getNick() %></td>
					<td><%=member.get(i).getDate() %></td>
					<td><a class="ui-btn" href="<%=root %>/bbs/editMem.jsp?memId=<%=member.get(i).getId() %>">회원 수정</a></td>
					<td><a class="ui-btn point" href="<%=root %>/bbs/delMem.jsp?memId=<%=member.get(i).getId() %>">회원 삭제</a></td>
				</tr>
			<%} %>
		</table>
	</div>
</div>
<jsp:include page="adm.footer.jsp" />