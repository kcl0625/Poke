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

/*const mysql = require('mysql');
const conn = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'nodetest',
	password: '1234'
})
conn.connect();
conosole.log('연결 성공!');*/