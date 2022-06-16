//재료 드래그 앤 드랍
let itemMax = 13; //최대 재료 개수(시간 되면 관리자 페이지에서 수정 가능하게)
let msg;

let totPrice = 0;
let totCal = 0;

let ingreList = [];

document.addEventListener('DOMContentLoaded', () => {
	let li = document.querySelectorAll('.add-ingre-list li');
	
	if (li.length != 0) {
		for(let i=0;i<li.length;i++) {
			totPrice += parseInt(li[i].dataset.price);
			totCal += parseFloat(li[i].dataset.cal);
			ingreList.push(li[i].dataset.name);
		}
	}
})

let addItem = (ingre) => { //재료 추가
	let indicator = document.querySelector('.indicator');
	let ingreUl = document.querySelector('.add-ingre-list ul');
	
	if (ingreList.length != itemMax){
		let name = ingre.dataset.name;
		let price = parseInt(ingre.dataset.price);
		let cal= parseFloat(ingre.dataset.cal);
		
		let li = document.createElement('li');
		
		li.id = `item_${ingreList.length}`;
		li.classList.add(`ingre_${ingreList.length}`);
		li.setAttribute('onclick', 'dropItem(this)');
		li.setAttribute('data-name', name);
		li.setAttribute('data-price', price);
		li.setAttribute('data-cal', cal);
		
		li.innerHTML = name;
		ingreUl.appendChild(li); 
		
		totPrice += price;
		totCal += cal;
		
		poke.price.value = totPrice;
		poke.cal.value = totCal;
		ingreList.push(name);
	} else {
		msg = `그릇이 꽉 찼어요<br>재료는 최대 ${itemMax}개까지 담을 수 있어요`;
		printMsg(msg, indicator);
	}
}

let dropItem = (item) => { //재료 삭제
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
	
	let i = ingreList.indexOf(name);
	ingreList.splice(i, 1);
	
	delItem[0].remove();
	delItem[1].remove();
}

let menuSubmit = (no, type, name, price, custom) => {
	check();
	let ingre;
	for(let i=0;i<ingreList.length;i++){
		if(i == 0)
			ingre = ingreList[i];
		else
			ingre += `/${ingreList[i]}`;
	}
	
	if(ingreList.length != 0 && name) {
		new Promise((resolve, reject) => {
			window.setTimeout(() => {
				resolve();
			}, 1);
		})
		.then(() => {
			addMenu(no, type, name, ingre, price, custom);
		})
		.catch((val) => {
			console.log('beforeend', val);
		})
	}
}

let menuMod = (no, type, name, price, custom) => {
	check();
	let ingre;
	for(let i=0;i<ingreList.length;i++){
		if(i == 0)
			ingre = ingreList[i];
		else
			ingre += `/${ingreList[i]}`;
	}
	
	if(ingreList.length != 0 && name) {
		new Promise((resolve, reject) => {
			window.setTimeout(() => {
				resolve();
			}, 1);
		})
		.then(() => {
			modMenu(no, type, name, ingre, price, custom);
		})
		.catch((val) => {
			console.log('beforeend', val);
		})
	}
}

let check = () => { //유효성 검사
	let indicator = document.querySelector('.indicator');
	if(!menu.name.value)
		menu.name.value = 'POKE';
	else {
		if(ingreList.length == 0) msg = '재료를 담아주세요';
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

	printMsg(msg, indicator);
	priceShow.innerHTML = `￦${totPrice.toLocaleString('en-IE')}`;
	calShow.innerHTML = `${totCal.toLocaleString('en-IE')}kcal`;
	menu.price.value = totPrice;
	menu.cal.value = totCal;
}