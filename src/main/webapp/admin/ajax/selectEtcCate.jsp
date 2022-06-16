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
ArrayList<ItemDTO> etc = dao.selectEtc(cate);
for(int i=0;i<etc.size();i++) {%>
<tr>
	<td>
		<input type="checkbox" name="etcno" value="<%=etc.get(i).getNo()%>">
	</td>
	<td>
		<input type="file" name="filename" value="<%=root %>/data/etc/<%=etc.get(i).getFilename()%>">
	</td>
	<td>
		<input type="text" name="name" value="<%=etc.get(i).getName()%>">
	</td>
	<td>
		<input type="number" name="price" value="<%=etc.get(i).getPrice() %>">
	</td>
	<td>
	</td>
</tr>
<%}%>