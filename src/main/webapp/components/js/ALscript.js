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

	
	// adding the navigation effect
	function addNavEffect(targetEl){
		targetEl.classList.add("font-bold");
		targetEl.classList.add("text-red-500");
		targetEl.classList.add("hover:text-red-600");
	}
	if (window.location.pathname.endsWith('home.jsp')) {
	    const targetEl = document.getElementById('home-nav');
		addNavEffect(targetEl);
	} else if (window.location.pathname.endsWith('about.jsp')) {
	    const targetEl = document.getElementById('about-nav');
	    addNavEffect(targetEl);
	} else if (window.location.pathname.endsWith('contact.jsp')) {
	    const targetEl = document.getElementById('contact-nav');
	    addNavEffect(targetEl);
	} else if (window.location.pathname.endsWith('shop.jsp')) {
	    const targetEl = document.getElementById('shop-nav');
	    addNavEffect(targetEl);
	} else if (window.location.pathname.endsWith('orders.jsp')) {
	    const targetEl = document.getElementById('orders-nav');
	    addNavEffect(targetEl);
	} else if (window.location.pathname.endsWith('myprofile.jsp')) {
	    const targetEl = document.getElementById('myprofile-nav');
	    addNavEffect(targetEl);
	} else{}
});