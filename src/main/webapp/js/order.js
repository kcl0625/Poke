let etcTotPrice = 0;

let pokeItem = (type, name, price, ingre, day) => {
	this.type = type;
	this.name = name;
	this.price = price;
	this.ingre = ingre;
	this.day = day;
}

let etcItem = (type, name, price, quantity) => {
	this.type = type;
	this.name = name;
	this.price = price;
	this.quantity = quantity;
}

let getPokeItem = () => {return new pokeItem(type, name, price, ingre, day);}
let getetcItem = () => {return new etcItem(type, name, price, quantity);}

document.addEventListener('DOMContentLoaded', () => {
	let plan = document.querySelectorAll('.plan.list-container .item-list li');
	let pokeTotPrice = 0;

	plan.forEach((item, i) => {
		let dayChk = plan[i].querySelectorAll('input[type="checkbox"][name="day"]');
		let price = parseInt(plan[i].querySelector('[name="price"]').value);
		
		let spanPlanPrice = document.querySelector('.plan-price');
		
		dayChk.forEach((item2, j) => {
			
			dayChk[j].addEventListener('change', () => {
				if (dayChk[j].checked)
					pokeTotPrice += price;
				else
					pokeTotPrice -= price;
				spanPlanPrice.innerHTML = `￦${pokeTotPrice.toLocaleString('en-IE')}`;

				getTot();
			})
		})
	})
	
	let etc = document.querySelectorAll('.etc.list-container .item-list li');
	for (let i=0;i<etc.length;i++) {
		let price = parseInt(etc[i].querySelector('[name="price"]').value);
		let quantity = parseInt(etc[i].querySelector('[type="number"]').value);
		etcTotPrice += price * quantity;

		let quantityInp = etc[i].querySelector('.qua input');
		quantityInp.addEventListener('change', () => {
			price = parseInt(etc[i].querySelector('[name="price"]').value);
			quantity = parseInt(etc[i].querySelector('[name="quantity"]').value);
			etcTotPrice += price * quantity;

			let pEtcPrice = document.querySelector('.additional p');
			pEtcPrice.innerHTML = `￦${etcTotPrice.toLocaleString('en-IE')}`;

			getTot();
		})
	}
})

let adjust = (opr, btn, price) => {
		let qua = btn.closest('.qua').querySelector('[name="quantity"]');
		
		if(opr == '+') {
			qua.value++;
			etcTotPrice += price;
		} else if(opr == '-' && qua.value != 1) {
			qua.value--;
			etcTotPrice -= price;
		}
		let pEtcPrice = document.querySelector('.additional p');
		pEtcPrice.innerHTML = `￦${etcTotPrice.toLocaleString('en-IE')}`;

		getTot();
}

let getTot = () => {
	let txtPlanPrice = document.querySelector('.plan-price').innerHTML;
	let txtEtcPrice = document.querySelector('.additional p').innerHTML;
	let txtShip = document.querySelector('.ship p').innerHTML;

	let plan = parseInt(txtPlanPrice.substr(1).replace(',', ''));
	let additional = parseInt(txtEtcPrice.substr(1).replace(',', ''));
	let week = document.querySelector('.selected.select-item').innerHTML.substr(0, 1);
	let ship = parseInt(txtShip.substr(1).replace(',', ''));

	let totPrice = plan * week + additional + ship;
	let spanTot = document.querySelector('.total-price');
	spanTot.innerHTML = `￦${totPrice.toLocaleString('en-IE')}`;
}

let goOrder = () => {
	let plan = document.querySelectorAll('.plan.list-container .item-list li');
	let notSelectedPoke = 0; //요일이 선택되지 않은 메뉴의 존재 여부를 판단. 0: 존재 x/1: 존재 o
	plan.forEach((item, i) => {
		let dayChk = plan[i].querySelectorAll('input[type="checkbox"]:checked');		
		if(dayChk.length == 0)
			notSelectedPoke = 1;
	})
	if(notSelectedPoke == 0){
		let plan = document.querySelectorAll('.plan.list-container .item-list li');
		
		let pokeArr = [];
		let etcArr = [];
		
		for(let i=0;i<plan.length;i++){
			let cartItem = new Object();
			
			let chk = plan[i].querySelectorAll('[name="day"]:checked');
			let day = '';
			
			for(let j=0;j<chk.length;j++)
				day += `${chk[j].value}/`;
		
			day = day.substr(0, day.length - 1);
			
			cartItem.type = 'poke';
			cartItem.name = plan[i].querySelector('[name="name"]').value;
			cartItem.ingre = plan[i].querySelector('[name="ingre"]').value;
			cartItem.price = parseInt(plan[i].querySelector('[name="price"]').value);
			cartItem.day = day;
			
			pokeArr.push(cartItem);
		}
		
		let etc = document.querySelectorAll('.etc.list-container .item-list li');
		for(let i=0;i<etc.length;i++){
			let cartItem = new Object();
			
			cartItem.type = 'etc';
			cartItem.name = etc[i].querySelector('[name="name"]').value;
			cartItem.price = parseInt(etc[i].querySelector('[name="price"]').value);
			cartItem.quantity = parseInt(etc[i].querySelector('[name="quantity"]').value);
			
			etcArr.push(cartItem);
		}
		
		location.href = "orderForm.jsp?param=" + encodeURIComponent(JSON.stringify({pokeArr: pokeArr, etcArr: etcArr})) + "&weekPlan=" + cart.weekPlan.value;
		new Ajax.Request('orderForm.jsp', {
			method: 'post',
			contentType: 'application/json',
			parameters: JSON.stringify({pokeArr: pokeArr, etcArr: etcArr}),
			onComplete: (response) => {
				console.log(response);
				console.log(response.responseText);
			}
		})
	} else {
		showPopup();
	}
}

/* 결제 */
const setting = {
	
}