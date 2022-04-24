<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="order.ItemDTO"%>
<%@page import="member.MemberDTO"%>
<%@include file="/config.jsp" %>
<%if (isAdm == 1) out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
if (isMem == 0) response.sendRedirect(root + "/bbs/loginForm.jsp");

String param = request.getParameter("param"); //json 객체 받아오기


%>
<jsp:useBean id="cartBean" class="order.cart.CartDAO" />
<jsp:useBean id="memberBean" class="member.MemberDAO" />

<link rel="stylesheet" href="<%=root %>/css/order.css">
<script src="<%=root %>/js/order.js"></script>
<jsp:include page="/header.jsp" />
<%
String[] day = {"월", "화", "수", "목", "금", "토"};
String[] dayEng = {"mon", "tue", "wed", "thu", "fri", "sat"};

MemberDTO member = memberBean.getMember(sessionId);
%>
<div class="wrapper form-wrapper" style="width: 100%;">
	<form name="order" method="post" action="order.jsp">
		<div class="form-item">
			<fieldset class="address">
				<legend>address</legend>
				
				<div class="input-item">
					<input class="full" type="text" name="name" id="name" oninput="chk(this);" minlength="2" maxlength="10" value="<%=member.getName()%>">
					<label for="name">이름</label>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" name="zip" id="zip" readonly oninput="chk(this);" value="<%=member.getZip()%>">
					<label for="zip">우편번호</label>
					<a class="ui-btn point small" onclick="openZip();">주소 찾기</a>
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="text" name="add1" id="add1" readonly oninput="chk(this);" value="<%=member.getAdd1()%>">
					<label for="add1">주소</label>
				</div>
				<div class="input-item">
					<input class="full" type="text" name="add2" id="add2" style="padding-left:0;" minlength="1" maxlength="45" oninput="chk(this);" value="<%=member.getAdd2()%>">
					<span class="indicator"></span>
				</div>
				<div class="input-item">
					<input class="full" type="tel" name="tel" id="tel" minlength="10" maxlength="11" oninput="chk(this);" value="<%=member.getTel()%>">
					<label for="tel">연락처</label>
					<span class="indicator">숫자만 입력해주세요</span>
				</div>
			</fieldset>
			<fieldset class="discount">
				<legend>discount</legend>
				<div class="theme-box">
					
				</div>
			</fieldset>
			<fieldset class="payment">
				<legend>payment</legend>
				<div class="input-item">
					<input class="full" type="text" name="depositor" id="depositor" oninput="chk(this);" minlength="2" maxlength="10">
					<label for="tel">입금자명</label>
				</div>
				
				<div class="input-item">
					<label>입금은행</label>
					<div class="select">
						<input type="hidden" name="week" value="우리은행 :: 1002-123-456789 홍길동">
						<div class="selected select-item">우리은행 :: 1002-123-456789 홍길동</div>
						<div class="select-wrapper">
							<ul>
								<li class="select-item" data-data="우리은행 :: 1002-123-456789 홍길동" style="--i: 1;">우리은행 :: 1002-123-456789 홍길동</li>
								<li class="select-item" data-data="NH농협은행 :: 352-1234-5678-90 홍길동" style="--i: 2;">NH농협은행 :: 352-1234-5678-90 홍길동</li>
								<li class="select-item" data-data="카카오뱅크 :: 3333-12-3456789 홍길동" style="--i: 3;">카카오뱅크 :: 3333-12-3456789 홍길동</li>
								<li class="select-item" data-data="국민은행 :: 103002-12-3456789 홍길동" style="--i: 4;">국민은행 :: 103002-12-3456789 홍길동</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="input-item">
					<label>현금영수증 신청</label>
					
					
				</div>
			</fieldset>
		</div>
		<hr class="line">
		<div class="form-item">
			<fieldset class="cart">
				<legend>cart</legend>
				<div class="theme-box">
					
				</div>
			</fieldset>
			<fieldset class="receipt">
				<legend>receipt</legend>
				<div class="theme-box">
					
				</div>
			</fieldset>
		</div>
	</form>
</div>

<div id="open-zip">
	<img src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	// 우편번호 찾기 찾기 화면을 넣을 element
	let openZipWrap = document.querySelector('#open-zip');
	let foldDaumPostcode = () => {openZipWrap.classList.remove('show');}
		
	let openZip = () => {
		// 현재 scroll 위치를 저장해놓는다.
		let currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		    new daum.Postcode({
		        oncomplete: (data) => {
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            let addr = '';
		            
		            if (data.userSelectedType === 'R') addr = data.roadAddress; // 사용자가 도로명 주소를 선택했을 경우
		            else addr = data.jibunAddress; // 사용자가 지번 주소를 선택했을 경우(J)
		
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                order.zip.value = data.zonecode;
	                order.add1.value = addr;
	                order.add2.focus();
	
					//false 상태 없애기
		    		order.zip.parentNode.classList.remove('false');
		    		order.add1.parentNode.classList.remove('false');
		    		printMsg('', memForm.zip.parentNode.querySelector('.indicator'));
		    		printMsg('', memForm.add1.parentNode.querySelector('.indicator'));
						
		            // iframe을 넣은 element를 안보이게 한다.
		            openZipWrap.classList.remove('show');
		
		            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
		            document.body.scrollTop = currentScroll;
		        },
		        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		        onresize : (size) => {
		            openZipWrap.style.height = size.height+'px';
		        },
		        width : '100%',
		        height : '100%'
		    }).embed(openZipWrap);
		        // iframe을 넣은 element를 보이게 한다.
		        openZipWrap.classList.add('show');
		    }
		    
		    // 유효성 검사
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
		    			case 'add2':
		    				ptn = /[a-zA-Z0-9가-힣]+$/;
		    				break;
		    			case 'tel':
		    				ptn = /[0-9]+$/;
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
		    
		    //폼 제출
		    let formSubmit = (form) => {
		    	let inputItem = form.querySelectorAll('.input-item');
		    	let msg = '';
		    	inputItem.forEach((item, i) => {
		    		let input = inputItem[i].querySelector('input');
		    		let indicator = inputItem[i].querySelector('.indicator');
		    		if(!inputItem[i].querySelector('input').value) {
		    			msg = '값을 입력해주세요';
		    			inputItem[i].classList.add('false');
		    		} else {
		    			msg = '';
		    			inputItem[i].classList.remove('false');
		    		}
		    		printMsg(msg, indicator);
		    	})
		    	if(!form.querySelector('.false')) form.submit();
		    }
</script>

<jsp:include page="/footer.jsp" />