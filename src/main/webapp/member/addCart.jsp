<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="order.*"%>
<%@include file="/config.jsp" %>
<jsp:useBean id="orderBean" class="order.ItemDTO">
	<jsp:setProperty name="orderBean" property="*" />
</jsp:useBean>
<%if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
}
Date date = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = format.format(date);

ItemDAO dao = new ItemDAO();
ItemDTO item = orderBean;
dao.addCart(item, sessionId, now);

response.sendRedirect("cart.jsp");
%>