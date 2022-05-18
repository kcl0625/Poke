<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDAO" %>
<%@page import="bbs.CategoryDTO" %>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/mypage.css">
<div class="wrapper freq">
	<jsp:include page="submenu.jsp" />
	<div class="page-sub-title">
		<h2>자주 묻는 질문</h2>
	</div>
	<div class="theme-box leaf freq-category">
		<%
		CategoryDAO dao = new CategoryDAO();
		ArrayList<CategoryDTO> cateList = dao.getCategory("freq");
		int total = cateList.size();
		for(int i=0;i<total;i++){%>
			<a class="ui-btn" data-cate="<%=cateList.get(i).getName()%>" onclick="selectCategory(this.dataset.cate)"><%=cateList.get(i).getName()%></a>
		<%} %>
	</div>
	
	<div class="question-list">
		<h3></h3>
		<ul></ul>
	</div>
</div>

<script>
	let selectCategory = (cate) => {
		let categoryLi = document.querySelectorAll('.category li');
		for(let i=0;i<categoryLi.length;i++){
			categoryLi[i].classList.remove('cur');
			if(categoryLi[i].dataset.cate == cate)
				categoryLi[i].classList.add('cur');
		}
				
		new Ajax.Request('select.jsp?cate=' + cate, {
			method: 'get',
			parameter: cate,
			onComplete: (response) => {
				let questionList = document.querySelector('.question-list');
				questionList.querySelector('h3').innerHTML = cate + ' 관련 안내';
				questionList.querySelector('ul').innerHTML = response.responseText;
			}
		})
	}
	selectCategory('<%=cateList.get(0).getName()%>');
	
	let openAns = (quesItem) => {
		let ques = quesItem.querySelector('.ques');
		quesItem.classList.toggle('open');
	}
</script>
<jsp:include page="/footer.jsp" />