document.addEventListener('DOMContentLoaded', () => {
	poke.filename.addEventListener('change', (e) => {
		let img = document.querySelector('.poke-img img');
		let reader = new FileReader();
		reader.onload = (e) => {
			img.src = e.target.result;
		}
		reader.readAsDataURL(poke.filename.files[0]);
	})
})