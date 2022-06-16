<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="member.*" %>
<%@page import="order.OrderDAO" %>
<%@page import="order.OrderDTO" %>
<%@include file="/config.jsp" %>

<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String no = request.getParameter("no");
String id = request.getParameter("id");
%>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="tbl-section">
		<h2 class="tbl-title">회원 정보</h2>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>연락처</th>
				<th>이메일</th>
			</tr>
			
			<tr>
				<%MemberDAO mDAO = new MemberDAO();
				MemberDTO member = mDAO.getMember(id);%>
				<td><%=member.getId() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getZip() %></td>
				<td><%=member.getAdd1() %></td>
				<td><%=member.getAdd2() %></td>
				<td><%=member.getTel() %></td>
				<td><%=member.getEmail() %></td>
			</tr>
		</table>
	</div>
	<div class="tbl-section">
		<h2 class="tbl-title">주문 제품 목록</h2>
		<table>
			<tr>
				<th>주문번호</th>
				<th>타입</th>
				<th>제품명</th>
				<th>재료 구성</th>
				<th>요일</th>
				<th>수량</th>
				<th>가격</th>
				<th>주</th>
			</tr>
			<%
			OrderDAO oDAO = new OrderDAO();
			ArrayList<OrderDTO> order = oDAO.showOrder(no, 0, 10);
			for(int i = 0;i<order.size();i++){%>
				<tr>
					<td><%=order.get(i).getNo() %></td>
					<td><%=order.get(i).getType() %></td>
					<td><%=order.get(i).getName() %></td>
					<td><%if (order.get(i).getIngre() != null) out.println(order.get(i).getIngre());%></td>
					<td><%if (order.get(i).getDay() != null) out.println(order.get(i).getDay());%></td>
					<td><%=order.get(i).getQuantity() %></td>
					<td><%=String.format("%,d", order.get(i).getPrice()) %></td>
					<td><%=order.get(i).getWeek() %>주</td>
				</tr>
			<%} %>
		</table>
	</div>
</div>
<jsp:include page="adm.footer.jsp" />