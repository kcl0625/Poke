//슬라이더
let slider = document.querySelector('.slider-container');
let ul = slider.querySelector('ul');
let item = slider.querySelectorAll('li');
let itemW;
let wrapperL = 4; //한 번에 보여줄 개수
let gap; //간격

let cur = 0;

let getItemW = () => {
	itemW = item[0].offsetWidth;
	return itemW;
}

let slide = () => {
	getItemW();
	if (matchMedia('all and (max-width: 750px)').matches) {
		gap  = 15;
	} else {
		gap = 30;
	}
	slider.style.width = `${itemW * wrapperL + gap * (wrapperL - 1)}px`;
	ul.style.width = `${itemW * item.length + gap * (item.length - 1)}px`;
	ul.style.gap = `${gap}px`;
}

let prev = () => {
	getItemW();
	if(cur != 0) cur--;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}
let next = () => {
	getItemW();
	if(cur < (item.length / wrapperL - 1)) cur++;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

slide();
window.addEventListener('resize', () => {
	console.log('resize');
	slide();
})

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
	let origin;
	if (item.dataset.origin) {origin = item.dataset.origin.split('/');}
	
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

let totPrice = 0;
let totCal = 0;

let addItem = (e) => {
	if (itemL != itemMax){
		itemL++;
		
		let name = dragged.dataset.name;
		let price = parseInt(dragged.dataset.price);
		let cal= parseFloat(dragged.dataset.cal);
		let imgSrc = dragged.querySelector('img').getAttribute('src');
		
		let div = document.createElement('div');
		
		div.id = `item_${itemL}`;
		div.classList.add('item');
		div.classList.add(`ingre_${itemL}`);
		div.innerHTML = `<img src="${imgSrc}">`;
		div.setAttribute('onclick', 'dropItem(this)');
		div.setAttribute('onmouseover', 'showInfo(this)');
		div.setAttribute('onmouseout', 'hideInfo(this)');
		div.setAttribute('data-name', name);
		div.setAttribute('data-price', price);
		div.setAttribute('data-cal', cal);
		
		bowl.appendChild(div);
		
		let receipt = document.querySelector('.receipt');
		let receiptUl = receipt.querySelector('ul');
		
		let li = document.createElement('li');
		li.classList.add('ingre');
		li.classList.add(`ingre_${itemL}`);
		li.setAttribute('data-name', name);
		
		li.innerHTML = `<span class="name">${name}</span> <span class="cal">${cal}kcal</span> <span class="dot">···</span> <span class="price">￦${price}</span>`;
		receiptUl.appendChild(li); 
		
		totPrice += price;
		totCal += cal;
		
		menu.price.value = `￦${totPrice}`;
		menu.cal.value = `${totCal}kcal`;
		menu.ingre.value += `${name}/`;
	} else {
		msg = `그릇이 꽉 찼어요<br>재료는 최대 ${itemMax}개까지 담을 수 있어요`;
		printMsg(msg, indicator);
	}
}

let dropItem = (item) => {
	let id = item.id.charAt(item.id.length - 1);
	
	msg = '';
	printMsg(msg, indicator);
	
	let delItem = document.querySelectorAll(`.ingre_${id}`);
	let price = delItem[0].dataset.price;
	let cal = delItem[0].dataset.cal;
	
	totPrice -= price;
	totCal -= cal;
	
	menu.price.value = `￦${totPrice}`;
	menu.cal.value = `${totCal}kcal`;
	
	delItem[0].remove();
	delItem[1].remove();
	
	itemL--;
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

let clear = () => {
	let bowl = document.querySelector('#bowl');
	let receipt = document.querySelector('.receipt');
	
	let bowlItem = bowl.querySelectorAll('.item');
	let rcpItem = receipt.querySelectorAll('.ingre');
	
	for(let i = 0;i<bowlItem.length;i++)
		bowlItem[i].remove();
	for(let i = 0;i<rcpItem.length;i++)
		rcpItem[i].remove();
		
	totPrice = 0;
	totCal = 0;
	msg = '';
	itemL = 0;

	printMsg(msg, indicator);
	menu.price.value = `￦${totPrice}`;
	menu.cal.value = `${totCal}kcal`;
}

// 카테고리 선택
let selectCategory = (item) => {
	let cate = item.dataset.cate;
	let cateLi = document.querySelectorAll('.category li');
	
	
}