<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="<%=root %>/css/join.css">
<link rel="stylesheet" href="<%=root %>/css/memForm.css">
<style>
.wrapper {padding-top: 0;}
footer {margin-top: 0;}
</style>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">J</span>oin Us</h2></div>
	<div class="join-box form-wrapper form-item">
		<div class="procedure">
			<div class="item cur"><span class="num">1</span><span class="name">약관동의</span></div>
			<div class="arrow"></div>
			<div class="item"><span class="num">2</span><span class="name">정보입력</span></div>
			<div class="arrow"></div>
			<div class="item"><span class="num">3</span><span class="name">가입완료</span></div>
		</div>
		<form name="joinAgree" style="width:100%;">
			<div class="input-item ui-btn point check" style="width:100%;text-align:left;padding:10px 15px;">
				<input type="checkbox" name="all" id="all" onclick="allChk(this);">
				<label for="all"><span></span>전체 이용약관 동의</label>
			</div>
			
			<div class="input-item check">
				<input type="checkbox" name="term" id="term">
				<label for="term"><span></span>(필수) 이용약관</label>
				<a href="">전체보기</a>
			</div>
			<div class="input-item check">
				<input type="checkbox" name="privacy" id="privacy">
				<label for="privacy"><span></span>(필수) 개인정보 수집 및 이용</label>
				<a href="">전체보기</a>
			</div>
			<span class="indicator txt-center" style="bottom:unset;margin-top:10px;width:100%;"></span>
	    </form>
		<div class="pn">
			<a class="ui-btn" onclick="history.back();">취소</a>
		    <a class="ui-btn point" onclick="goNext();">다음</a>
		</div>
	</div>
</div>
<script>
function allChk(chk){
	if(chk.checked){
		joinAgree.term.checked = true;
		joinAgree.privacy.checked = true;
	} else {
		joinAgree.term.checked = false;
		joinAgree.privacy.checked = false;
	}
}

function goNext(){
	if (joinAgree.term.checked == false || joinAgree.privacy.checked == false) joinAgree.querySelector('.indicator').innerHTML = '이용약관에 전부 체크해주세요';
	else location.href = 'joinForm.jsp';
}
</script>
<jsp:include page="/footer.jsp" />