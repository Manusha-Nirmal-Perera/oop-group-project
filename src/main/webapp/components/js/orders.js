document.addEventListener('DOMContentLoaded', function() {

	const reviewCancelModal = document.getElementById('reviewCancel-modal');
	const reviewCloseBtn = document.getElementById('review-close-btn');
	const cancelCloseBtn = document.getElementById('cancel-close-btn');	
	
	const reviewForm = document.getElementById('review-order-form');	
	const cancelForm = document.getElementById('canel-order-form');	
	
	const reviewMessage = reviewForm.querySelector('textarea[name="message"]');
	const cancelMessage = cancelForm.querySelector('textarea[name="message"]');

	const allowedPattern = /^[a-zA-Z0-9\s.,!?'-]+$/;

// Function to validate the message content
	function validateMessage(message) {
	    return allowedPattern.test(message.trim());
	}

// Review Order Form Validation
	    
	reviewForm.addEventListener('submit', function(e) {
	    const reviewText = reviewMessage.value.trim();
	    if (reviewText === '') {
	        e.preventDefault();
	        alert('Please enter your review message.');
	        reviewMessage.focus();
	    } else if (!validateMessage(reviewText)) {
	        e.preventDefault();
	        alert('Your review contains invalid characters. Only letters, numbers, spaces, and basic punctuation are allowed.');
	        reviewMessage.focus();
	    }
	});

	cancelForm.addEventListener('submit', function(e) {
	    const cancelText = cancelMessage.value.trim();
	    if (cancelText === '') {
	        e.preventDefault();
	        alert('Please enter a reason for cancellation.');
	        cancelMessage.focus();
	    } else if (!validateMessage(cancelText)) {
	        e.preventDefault();
	        alert('Your reason contains invalid characters. Only letters, numbers, spaces, and basic punctuation are allowed.');
	        cancelMessage.focus();
	    }
	});
	
	// Hide reviewCancel Modal
	reviewCloseBtn.addEventListener('click', function() {
		reviewCancelModal.classList.add('hidden');
	});
	cancelCloseBtn.addEventListener('click', function() {
		reviewCancelModal.classList.add('hidden');
	});
	
	const formModalPopups = () =>{
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.has('orderId')) {
			if (urlParams.has('action') && urlParams.get('action') === 'review') {
				reviewCancelModal.classList.remove('hidden');
				reviewForm.classList.remove('hidden');
				if(!cancelForm.classList.contains('hidden')){
					cancelForm.classList.add('hidden');
				}      
			}
			
			if (urlParams.has('action') && urlParams.get('action') === 'reject') {
				reviewCancelModal.classList.remove('hidden');
				cancelForm.classList.remove('hidden');
				if(!reviewForm.classList.contains('hidden')){
					reviewForm.classList.add('hidden');
				}        
			}
			
			 
		}
	}
	formModalPopups();
});