<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="bbs.CategoryDTO"%>
<%@ page import="order.IngreDAO"%>
<%@ page import="order.IngreDTO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="ingreBean" class="order.IngreDAO" />
<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />

<jsp:include page="adm.header.jsp" />
<form name="ingre">
	<table>
	<tr>
		<th>재료 이미지</th>
		<th>재료명</th>
		<th>카테고리</th>
		<th>칼로리</th>
		<th>가격</th>
		<th>원산지</th>
	</tr>
	<%IngreDAO dao = new IngreDAO();
		ArrayList<IngreDTO> ingre = ingreBean.getIngreList();
					
		for(int i=0;i<ingre.size();i++) {%>
			<tr>
				<td>
					<input type="file" name="filename" value="<%=root %>/data/ingre/<%=ingre.get(i).getFileName()%>">
				</td>
				<td>
					<input type="text" name="name" value="<%=ingre.get(i).getName()%>">
				</td>
				<td>
					<select name="cate">
						<% ArrayList<CategoryDTO> cateList = categoryBean.getCategory("make");
						int total = cateList.size();
						for(int j=0;j<total;j++){%>
							<option value="<%=cateList.get(j).getName() %>"
							<%if(cateList.get(j).getName().equals(ingre.get(i).getCate())) { out.println("selected"); } %>><%=cateList.get(j).getName() %></option>
						<%} %>
					</select>
				</td>
				<td>
					<input type="num" name="cal" value="<%=ingre.get(i).getCal() %>">
				</td>
				<td>
					<input type="num" name="price" value="<%=ingre.get(i).getPrice() %>">
				</td>
				<td>
					<input type="text" name="origin" value="<%=ingre.get(i).getOrigin()%>">
				</td>
			</tr>
		<%}%>
	</table>
</form>
<jsp:include page="adm.footer.jsp" />