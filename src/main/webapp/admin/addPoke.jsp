<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.ItemDAO"%>
<%@ page import="order.ItemDTO"%>
<%@ page import="bbs.*"%>
<%@include file="/config.jsp" %>
<script src="js/admin.js"></script>
<script src="js/make.js"></script>
<jsp:include page="adm.header.jsp" />

<div class="wrapper">
	<div class="ingre-list theme-box">
		<ul></ul>
	</div>
		
	<div class="category poke-ingre">
		<ul>
			<%
			CategoryDAO categoryDAO = new CategoryDAO();
			ArrayList<CategoryDTO> ingreArr = categoryDAO.getCategory("make");
			for(int i=0;i<ingreArr.size();i++){%>
				<li data-cate="<%=ingreArr.get(i).getName() %>" onclick="selectCategory('ajax/selectIngreCate.jsp?cate=', this.dataset.cate, document.querySelector('.ingre-list ul'));"><%=ingreArr.get(i).getName()%></li>
			<%} %>
		</ul>
	</div>
	
	<div class="poke-img theme-box"><img src></div>
	
	<form name="poke" action="addPokeRes.jsp" enctype="multipart/form-data">
		<h2>추가된 재료</h2>
		<div class="add-ingre-list theme-box">
			<span class="indicator"></span>
			<ul></ul>
		</div>
		<div class="tbl-section">
			<h2 class="tbl-title">메뉴 수정하기</h2>
			<table>
				<tr>
					<th>메뉴 이미지</th>
					<td><input type="file" name="filename" value=""></td>
				</tr>
				<tr>
					<th>메뉴명</th>
					<td><input type="text" name="name" value=""></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select name="cate">
							<%
								ArrayList<CategoryDTO> pokeCateArr = categoryDAO.getCategory("poke");
								for(int i=0;i<pokeCateArr.size();i++){%>
									<option value="<%=pokeCateArr.get(i).getName()%>"><%=pokeCateArr.get(i).getName()%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>칼로리</th>
					<td><input type="text" name="cal" value="0" readonly></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="price" value="0" readonly></td>
				</tr>
			</table>
		</div>
		<button class="ui-btn point" type="button">수정하기</button>
	</form>
</div>
<script>selectCategory('ajax/selectIngreCate.jsp?cate=', '<%=ingreArr.get(0).getName()%>', document.querySelector('.ingre-list ul'));</script>
<jsp:include page="adm.footer.jsp" />