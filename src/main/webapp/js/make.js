let wrapperL = 4; //한 번에 보여줄 개수
let gap = 30; //간격
			
let cur = 0;
			
//슬라이더
let slide = () => {
	let slider = document.querySelector('.slider-container');
	let ul = slider.querySelector('ul');
	let item = ul.querySelectorAll('li');
	let itemW = item[0].offsetWidth;
	
	if (matchMedia('all and (max-width: 750px)').matches) gap  = 15;
	else gap = 30;
	
	slider.style.width = itemW * wrapperL + gap * (wrapperL - 1) + 'px';
	ul.style.left = 0;
	ul.style.width = itemW * item.length + gap * (item.length - 1) + 'px';
	ul.style.gap = gap + 'px';
}
//prev
let prev = () => {
	let ul = document.querySelector('.slider-container ul');
	let item = ul.querySelectorAll('li');
	let itemW = item[0].offsetWidth;
	if(cur != 0) cur--;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

//next
let next = () => {
	let ul = document.querySelector('.slider-container ul');
	let item = ul.querySelectorAll('li');
	let itemW = item[0].offsetWidth;
	if(cur < (item.length / wrapperL - 1)) cur++;
	ul.style.left = `-${cur * wrapperL * (itemW + gap)}px`;
}

window.addEventListener('resize', () => {
	slide();
})

//재료 툴팁
let toolTip1 = (price, cal, origin, infoBox) => {
	origin = origin.split('/');
	infoBox.innerHTML = `￦${price}<br>${cal}kcal<hr class="line">`;
	for(let i=0;i<origin.length;i++)
		infoBox.innerHTML += `${origin[i]}<br>`;
}
let toolTip2 = (name, price, cal, infoBox) => {
	infoBox.innerHTML = `${name}<hr class="line">￦${price}<br>${cal}kcal`;
}

let showInfo = (item, e) => {
	e.stopImmediatePropagation();
	let name = item.dataset.name;
	let price = item.dataset.price;
	let cal = item.dataset.cal;
	let origin = item.dataset.origin;
	
	let div = document.createElement('div');
	item.appendChild(div);
	
	div.classList.add('info-box');
	let infoBox = item.querySelector('.info-box');
	
	if (item.closest('.slider')) toolTip1(price, cal, origin, infoBox);
	else if (item.closest('#bowl')) toolTip2(name, price, cal, infoBox);
}

let hideInfo = (item, e) => {
	e.stopImmediatePropagation();
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
let msg;

let totPrice = 0;
let totCal = 0;

let ingre = [];

let addItem = (e) => {
	let indicator = document.querySelector('.indicator');
	let bowl = document.querySelector('#bowl');
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
		div.setAttribute('onmouseenter', 'showInfo(this, event)');
		div.setAttribute('onmouseleave', 'hideInfo(this, event)');
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
		
		let priceShow = document.querySelector('#price');
		let calShow = document.querySelector('#cal');
		totPrice += price;
		totCal += cal;
		
		priceShow.innerHTML = `￦${totPrice.toLocaleString('en-IE')}`;
		calShow.innerHTML = `${totCal.toLocaleString('en-IE')}kcal`;
		menu.price.value = totPrice;
		menu.cal.value = totCal;
		ingre.push(name);
	} else {
		msg = `그릇이 꽉 찼어요<br>재료는 최대 ${itemMax}개까지 담을 수 있어요`;
		printMsg(msg, indicator);
	}
}

let dropItem = (item) => {
	let id = item.id.charAt(item.id.length - 1);
	let name = item.dataset.name;
	let indicator = document.querySelector('.indicator');
	let priceShow = document.querySelector('#price');
	let calShow = document.querySelector('#cal');
	
	msg = '';
	printMsg(msg, indicator);
	
	let delItem = document.querySelectorAll(`.ingre_${id}`);
	let price = delItem[0].dataset.price;
	let cal = delItem[0].dataset.cal;
	
	totPrice -= price;
	totCal -= cal;
	
	priceShow.innerHTML = `￦${totPrice.toLocaleString('en-IE')}`;;
	calShow.innerHTML = `${totCal.toLocaleString('en-IE')}kcal`;
	menu.price.value = totPrice;
	menu.cal.value = totCal;
	
	let i = ingre.indexOf(name);
	ingre.splice(i, 1);
	
	delItem[0].remove();
	delItem[1].remove();
	
	itemL--;
}

addMenu = (e) => {
	e.preventDefault();
	check();
	if(itemL != 0 && menu.name.value) {
		for(let i=0;i<ingre.length;i++){
			if(i == 0)
				menu.ingre.value = ingre[i];
			else
				menu.ingre.value += `/${ingre[i]}`;
		}
		
		new Ajax.Request('../member/addCart.jsp?type=' + menu.type.value + '&name=' + menu.name.value + '&ingre=' + menu.ingre.value + '&price=' + menu.price.value, {
			method: 'post',
			parameter: {
				type: menu.type.value,
				name: menu.name.value,
				ingre: menu.ingre.value,
				price: menu.price.value
			},
			onComplete: (response) => {
				let popup = document.querySelector('#popup');
				let mask = document.querySelector('#mask');
				popup.innerHTML = response.responseText;
				popup.classList.add('show');
				mask.classList.add('show');
			}
		})
	}
}

let check = () => { //유효성 검사
	let indicator = document.querySelector('.indicator');
	if(!menu.name.value)
		menu.name.value = 'POKE';
	else {
		if(itemL == 0) msg = '재료를 담아주세요';
		else msg = '';
		printMsg(msg, indicator);
	}
}

let clear = () => {
	let indicator = document.querySelector('.indicator');
	let priceShow = document.querySelector('#price');
	let calShow = document.querySelector('#cal');
	
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
	priceShow.innerHTML = `￦${totPrice.toLocaleString('en-IE')}`;
	calShow.innerHTML = `${totCal.toLocaleString('en-IE')}kcal`;
	menu.price.value = totPrice;
	menu.cal.value = totCal;
}