<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.ItemDAO"%>
<%@ page import="order.ItemDTO"%>
<%@ page import="bbs.*"%>
<%@include file="/config.jsp" %>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<div class="category etc">
		<ul>
			<%
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> category = categoryDAO.getCategory("etc");
			for(int i=0;i<category.size();i++){%>
				<li data-cate="<%=category.get(i).getName() %>" onclick="selectCategory('ajax/selectEtcCate.jsp?cate=', this.dataset.cate, document.querySelector('table'));"><%=category.get(i).getName()%></li>
			<%} %>
		</ul>
	</div>
	
	<form name="ingre">
		<table>
		<tr>
			<th></th>
			<th>이미지</th>
			<th>이름</th>
			<th>가격</th>
		</tr>
		
		</table>
	</form>
</div>
<script>
selectCategory('ajax/selectEtcCate.jsp?cate=', '<%=category.get(0).getName()%>', document.querySelector('table'));
</script>
<jsp:include page="adm.footer.jsp" />