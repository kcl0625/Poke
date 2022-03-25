<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/cart.css">
<%
String[] day = {"월", "화", "수", "목", "금", "토", "일"};
String[] dayEng = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
%>
<div class="wrapper">
	<form name="order" method="post" action="order.jsp">
	</form>
</div>
<jsp:include page="/footer.jsp" />