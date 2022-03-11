<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.sub.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">

<a class="go-back" href="${pageContext.request.contextPath}/review/list.jsp"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg>BACK</a>
<div class="wrapper">
	<form name="review">
		<div class="select">
			<input type="text" name="poke_name">
			<div class="selected select-item" onclick="openSelect(this.closest('.select'));">
				<span>POKE - 1</span>
				<a class="view-more"><i class="fas fa-angle-down"></i></a>
			</div>
			<div class="select-wrapper">
				<ul>
					<li class="select-item" data-data="POKE - 1" style="--i: 1;">POKE - 1</li>
					<li class="select-item" data-data="POKE - 2" style="--i: 2;">POKE - 2</li>
					<li class="select-item" data-data="POKE - 3" style="--i: 3;">POKE - 3</li>
				</ul>
			</div>
		</div>
	</form>
</div>