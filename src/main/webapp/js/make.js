//슬라이더
let slider = document.querySelector('.slider-container');
let ul = slider.querySelector('ul');
let item = slider.querySelectorAll('li');
let itemW = item[0].offsetWidth;
let wrapperL = 4; //한 번에 보여줄 개수
let gap = 30; //간격

let cur = 0;

let slide = () => {
	slider.style.width = `${itemW * wrapperL + gap * 3}px`;
	ul.style.width = `${itemW * item.length + gap * (item.length - 1)}px`;
}
slide();
window.addEventListener('resize', () => {
	slide();
})

let prev = () => {
	if(cur != 0) cur--;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

let next = () => {
	if(cur < (item.length / wrapperL - 1)) cur++;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

//재료 툴팁
let toolTip1 = (price, cal, origin, infoBox) => {
	infoBox.innerHTML = `￦${price}<br>${cal}kacl<hr class="line">`;
	
	for(let i=0;i<origin.length;i++)
		infoBox.innerHTML += `${origin[i]}<br>`;
}
let toolTip2 = (name, price, cal, infoBox) => {
	infoBox.innerHTML = `${name}<hr class="line">￦${price}<br>${cal}kcal`;
}

let showInfo = (item) => {
	let name = item.dataset.name;
	let price = item.dataset.price;
	let cal = item.dataset.cal;
	let origin = item.dataset.origin.split('/');
	
	let div = document.createElement('div');
	item.appendChild(div);
	
	div.classList.add('info-box');
	let infoBox = item.querySelector('.info-box');
	
	if (item.closest('.slider')) toolTip1(price, cal, origin, infoBox);
	else if (item.closest('#bowl')) toolTip2(name, price, cal, infoBox);
}

let hideInfo = (item) => {
	item.querySelector('.info-box').remove();
}

//재료 드래그 앤 드롭
let bowl = document.querySelector("#bowl");
let bowlSVG = document.querySelector('#bowl svg');
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
		div.setAttribute('onclick', 'dropItem(this)');
		div.setAttribute('onmouseover', 'showInfo(this)');
		div.setAttribute('onmouseout', 'hideInfo(this)');
		
		bowl.appendChild(div);
		
		itemL++;
		check();
	} else {
		msg = `그릇이 꽉 찼어요<br>재료는 최대 ${itemMax}개까지 담을 수 있어요`;
		printMsg(msg, indicator);
	}
}

let addCart = (e) => {
	e.preventDefault();
	check();
	if(itemL != 0 && menu.poke_name.value)
		menu.submit();
}

let check = () => { //유효성 검사
	if(!menu.poke_name.value)
		menu.poke_name.value = 'POKE';
	else {
		if(itemL == 0)
			msg = '재료를 담아주세요';
		else
			msg = '';
	}
	
	printMsg(msg, indicator);
}

let dropItem = (item) => {
	bowl.removeChild(item);
	itemL--;
}