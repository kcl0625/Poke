<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.IngreDAO"%>
<%@ page import="order.IngreDTO"%>
<%@ page import="bbs.*"%>
<%@include file="/config.jsp" %>

<jsp:include page="adm.header.jsp" />
	<div class="wrapper">
		<div class="category poke">
			<ul>
				<%
				CategoryDAO categoryDAO = new CategoryDAO();
				ArrayList<CategoryDTO> ingreArr = categoryDAO.getCategory("poke");
				for(int i=0;i<ingreArr.size();i++){%>
					<li data-cate="<%=ingreArr.get(i).getName() %>" onclick="selectCategory('ajax/selectPokeCate.jsp?cate=', this.dataset.cate, document.querySelector('table'));"><%=ingreArr.get(i).getName()%></li>
				<%} %>
			</ul>
		</div>
	
		<table>
			<tr>
				<th>메뉴명</th>
				<th>카테고리</th>
				<th>칼로리</th>
				<th>가격</th>
			</tr>
		</table>
		
		<a href="<%=root%>/admin/addPoke.jsp">메뉴 추가하기</a>
	</div>
<script>selectCategory('ajax/selectPokeCate.jsp?cate=', '<%=ingreArr.get(0).getName()%>', document.querySelector('table'));</script>
<jsp:include page="adm.footer.jsp" />