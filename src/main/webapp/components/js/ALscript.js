document.addEventListener('DOMContentLoaded', function() {

	const cartButton = document.getElementById('cartButton');
    const cartPopup = document.getElementById('cartPopup');
    const backgroundOverlay = document.getElementById('backgroundOverlay');

// poping up and closing cart modal on click on the cart button
    cartButton.addEventListener('click', () => {
        cartPopup.classList.toggle('hidden');
        backgroundOverlay.classList.toggle('hidden');
    });

// Close cart popup (click on outside)
    window.addEventListener('click', (e) => {
        if (!cartPopup.contains(e.target) && !cartButton.contains(e.target)) {
            cartPopup.classList.add('hidden');
            backgroundOverlay.classList.add('hidden');
        }
    });
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