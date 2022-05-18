<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/config.jsp" %>
<jsp:include page="/header.jsp" />
<style>
form.form-item {flex-wrap: wrap; height: 400px; align-content: space-between;}
form.form-item > * {width: 100%;}
form.form-item legend {font-weight: 200; font-size: 2.2rem;}
@media all and (min-width: 1281px) {
	footer {margin-top: 0;}
}
</style>
<div class="wrapper">
	<div class="page-title"><h2><span class="point cheese">F</span>inding</h2></div>
	<div class="form-wrapper">
		<form name="findId" action="findId.jsp" method="post" class="form-item">
			<legend>id</legend>
			<fieldset>
				<div class="input-item">
					<input class="full" type="text" id="name" name="name" oninput="chk(this);">
					<label for="name">이름</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="tel" name="tel" oninput="chk(this);">
					<label for="tel">연락처</label>
					<span class="indicator"></span>
				</div>
			</fieldset>
			<a class="ui-btn point full">아이디 찾기</a>
		</form>
		<hr class="line">
		<form name="findPw" action="findPw.jsp" method="post" class="form-item" oninput="chk(this);">
			<legend>pw</legend>
			<fieldset>
				<div class="input-item">
					<input class="full" type="text" id="name" name="name" oninput="chk(this);">
					<label for="name">이름</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="id" name="id" oninput="chk(this);">
					<label for="id">아이디</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" id="tel" name="tel" oninput="chk(this);">
					<label for="tel">연락처</label>
					<span class="indicator"></span>
				</div>
			</fieldset>
			<a class="ui-btn point full">비밀번호 찾기</a>
		</form>
	</div>
</div>
<script>
let chk = (input) => {
	let value = input.value;
	let inputItem = input.parentNode;
	let indicator = inputItem.querySelector('.indicator');
	let id = input.getAttribute('id');
	
	let min = input.getAttribute('minlength');
	let max = input.getAttribute('maxlength');
	let ptn = '';
	let msg = '';
	
	if(value){
		if(min && max){
    		if(value.length < min || value.length > max){ //값이 있을 때 max와 min을 충족하는지
    			msg = '길이가 너무 짧거나 길어요';
    			inputItem.classList.add('false');
    		} else {
    			//id 중복검사
		    	if(id == 'id') {
		    		memForm.id.addEventListener('change', (e) => {
		    			e.stopImmediatePropagation();
		    			new Ajax.Request('idChk.jsp?id=' + memForm.id.value, {
		    				method: 'get',
		    				parameter: memForm.id,
		    				onComplete: (response) => {
		    			    	let res = response.responseText.trim();
		    					
		    					if (res == 'no'){
		    						msg = '사용할 수 없는 아이디예요';
		    						inputItem.classList.add('false');
		    						printMsg(msg, indicator);
		    					}
		    				}
		    			})
		    		})
		    	} else {
		    		msg = '';
        			inputItem.classList.remove('false');
		    	}
    		}
    	}
		//패턴 검사
		switch(id){ //정규식 정의
			case 'name':
				ptn = /^[가-힣]+$/;
				break;
			case 'id':
				ptn = /^[a-zA-Z0-9]+$/;
				break;
			case 'pw':
				ptn = /^[a-zA-Z0-9]+$/;
				break;
			case 'add2':
				ptn = /[a-zA-Z0-9가-힣]+$/;
				break;
			case 'tel':
				ptn = /[0-9]+$/;
				break;
			case 'email':
				ptn = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$/;
				break;
		}
		if(ptn && !ptn.test(value)){
			msg = '형식이 올바르지 않아요';
			inputItem.classList.add('false');
		} else { //형식에 맞을 때
			if(min && max){
        		if(value.length > min && value.length < max){
        			msg = '';
        			inputItem.classList.remove('false');
        		}
        	} else {
        		msg = '';
    			inputItem.classList.remove('false');
        	}
		}
	} else { //값 입력 안 함
		msg = '값을 입력해주세요';
		inputItem.classList.add('false');
	}
	if(indicator) printMsg(msg, indicator);
}
</script>
<jsp:include page="/footer.jsp" />