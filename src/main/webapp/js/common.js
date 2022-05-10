let printMsg = (msg, indicator) => {
	if(indicator) indicator.innerHTML = msg;
}

let search = (e) => {
	e.preventDefault();
	let searchInput = document.querySelector('.search .input-item');
    if(searchInput.classList.contains('on')){
        if(search.keyword.value) search.keyword.submit();
        else searchInput.classList.remove('on');
    } else searchInput.classList.add('on');
}
document.addEventListener('DOMContentLoaded', () => {
	let select = document.querySelectorAll('.select');
	
	select.forEach((selectWrapper, i) => {
		let selectItem = select[i].querySelectorAll('.select-wrapper .select-item');
		let selected = select[i].querySelector('.selected');
		let hidden = select[i].querySelector('input[type="hidden"]');
		
		select[i].addEventListener('click', (e) => {
			e.stopImmediatePropagation();
			if(!select[i].classList.contains('open')){
				select[i].classList.add('open');
				selectItem.forEach((item, j) => {
					selectItem[j].addEventListener('click', () => {
						let val = selectItem[j].dataset.data;
						selected.innerText = val;
						hidden.value = val;
					})
				})
			} else {
				select[i].classList.remove('open');
			}
		})
		
		document.addEventListener('click', (e) => {
			e.stopImmediatePropagation();
			select[i].classList.remove('open');
			return false;
		})
	})
})

let openSelect = (select) => {
	let selectItem = select.querySelectorAll('.select-wrapper .select-item');
	let selected = select.querySelector('.selected');
	let hidden = select.querySelector('input[type="hidden"]');
	
	if(!select.classList.contains('open')){ //select가 open 상태가 아닐 때	
		selectItem.forEach((item, i) => {
			selectItem[i].addEventListener('click', () => {
				let val = selectItem[i].dataset.data;
				selected.innerText = val;
				hidden.value = val;
				select.classList.remove('open');
			})
		})
		return false;
	} else { //open 상태일 때
		document.addEventListener('click', (e) => {
			select.classList.remove('open');
			return false;
		})
		
	}
}

let openSearch = (e) => {
	e.preventDefault();
	let searchBox = document.querySelector('.search');
	let input = searchBox.querySelector('input[name="keyword"]');
	
	if(!searchBox.classList.contains('open')){
		searchBox.classList.add('open');
	} else {
		if(input.value){
			search.submit();
		} else {
			searchBox.classList.remove('open');
		}
	}
} 

let addMenu = (no, type, name, ingre, price, custom) => {
	new Ajax.Request(`../member/addCart.jsp?no=${no}&type=${type}&name=${name}&ingre=${ingre}&price=${price}&custom=${custom}`, {
		method: 'post',
		parameter: {
			no: no,
			type: type,
			name: name,
			ingre: ingre,
			price: price,
			custom: custom
		},
		onComplete: (response) => {
			let popup = document.querySelector('#popup');
			popup.innerHTML = response.responseText;
			popup.classList.add('cart');
			popup.classList.add('show');
			document.body.classList.add('open');
		}
	})
}

let addCart = (no, type, name, quantity, price) => {
	new Ajax.Request(`../member/addCart.jsp?no=${no}&type=${type}&name=${name}&quantity=${quantity}&price=${price}`, {
		method: 'get',
		parameter: {
			no: no,
			type: type,
			name: name,
			quantity: quantity,
			price: price
		},
		onComplete: (response) => {
			let popup = document.querySelector('#popup');
			popup.innerHTML = response.responseText;
			popup.classList.remove('desc');
			popup.classList.add('cart');
			popup.classList.add('show');
			document.body.classList.add('open');
		}
	})
}

let showPopup = () => {
	let popup = document.querySelector('#popup');
	popup.classList.add('show');
	document.body.classList.add('open');
}

let close = () => {
	let popup = document.querySelector('#popup');
	popup.classList.remove('show');
	document.body.classList.remove('open');
}