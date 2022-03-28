<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="bbs.CategoryDTO" %>
<%@page import="order.IngreDTO" %>
<%@include file="/config.jsp" %>

<%
if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
if (isAdm == 1) {
	out.write("<script>alert('관리자는 주문할 수 없습니다');location.href = '" + root + "/index.jsp';</script>");
}%>

<jsp:useBean id="categoryBean" class="bbs.CategoryDAO" />
<jsp:useBean id="ingreBean" class="order.IngreDAO" />

<link rel="stylesheet" href="<%=root %>/css/make.css">
<script src="<%=root %>/js/make.js"></script>
<jsp:include page="/header.jsp" />

<div class="wrapper">
	<div class="making">
		<h1><span class="point salmon">M</span>ake<br>M<span class="point salary">y</span><br><span class="point cheese">O</span>wn<br>B<span class="point salmon">o</span>wl</h1>
		<div class="category">
			<ul>
				<%
				ArrayList<CategoryDTO> cateList = categoryBean.getCategory("make");
				int total = cateList.size();
				for(int i=0;i<total;i++){%>
					<li data-cate="<%=cateList.get(i).getName() %>" onclick="selectCategory(this.dataset.cate);"><%=cateList.get(i).getName()%></li>
				<%} %>
			</ul>
		</div>
		
		<div class="slider">
			<div class="btn prev"><svg viewBox="0 0 25 50" onclick="prev();"><polyline class="stroke only" points="25,0 0,25 25,50"/></svg></div>
			<div class="btn next"><svg viewBox="0 0 25 50" onclick="next();"><polyline class="stroke only" points="0,0 25,25 0,50"/></svg></div>
			
			<div class="slider-container"><ul></ul></div>
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
						document.querySelector('.slider-container ul').innerHTML = response.responseText;
						slide();
					}
				})
			}
			
			selectCategory('<%=cateList.get(0).getName()%>');
			</script>
		</div>
		
		<div class="form-wrapper">
			<form name="menu" method="post" action="<%=root %>/member/addCart.jsp" style="width: 100%;">
				<input type="hidden" name="type" value="poke">
				<input type="hidden" name="ingre">
				<input type="hidden" name="price">
				<input type="hidden" name="cal">
				<input type="hidden" name="custom" value="1">
				
				<div id="bowl" ondragover="drop();" ondrop="addItem(event);">
					<div class="write-name">
						<input type="text" name="name" id="name" onsubmit="return false;" value="POKE">
						<hr class="line">
					</div>
					<span class="indicator"></span>
					<svg viewBox="0 0 100 50"><path class="stroke only" d="M99.5,0c0,27.339-22.162,49.5-49.5,49.5C22.662,49.5,0.5,27.339,0.5,0" /></svg>
				</div>
				
				<div class="receipt">
					<div class="paper">
						<div class="head">
							<legend>receipt</legend>
							<a class="clear" href="javascript:clear();"><i class="fas fa-trash"></i></a>
						</div>
						<div class="list">
							<ul></ul>
						</div>
						<div class="total">
							<p id="price">￦0</p>
							<p id="cal">0kcal</p>
						</div>
					</div>
					<button type="button" class="ui-btn point big full" onclick="addMenu(event);">담기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="mask"></div>
<div id="popup" class="theme-box round"></div>
<jsp:include page="/footer.jsp" />