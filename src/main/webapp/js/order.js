let etcTotPrice = 0;
document.addEventListener('DOMContentLoaded', () => {
	let plan = document.querySelectorAll('.plan.list-container .item-list li');
	let pokeTotPrice = 0;

	plan.forEach((item, i) => {
		let dayChk = plan[i].querySelectorAll('input[type="checkbox"][name="day"]');
		let hidden = plan[i].querySelectorAll('input[type="hidden"]');
		let price = parseInt(hidden[1].value);
		
		let spanPlanPrice = document.querySelector('.plan-price');
		
		dayChk.forEach((item2, j) => {
			
			dayChk[j].addEventListener('change', () => {
				let chk = plan[i].querySelectorAll('input[type="checkbox"][name="day"]:checked');
				
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
		let price = parseInt(etc[i].querySelector('input[type="hidden"]').value);
		let quantity = parseInt(etc[i].querySelector('input[type="number"]').value);
		etcTotPrice += price * quantity;

		let quantityInp = etc[i].querySelector('.qua input');
		quantityInp.addEventListener('change', () => {
			price = parseInt(etc[i].querySelector('input[type="hidden"]').value);
			quantity = parseInt(etc[i].querySelector('input[type="number"]').value);
			etcTotPrice += price * quantity;

			let pEtcPrice = document.querySelector('.additional p');
			pEtcPrice.innerHTML = `￦${etcTotPrice.toLocaleString('en-IE')}`;

			getTot();
		})
	}
})

let adjust = (opr, btn, price) => {
		let qua = btn.closest('.qua').querySelector('input[name="quantity"]');
			
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