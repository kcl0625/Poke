<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="order.cart.*"%>
<%@include file="/config.jsp" %>

<%if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
}
String no = request.getParameter("no");

CartDAO cartDao = new CartDAO();
cartDao.delCart(no, sessionId);

response.sendRedirect("cart.jsp");
%>