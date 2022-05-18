<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@ page import="order.ItemDTO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="itemBean" class="order.ItemDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));

ItemDTO item = itemBean.showView(no);

String name = item.getName();
int price = item.getPrice();
String desc = item.getDescription();
String filename = item.getFilename();%>

<a class="close" href="javascript:close();">
	<span></span>
	<span></span>
</a>
<div class="item-viewer theme-box round">
	<div class="photo" style="background-image: url('<%=root %>/data/etc/<%=filename %>');"></div>
	
	<div class="info-area">
		<div class="info-header">
			<p class="name"><%=name %></p>
			<p class="price">￦<%=String.format("%,d", price) %></p>
			
			<div class="qua">
				<div>
					<a href="javascript:void(0);" onclick="adjust('+', this)">+</a>
					<input type="number" name="quantity" value="1">
					<a href="javascript:void(0);" onclick="adjust('-', this)">-</a>
				</div>
				<button class="ui-btn point" type="button" <%if(isMem == 1 && isAdm == 0) {%>onclick="addCart(<%=no %>, 'etc', '<%=name%>', this.closest('.qua').querySelector('input').value, '<%=price%>');<%}
					else {%>onclick="location.href='<%=root %>/bbs/loginForm.jsp';"<%} %>">담기</button>
			</div>
		</div>
		<div class="desc">
			<p><%=desc %></p>
		</div>
	</div>
</div>