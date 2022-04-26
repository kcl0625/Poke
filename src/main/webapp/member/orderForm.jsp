<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="order.OrderDTO"%>
<%@page import="member.MemberDTO"%>
<%@include file="/config.jsp" %>
<%if (isAdm == 1) out.write("<script>alert('잘못된 접근입니다');location.href = '" + root + "/index.jsp';</script>");
if (isMem == 0) response.sendRedirect(root + "/bbs/loginForm.jsp");%>

<jsp:useBean id="memberBean" class="member.MemberDAO" />
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
MemberDTO member = memberBean.getMember(sessionId);%>

<link rel="stylesheet" href="<%=root %>/css/order.css">
<script src="<%=root %>/js/order.js"></script>
<jsp:include page="/header.jsp" />

<div class="wrapper form-wrapper" style="flex-wrap: wrap;">
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
				<div class="input-item">
					<input class="full" type="email" name="email" id="email" oninput="chk(this);" value="<%=member.getEmail()%>">
					<label for="email">e-mail</label>
					<span class="indicator">abc123@domain.net</span>
				</div>
			</fieldset>
			<fieldset class="payment">
				<legend>payment</legend>
				<input type="hidden" name="payment" value="무통장입금">
				<input type="hidden" name="isPaid" value="n">
				<div class="input-item check">
					<input type="radio" name="chkpayment" id="deposit" onclick="showPaymentForm(this.id, '무통장입금', 'n');" checked>
					<label for="deposit"><span></span>무통장입금</label>
				</div>
				<div class="input-item check">
					<input type="radio" name="chkpayment" id="kakaopay" onclick="showPaymentForm(this.id, '카카오페이', 'y');">
					<label for="kakaopay"><span></span>카카오페이</label>
				</div>
				
				<div class="deposit payform" style="display:block;">
					<div class="input-item">
						<input class="full" type="text" name="depositor" id="depositor" oninput="chk(this);" minlength="2" maxlength="10" value="<%=member.getName()%>">
						<label for="tel">입금자명</label>
						<span class="indicator"></span>
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
						
						<div class="input-item check">
							<input type="radio" name="receipt" id="y">
							<label for="y"><span></span>현금영수증 신청</label>
						</div>
						<div class="input-item check">
							<input type="radio" name="receipt" id="n" checked>
							<label for="n"><span></span>신청안함</label>
						</div>
					</div>
				</div>
				
				<div class="kakaopay payform" style="display:none;">
					<p>- 카카오톡 앱을 설치한 후, 최초 1회 카드정보를 등록하셔야 사용 가능합니다.<br>
					- 인터넷 익스플로러는 8 이상에서만 결제 가능합니다.<br>
					- 카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.
					</p>
				</div>
			</fieldset>
		</div>
		<hr class="line">
		<div class="form-item">
			<fieldset class="cart">
				<legend>cart</legend>
				<div class="theme-box">
					<div class="list">
						<%
						int week = Integer.parseInt(request.getParameter("week"));
						String param = request.getParameter("param"); //json 객체 받아오기
						JSONParser jsonParser = new JSONParser();
						JSONObject jsonObj = (JSONObject) jsonParser.parse(param);
	
						JSONArray pokeArr = (JSONArray) jsonObj.get("pokeArr");
						JSONArray etcArr = (JSONArray) jsonObj.get("etcArr");
						
						ArrayList<OrderDTO> orderArr = new ArrayList<OrderDTO>();
						int planTot = 0;
						int etcTot = 0;%>
						<ul>
							<% for(int i=0;i<pokeArr.size();i++){
								JSONObject poke = (JSONObject) pokeArr.get(i);
								String day = (String)poke.get("day");
								int itemPrice = Integer.parseInt(String.valueOf(poke.get("price")));
								int quantity = day.split("/").length;
								planTot += itemPrice * quantity;
								
								OrderDTO dto = new OrderDTO();
								
								dto.setType("poke");
								dto.setName((String)poke.get("name"));
								dto.setIngre((String)poke.get("ingre"));
								dto.setDay(day);
								dto.setPrice(itemPrice);
								dto.setWeek(week);
								
								orderArr.add(dto);%>
								<li>
									<input type="hidden" name="type" value="poke">
									<input type="hidden" name="name" value="<%=poke.get("name") %>">
									<input type="hidden" name="ingre" value="<%=poke.get("ingre") %>">
									<input type="hidden" name="day" value="<%=day %>">
									<input type="hidden" name="price" value="<%=itemPrice%>">
									<p class="name"><%=poke.get("name") %></p>
									<p class="quantity"><%=day.split("/").length %></p>
									<p class="price">￦<%=String.format("%,d", quantity * itemPrice) %></p>
								</li>
							<%} %>
							<% for(int i=0;i<etcArr.size();i++){
								JSONObject etc = (JSONObject) etcArr.get(i);
								int itemPrice = Integer.parseInt(String.valueOf(etc.get("price"))); 
								int quantity = Integer.parseInt(String.valueOf(etc.get("quantity")));
								etcTot += itemPrice * quantity;
								
								OrderDTO dto = new OrderDTO();
								
								dto.setType("etc");
								dto.setName((String)etc.get("name"));
								dto.setQuantity(quantity);
								dto.setPrice(itemPrice);
								
								orderArr.add(dto);%>
								<li>
									<input type="hidden" name="type" value="etc">
									<input type="hidden" name="name" value="<%=etc.get("name") %>">
									<input type="hidden" name="quantity" value="<%=quantity%>">
									<input type="hidden" name="price" value="<%=itemPrice%>">
									<p class="name"><%=etc.get("name") %></p>
									<p class="quantity"><%=etc.get("quantity") %></p>
									<p class="price">￦<%=String.format("%,d", quantity * itemPrice) %></p>
								</li>
							<%}
							session.setAttribute("orderItem", orderArr);%>
						</ul>
					</div>
					<p class="leng txt-center" style="margin-top: .75rem;">
						<script>
							let li = document.querySelectorAll('.cart li');
							document.write('총 ' + li.length + '개');
						</script>
					</p>
				</div>
			</fieldset>
			<fieldset class="receipt">
				<legend>receipt</legend>
				<div class="theme-box">
					<div class="price">
						<div class="plan txt-right">
							<span class="price-name">플랜 금액</span>
							<p>(
								<span class="plan-price">￦<%=String.format("%,d", planTot) %></span>*<span class="plan-week"><%=week %></span>
							)</p>
						</div>
						<div class="additional txt-right">
							<span class="price-name">추가 구매</span>
							<p>￦<%=String.format("%,d", etcTot) %></p>
						</div>
						<div class="ship txt-right">
							<span class="price-name">배송비</span>
							<p>￦<%=String.format("%,d", 3000) %></p>
						</div>
					</div>
					<div class="total">
						<input type="hidden" name="totPrice" value="<%=planTot * week + etcTot + 3000 %>">
						<span>total</span>
						<span class="total-price">￦<%=String.format("%,d", planTot * week + etcTot + 3000) %></span>
					</div>
				</div>
			</fieldset>
			<button type="button" class="ui-btn point big full" onclick="formSubmit(order);">주문하기</button>
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
		    		printMsg('', order.zip.parentNode.querySelector('.indicator'));
		    		printMsg('', order.add1.parentNode.querySelector('.indicator'));
						
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
		    	if(min && max && value.length < min || value.length > max){
		    		msg = '길이가 너무 짧거나 길어요';
	        		inputItem.classList.add('false');
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
		   			case 'depositor':
		    			ptn = /^[가-힣]+$/;
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
		
		let showPaymentForm = (id, val, isPaidVal) => {
			let payForm = document.querySelectorAll('.payform');
			let selected = document.querySelector('.' + id);
			if (id == 'kakaopay') {
				order.action = 'kakaopay.jsp';
			} else {
				order.action = 'order.jsp';
			}
			for(let i=0;i<payForm.length;i++)
				payForm[i].style.display = 'none';
			selected.style.display = 'block';
			order.payment.value = val;
			order.isPaid.value = isPaidVal;
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
		    if(!form.querySelector('.false')) {
		    	form.submit();
		    }
		}
		
	    let payment = (userAgent) => {
	        var url = '/demo/pay/prepare'
	        var params = {
	            agent: userAgent,
	            itemCode: '1',
	            quantity: '5',
	        }
	        location.href = url + '?' + $.param(params)
	    }    
</script>

<jsp:include page="/footer.jsp" />