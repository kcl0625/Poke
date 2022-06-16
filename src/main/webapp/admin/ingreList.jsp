<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="order.IngreDAO"%>
<%@ page import="order.IngreDTO"%>
<%@ page import="bbs.*"%>
<%@include file="/config.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
int pageNum = Integer.parseInt(request.getParameter("page"));
%>
<jsp:include page="adm.header.jsp" />
<div class="wrapper">
	<form name="ingre">
		<table>
		<tr>
			<th style="width: 2em;"></th>
			<th style="width: 3.5em;">재료 번호</th>
			<th>재료 이미지</th>
			<th>재료명</th>
			<th>카테고리</th>
			<th style="width: 5em;">칼로리</th>
			<th style="width: 6em;">가격</th>
			<th>원산지</th>
		</tr>
		<%IngreDAO ingreDAO = new IngreDAO();
			ArrayList<IngreDTO> ingre = ingreDAO.getIngreList(pageNum, 10);
						
			for(int i=0;i<ingre.size();i++) {%>
				<tr>
					<td style="width: 2em;">
						<input type="checkbox" name="ingreno" value="<%=ingre.get(i).getNo()%>">
					</td>
					<td style="width: 3.5em;"><%=ingre.get(i).getNo() %></td>
					<td>
						<input type="file" name="filename" value="<%=root %>/data/ingre/<%=ingre.get(i).getFileName()%>">
					</td>
					<td>
						<input type="text" name="name" value="<%=ingre.get(i).getName()%>">
					</td>
					<td>
						<select name="cate">
							<%
							CategoryDAO categoryDAO = new CategoryDAO();
							ArrayList<CategoryDTO> cateList = categoryDAO.getCategory("make");
							int total = cateList.size();
							for(int j=0;j<total;j++){%>
								<option value="<%=cateList.get(j).getName() %>"
								<%if(cateList.get(j).getName().equals(ingre.get(i).getCate())) { out.println("selected"); } %>><%=cateList.get(j).getName() %></option>
							<%} %>
						</select>
					</td>
					<td>
						<input type="number" name="cal" value="<%=ingre.get(i).getCal() %>" style="width: 5em;">
					</td>
					<td>
						<input type="number" name="price" value="<%=ingre.get(i).getPrice() %>" style="width: 6em;">
					</td>
					<td>
						<input type="text" name="origin" value="<%=ingre.get(i).getOrigin()%>">
					</td>
				</tr>
			<%}%>
		</table>
		
		<%int pageMax = ingreDAO.getIngreListPageItemMax(10);%>
		<div class="paging">
			<nav>
				<%for(int i=0;i<pageMax;i++){%>
					<a href="ingreList.jsp?page=<%=i%>"><%=i+1 %></a>
				<%} %>
			</nav>
		</div>
		
		<button type="button">재료 추가하기</button>
	</form>
</div>
<jsp:include page="adm.footer.jsp" />