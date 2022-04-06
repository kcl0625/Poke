document.addEventListener('DOMContentLoaded', () => {
	let day = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
	let dayChk = document.querySelectorAll('input[type="checkbox"][name="day"]');
	
	let chkDay = [];
	
	console.log(dayChk);
	dayChk.forEach((item, i) => {
		dayChk[i].addEventListener('click', () => {
			let poke = dayChk[i].closest('li');
			let hidden = poke.querySelectorAll('input[type="hidden"]');
			let price = hidden[1].value;
			let dayName = dayChk[i].getAttribute('class');
			
			console.log(dayName);
		})
	})
	for (let i=0;i<6;i++){
		
	}
})