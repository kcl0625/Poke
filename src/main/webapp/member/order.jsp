<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@page import="java.util.ArrayList" %>
<%@page import="order.OrderDTO"%>
<%@page import="order.OrderDAO"%>
<%@page import="member.*"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="memberBean" class="member.MemberDTO">
	<jsp:setProperty property="*" name="memberBean" />
</jsp:useBean>
<%if (isAdm == 1) out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
if (isMem == 0) response.sendRedirect(root + "/bbs/loginForm.jsp");

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

String payment = request.getParameter("payment");
String isPaid = request.getParameter("isPaid");
int totPrice = Integer.parseInt(request.getParameter("totPrice"));
String depositor = request.getParameter("depositor");
int week = Integer.parseInt(request.getParameter("weekPlan"));
ArrayList<OrderDTO> orderArr = (ArrayList<OrderDTO>)session.getAttribute("orderItem");
OrderDAO orderDAO = new OrderDAO();
MemberDTO member = memberBean;

LocalDateTime now = LocalDateTime.now();
String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

if(session.getAttribute("member") != null) {
	member = (MemberDTO)session.getAttribute("member");
}
orderDAO.setOrder(sessionNo, orderArr, member, sessionId, formatedNow, payment, isPaid, totPrice, depositor, week);
response.sendRedirect("orderOk.jsp");
%>