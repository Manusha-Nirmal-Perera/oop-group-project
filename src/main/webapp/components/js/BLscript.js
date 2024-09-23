document.addEventListener('DOMContentLoaded', function() {
	const loginBtn = document.getElementById('login-btn');
	const signupBtn = document.getElementById('signup-btn');
	const loginModal = document.getElementById('login-modal');
	const signupModal = document.getElementById('signup-modal');
	const loginCloseBtn = document.getElementById('login-close-btn');
	const signupCloseBtn = document.getElementById('signup-close-btn');
	const regButton = document.getElementById('reg-btn');
	const tncCheckbox = document.getElementById('tnc');
	

	// Show Login Modal
	loginBtn.addEventListener('click', function() {
		loginModal.classList.remove('hidden');
	});
	
	// Show Signup Modal
	signupBtn.addEventListener('click', function() {
		signupModal.classList.remove('hidden');
	});

	// Hide Login Modal
	loginCloseBtn.addEventListener('click', function() {
		loginModal.classList.add('hidden');
	});

	// Hide Signup Modal
	signupCloseBtn.addEventListener('click', function() {
		signupModal.classList.add('hidden');
	});

	// Close modal when clicking outside of it
	document.addEventListener('click', function(event) {
		if (event.target === loginModal) {
		    loginModal.classList.add('hidden');
		}
		if (event.target === signupModal) {
	    	signupModal.classList.add('hidden');
		}
	});

// modal  behavior according to url
	const formModalPopups = () =>{
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.has('register') && urlParams.get('register') === 'success') {
			loginModal.classList.remove('hidden');
		       
		}
	
		if (urlParams.has('register') && urlParams.get('register') === 'failed') {
			signupModal.classList.remove('hidden');
			       
		}
		if (urlParams.has('category')) {
			addNavEffect(document.getElementById('shop-nav'));	   
		}
	}
	formModalPopups();


	// confirming that the user has entered the same password for both inputs
	regButton.addEventListener("click",function() {
			if(document.getElementById("signup-password").value != document.getElementById("signup-cnfrm-pwd").value){
				alert("Pasword mismatch!");
				return false;
			}else{
				return true;
			}
		})

	// disabling the register button until user accepts terms and conditions

	regButton.disabled = true;

	tncCheckbox.addEventListener('change', function() {
	    if (this.checked) {
	        regButton.disabled = false;
	    } else {
	        regButton.disabled = true;
	    }
	});


	if(tncCheckbox.checked){
		regButton.disabled=false;
	}
	
	else{
		regButton.disabled=true;
	}
	
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
	} else{}

});



