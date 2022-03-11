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
let openSelect = (select) => {
	if(!select.classList.contains('open')){
		select.classList.add('open');
		let selectItem = select.querySelectorAll('.select-wrapper .select-item');
		let selected = select.querySelector('.selected span');
		
		selectItem.forEach((item, i) => {
			selectItem[i].addEventListener('click', () => {
				let val = selectItem[i].dataset.data;
				selected.innerText = val;
				select.classList.remove('open');
			})
		})
		
		
	} else {
		document.addEventListener('click', (e) => {
			if (e.target != select) {
				console.log('바깥');
			}
		})
	}
}
/*const mysql = require('mysql');
const conn = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'nodetest',
	password: '1234'
})
conn.connect();
conosole.log('연결 성공!');*/