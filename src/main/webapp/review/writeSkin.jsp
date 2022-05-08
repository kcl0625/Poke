<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="order.OrderDTO"%>
<%@page import="order.ItemDTO"%>
<%@page import="member.MemberDTO"%>
<%@include file="/config.jsp" %>

<jsp:useBean id="orderBean" class="order.OrderDAO" />
<jsp:useBean id="memberBean" class="member.MemberDAO" />

<%if (isMem == 0){response.sendRedirect(root + "/bbs/loginForm.jsp");}
else if (isAdm == 1) {
	out.write("<script>alert('잘못된 접근입니다'); location.href = '" + root + "/index.jsp';</script>");
}
OrderDTO pokeOrder = orderBean.getPokeOrder(sessionId);
ArrayList<ItemDTO> pokeOrderArr = pokeOrder.getPoke();

int total = 0;
if(pokeOrderArr != null) total = pokeOrderArr.size();
else out.write("<script>alert('주문을 먼저 진행해주세요'); location.href = '" + root + "/index.jsp';</script>");
MemberDTO member = memberBean.getMember(sessionId);
%>

<jsp:include page="/header.sub.jsp" />
<link rel="stylesheet" href="<%=root%>/css/write.css">

<a class="go-back" href="<%=root%>/review/list.jsp"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg>back</a>
<div class="wrapper">
	<form name="write" action="write.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="nick" value="<%=member.getNick()%>">
		<input type="file" name="photo" style="display:none;" accept="image/jpeg, image/png">
		<input type="hidden" name="poke" value="<%=pokeOrderArr.get(0).getName()%>">
		<input type="hidden" name="ingre" value="<%=pokeOrderArr.get(0).getIngre()%>">
		<input type="hidden" name="content">
		
		<div class="photo"><img src=""><span class="indicator"></span></div>
		<div class="form-right">
			<div class="write-top">
				<div class="select">
					<input type="hidden" name="poke_name" value="POKE - 1">
					<div class="selected select-item"><%=pokeOrderArr.get(0).getName() %></div>
					<div class="select-wrapper">
						<ul>
							<%for (int i=0;i<total;i++){%>
								<li class="select-item" data-data="<%=pokeOrderArr.get(i).getName() %>" data-ingre="<%=pokeOrderArr.get(i).getIngre() %>" style="--i: <%=i+1%>;"><%=pokeOrderArr.get(i).getName() %></li>
							<%} %>
						</ul>
					</div>
				</div>
				
				<div class="star-ratings">
					<span class="indicator"></span>
					<input type="radio" id="5-star" name="rating" value="5" v-model="ratings"/>
					<label for="5-star" class="star pr-4"><i class="fas fa-star"></i></label>
					<input type="radio" id="4-star" name="rating" value="4" v-model="ratings"/>
					<label for="4-star" class="star"><i class="fas fa-star"></i></label>
					<input type="radio" id="3-star" name="rating" value="3" v-model="ratings"/>
					<label for="3-star" class="star"><i class="fas fa-star"></i></label>
					<input type="radio" id="2-star" name="rating" value="2" v-model="ratings"/>
					<label for="2-star" class="star"><i class="fas fa-star"></i></label>
					<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
					<label for="1-star" class="star"><i class="fas fa-star"></i></label>
				</div>
			</div>
			<hr class="line">
			<div id="textarea" class="textarea" name="content" contenteditable="true" placeholder="내용을 입력해주세요"></div>
		</div>
		
		<div class="write-bottom">
			<div class="edit">
				<button type="button" class="add-photo"><i class="fas fa-camera" onclick="write.photo.click();"></i></button>
				<div class="txt-option">
					<button type="button" id="b" onclick="document.execCommand('bold');">B</button>
					<button type="button" id="i" onclick="document.execCommand('italic');">I</button>
					<button type="button" id="u" onclick="document.execCommand('underline');">U</button>
					<button type="button" id="t" onclick="document.execCommand('strikethrough');">T</button>	
				</div>
			</div>
			
			<div class="pn">
				<button type="button" class="ui-btn" onclick="location.href='<%=root%>/review/list.jsp'">취소</button>
				<button type="button" class="ui-btn point" onclick="formWrite();">완료</button>
			</div>
		</div>
	</form>
	
	<script>
		write.photo.addEventListener('change', (e) => {
			let img = document.querySelector('.photo img');
			let reader = new FileReader();
			let indicator = document.querySelector('.photo .indicator');
			reader.onload = (e) => {
				img.src = e.target.result;
			}
			indicator.innerHTML = '';
			reader.readAsDataURL(write.photo.files[0]);
		})
		
		let pokeLi = document.querySelectorAll('.select-wrapper li');
		pokeLi.forEach((item, i) => {
			pokeLi[i].addEventListener('click', () => {
				write.poke.value = pokeLi[i].dataset.data;
				write.ingre.value = pokeLi[i].dataset.ingre;
			})
		})
		
		let formWrite = () => {
			let textarea = document.querySelector('#textarea');
			
			if (!write.photo.value) {
				let indicator = document.querySelector('.photo .indicator');
				indicator.innerHTML = '사진을 업로드해주세요';
				return false;
			} else {
				let indicator = document.querySelector('.photo .indicator');
				indicator.innerHTML = '';
			}
			if (!write.rating.value) {
				let indicator = document.querySelector('.star-ratings .indicator');
				indicator.innerHTML = '별점을 입력해주세요';
				return false;
			} else {
				let indicator = document.querySelector('.star-ratings .indicator');
				indicator.innerHTML = '';
			}
			if (!textarea.textContent) {
				textarea.textContent = '내용을 입력해주세요!';
				return false;
			}
			
			write.content.value = textarea.innerHTML;
			write.submit();
		}
	</script>
</div>