//슬라이더
let slider = document.querySelector('.slider-container');
let ul = slider.querySelector('ul');
let item = slider.querySelectorAll('li');
let itemW = item[0].offsetWidth;
let wrapperL = 4; //한 번에 보여줄 개수
let gap = 15; //간격

let cur = 0;

let slide = () => {
	slider.style.width = `${itemW * wrapperL + gap * 3}px`;
	ul.style.width = `${itemW * item.length + gap * (item.length - 1)}px`;
}
slide();

let prev = () => {
	if(cur != 0) cur--;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

let next = () => {
	if(cur < (item.length / wrapperL - 1)) cur++;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

//재료 툴팁
let showInfo = (item) => {
	let price = item.dataset.price;
	let cal = item.dataset.cal;
	let origin = item.dataset.origin.split('/');
	
	let div = document.createElement('div');
	item.appendChild(div);
	
	div.classList.add('info-box');
	let infoBox = item.querySelector('.info-box');
	
	infoBox.innerHTML = `￦${price}<br>${cal}kacl<hr class="line">`;
	
	for(let i=0;i<origin.length;i++)
		infoBox.innerHTML += `${origin[i]}<br>`;
}

let hideInfo = (item) => {
	item.querySelector('.info-box').remove();
}
//이름 짓기
let naming = (writeName) => {
	if(writeName.classList.contains('toggle')){
		if(!writeName.querySelector('input[type="text"]').value)
			writeName.classList.remove('toggle');
	} else writeName.classList.add('toggle');
}

//재료 드래그 앤 드롭
let bowl = document.querySelector('#bowl');
let dragged;

let dragStart = (item) => {
	dragged = item;
}
let drop = () => {
	event.preventDefault();
}

let itemL = 0; //넣은 재료의 수
let itemMax = 13; //최대 재료 개수(시간 되면 관리자 페이지에서 수정 가능하게)
let indicator = document.querySelector('.indicator');
let msg;

let addItem = (e) => {
	if (itemL != itemMax){
		let name = dragged.dataset.name;
		let price = dragged.dataset.price;
		let imgSrc = dragged.querySelector('img').getAttribute('src');
		
		let div = document.createElement('div');
		
		div.classList.add('item');
		div.innerHTML = `<img src="${imgSrc}">`;
		div.setAttribute('ondragstart', 'dragStart(this)');
		bowl.appendChild(div);
		
		itemL++;
	} else {
		msg = `그릇이 꽉 찼어요<br>재료는 최대 ${itemMax}개까지 담을 수 있어요`;
		printMsg(msg, indicator);
	}
}

let addCart = (e) => {
	e.preventDefault();
	if(itemL == 0) {
		msg = '재료를 담아주세요';
		printMsg(msg, indicator);
	}
	
	if(!menu.poke_name.value){
		msg = '메뉴 이름을 입력해주세요';
		printMsg(msg, indicator);
	}
	
	if(itemL != 0 && menu.poke_name.value)
		menu.submit();
}

let dropItem = (e) => {
	bowl.removeChild(dragged);
	itemL--;
}