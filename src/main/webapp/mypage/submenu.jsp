<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<a class="show-submenu" onclick="openSubmenu(this);"><svg viewBox="0 0 50 25"><polyline class="stroke only" stroke-miterlimit="10" points="0,0 25,25 50,0"></polyline></svg></a>
<div class="submenu">
	<ul>
		<li><a href="index.jsp">My POKE</a></li>
		<li><a href="list.jsp">My Review</a></li>
		<li><a href="">자주 묻는 질문</a></li>
		<li><a href="">Q&A</a></li>
	</ul>
</div>
<script>
	let openSubmenu = (btn) => {
		btn.classList.toggle('show');
	}
</script>