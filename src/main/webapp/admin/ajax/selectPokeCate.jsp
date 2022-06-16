<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="order.ItemDTO"%>
<%@ page import="order.ItemDAO"%>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String cate = request.getParameter("cate");

ItemDAO dao = new ItemDAO();
ArrayList<ItemDTO> poke = dao.selectPoke(cate);
			
for(int i=0;i<poke.size();i++) {%>
	<tr>
		<td><%=poke.get(i).getName() %></td>
		<td><%=poke.get(i).getCate() %></td>
		<td><%=poke.get(i).getCal() %>kcal</td>
		<td>￦<%=String.format("%,d", poke.get(i).getPrice()) %></td>
		<td>
			<a class="ui-btn point" href="<%=root%>/admin/modPoke.jsp?no=<%=poke.get(i).getNo()%>">수정하기</a>
		</td>
	</tr>
<%}%>