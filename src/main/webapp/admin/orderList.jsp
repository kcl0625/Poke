<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="order.OrderDAO" %>
<%@page import="order.OrderDTO" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
int pageNum = Integer.parseInt(request.getParameter("page"));
%>

<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="tbl-section">
		<h2 class="tbl-title">주문 목록</h2>
		<a href="">전체보기</a>
		<table>
			<tr>
				<th>주문 번호</th>
				<th>아이디</th>
				<th>주문자명</th>
				<th>총 구매액수</th>
				<th>주문일자</th>
				<th></th>
			</tr>
			<%
			OrderDAO oDAO = new OrderDAO();
			ArrayList<OrderDTO> order = oDAO.getOrderList(pageNum, 10);
			for(int i = 0;i<order.size();i++){%>
				<tr>
					<td><%=order.get(i).getNo() %></td>
					<td><%=order.get(i).getId() %></td>
					<td><%=order.get(i).getName() %></td>
					<td><%=String.format("%,d", order.get(i).getPrice()) %></td>
					<td><%=order.get(i).getDate() %></td>
					<td><a class="ui-btn point" href="showOrder.jsp?no=<%=order.get(i).getNo() %>&id=<%=order.get(i).getId()%>">자세히 보기</a></td>
				</tr>
			<%} %>
		</table>
	</div>
	</div>
</div>
<jsp:include page="adm.footer.jsp" />