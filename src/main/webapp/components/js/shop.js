document.addEventListener('DOMContentLoaded', function() {
	const cartPopup = document.getElementById('cartPopup');
	const backgroundOverlay = document.getElementById('backgroundOverlay');

// modal  behavior according to url
	const cartModalPopup = () =>{
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.has('quantity') && urlParams.get('quantity') === 'updated') {
			cartPopup.classList.toggle('hidden');
			backgroundOverlay.classList.toggle('hidden');    
		}
	};
	cartModalPopup();
	
});