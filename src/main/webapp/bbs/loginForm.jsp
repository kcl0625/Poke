<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<style>
@media all and (min-width: 1281px) {
	.wrapper {padding-top: 0;}
	footer {margin-top: 0;}
}
</style>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">W</span>elcome!</h2></div>
	<div class="login-box form-wrapper form-item">
		<form name="login" action="login.jsp" method="post">
			<div class="input-item empty">
				<input class="full" type="text" id="id" name="id">
				<label for="id">id</label>
				<span class="indicator"></span>
			</div>
			<div class="input-item empty">
				<input class="full" type="password" id="pw" name="pw">
				<label for="pw">pw</label>
		        <span class="indicator"></span>
		    </div>
		    <a class="ui-btn point full">Log in</a>
		    <a href="joinAgree.jsp" class="ui-btn full">Join</a>
		    <a href="findForm.jsp" class="txt-center" style="display: block;">아이디/비밀번호 찾기</a>
		</form>
	</div>
</div>
<script>
let form = document.querySelector('form');
let inputItem = form.querySelectorAll('.input-item');
let loginBtn = form.querySelector('.ui-btn.point');
inputItem.forEach((item, i) => {
	let input = inputItem[i].querySelector('input');
    let indicator = inputItem[i].querySelector('.indicator');
 
    input.addEventListener('change', () => {
    	if (input.value) {
    		inputItem[i].classList.remove('empty');
    		indicator.innerHTML = '';
    	} else {
			inputItem[i].classList.add('empty');
            indicator.innerHTML = '값을 입력해주세요';
        }
    })
    
    loginBtn.addEventListener('click', () => {
    	if(!input.value) {
    		inputItem[i].classList.add('empty');
    		indicator.innerHTML = '값을 입력해주세요';
		}
    	
    	if(login.id.value && login.pw.value){
    		login.submit();
    	}
    })
})
</script>
<jsp:include page="/footer.jsp" />