<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="member.*"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="memberBean" class="member.MemberDAO" />
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	String id = request.getParameter("memId");
	MemberDTO member = memberBean.getMember(id);
%>
<jsp:include page="/admin/adm.header.jsp" />
<link rel="stylesheet" href="<%=root%>/css/mypageEdit.css">
<div class="wrapper">	
	<table>
		<form name="memForm" action="<%=root %>/bbs/editMemRes.jsp?memId=<%=id %>" method="post" enctype="multipart/form-data" style="flex-wrap: nowrap;">
			<input type="file" name="profpic" style="display: none;" accept="image/jpeg, image/png">
			<div class="upload-pic">
				<a href="javascript:void(0)" onclick="memForm.profpic.click();"><i class="fas fa-camera"></i></a>
				<img <%if(member.getProfpic() != null) out.println("src=\"" + root + "/data/member/" + id + "/" + member.getProfpic() + "\"");
				else out.println("src");%>>
				<%out.println("src=\"" + root + "/data/member/" + id + "/" + member.getProfpic() + "\""); %>
			</div>
			<div class="form-wrapper">
				<fieldset class="form-item">
					<legend>회원 정보</legend>
				
					<div class="input-item">
						<input class="full" type="text" name="name" id="name" oninput="chk(this);" minlength="2" maxlength="10" value="<%=member.getName()%>">
						<label for="name">이름</label>
						<span class="indicator"></span>
					</div>
					<div class="input-item">
						<input class="full" type="text" name="nick" id="nick" oninput="chk(this);" minlength="1" maxlength="20" value="<%=member.getNick()%>">
						<label for="nick">별명</label>
						<span class="indicator">1~20자</span>
					</div>
					<div class="input-item">
						<input class="full" type="password" name="pw" id="pw" oninput="chk(this);" minlength="6" maxlength="20" value="<%=member.getPw()%>">
						<label for="pw">비밀번호</label>
						<span class="indicator">6~20자의 영문 및 숫자</span>
					</div>
					<div class="input-item">
						<input class="full" type="password" oninput="chk(this);" oninput="chk(this);" name="pwChk" id="pwChk" minlength="6" maxlength="20" value="<%=member.getPw()%>">
						<label for="pwChk">비밀번호 확인</label>
						<span class="indicator"></span>
					</div>
				</fieldset>
				<hr class="line">
				<fieldset class="form-item">
					<legend>배송지 정보</legend>
					
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
					<div class="input-item">
						<input class="full" type="email" name="email" id="email" oninput="chk(this);" value="<%=member.getEmail()%>">
						<label for="email">e-mail</label>
						<span class="indicator">abc123@domain.net</span>
					</div>
				</fieldset>
			</form>
		</div>
		
		<div id="open-zip">
		<img src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		
		<a id="submit" class="ui-btn point big" onclick="formSubmit(memForm);">수정하기</a>
	</table>
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
		        memForm.zip.value = data.zonecode;
		        memForm.add1.value = addr;
		        memForm.add2.focus();

				//false 상태 없애기
		   		memForm.zip.parentNode.classList.remove('false');
		    	memForm.add1.parentNode.classList.remove('false');
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
	        height : '100%',
	       	theme : {}
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
		        	msg = '';
	        		inputItem.classList.remove('false');
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
		    	
	    // pw 확인
	   	if(id == 'pw' || id == 'pwChk'){
		   	if(memForm.pw.value != memForm.pwChk.value){
		   		msg = '비밀번호가 같지 않아요';
		   		memForm.pwChk.parentNode.classList.add('false');
		   	} else {
		  		msg = '';
		  		memForm.pwChk.parentNode.classList.remove('false');
		   	}
		   	printMsg(msg, memForm.pwChk.parentNode.querySelector('.indicator'));
    	}
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
		    

	memForm.profpic.addEventListener('change', (e) => {
		let img = document.querySelector('.upload-pic img');
		let reader = new FileReader();
		reader.onload = (e) => {
			img.src = e.target.result;
		}
		reader.readAsDataURL(memForm.profpic.files[0]);
	})
</script>
<jsp:include page="/admin/adm.footer.jsp" />