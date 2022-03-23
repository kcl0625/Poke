<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/header.sub.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/write.css">


<script>
	let run = () => {
		document.querySelector('.textarea').contentWindow.document.designMode = 'on';
	}
</script>
<a class="go-back" href="${pageContext.request.contextPath}/review/list.jsp"><svg viewBox="0 0 25 50"><polyline class="stroke only" stroke-miterlimit="10" points="25,0 0,25 25,50"/></svg>back</a>
<div class="wrapper" onload="run();">
	<form name="write" action="${pageContext.request.contextPath}/bbs/write.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="photo" style="display:none;" accept="image/jpeg, image/png">
		<div class="photo"><img src=""></div>
		<div class="form-right">
			<div class="write-top">
				<div class="select">
					<input type="hidden" name="poke_name" value="POKE - 1">
					<div class="selected select-item">POKE - 1</div>
					<div class="select-wrapper">
						<ul>
							<li class="select-item" data-data="POKE - 1" style="--i: 1;">POKE - 1</li>
							<li class="select-item" data-data="POKE - 2" style="--i: 2;">POKE - 2</li>
							<li class="select-item" data-data="POKE - 3" style="--i: 3;">POKE - 3</li>
						</ul>
					</div>
				</div>
				
				<div class="star-ratings">
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
			<iframe id="textarea" class="textarea"></iframe>
		</div>
		
		<div class="write-bottom">
			<div class="edit">
				<button type="button" class="add-photo"><i class="fas fa-camera" onclick="write.photo.click();"></i></button>
				<div class="txt-option">
					<button type="button" id="b">B</button>
					<button type="button" id="i">I</button>
					<button type="button" id="u">U</button>
					<button type="button" id="t">T</button>	
				</div>
			</div>
			
			<div class="pn">
				<button type="button" class="ui-btn" onclick="location.href='${pageContext.request.contextPath}/review/list.jsp'">취소</button>
				<button type="button" class="ui-btn point" onclick="formWrite(menu);">완료</button>
			</div>
		</div>
	</form>
	
	<script>
		write.photo.addEventListener('change', (e) => {
			let fReader = new FileReader();
			fReader.readAsDataURL(write.photo.files[0]);
			fReader.onloaded = (e) => {
				document.querySelector('.photo img').src = e.target.result;
			}
		})
	</script>
</div>