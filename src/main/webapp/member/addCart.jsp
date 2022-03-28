<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="order.*"%>
<%@include file="/config.jsp" %>
<jsp:useBean id="itemBean" class="order.ItemDTO">
	<jsp:setProperty name="itemBean" property="*" />
</jsp:useBean>
<%if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
}
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
Date date = new Date();
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = format.format(date);

ItemDAO dao = new ItemDAO();
ItemDTO item = itemBean;

String type = String.valueOf(item.getType());
int qua = item.getQuantity();

if (type.equals("poke")) dao.addCart(item, sessionId, now);
else dao.addCart(item, qua, sessionId, now);%>
<a class="close" href="javascript:close();">
	<span></span>
	<span></span>
</a>
<p class="header">장바구니에 담겼어요</p>
<p class="content">
	<span class="name">
		<% out.println(item.getName());
		if(item.getQuantity() != 0)
			out.println(" * " + item.getQuantity());%>
	</span>
	<span class="border"></span>
	<span class="price"><%=item.getPrice() %></span>
	<% if(item.getIngre() != null){%>
	<span class="ingre"><%=item.getIngre() %></span>
	<%} %>
</p>