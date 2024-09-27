document.addEventListener("DOMContentLoaded", () => {
	
	const bgOverlay = document.getElementById('bg-overlay');
	
	const imgUpArea = document.getElementById("profile-pic-up");
	const editBtn = document.getElementById("edit-profile-btn");
  	const saveBtn = document.getElementById("save-changes-btn");
  	
	const changePwBtn = document.getElementById("change-pw-btn");
  	const chngePwModal = document.getElementById('changepw-modal');
  	const chPWModalCloseBtn = document.getElementById('chpwModal-close-btn');
  	const formUpdatepwBtn = document.getElementById('update-pw-btn');
  
  	const wishlistOpenBtn = document.getElementById("wishlist-open-btn");
  	const wishlistModal = document.getElementById('wishlist-popup');
  	const wishlistCloseBtn = document.getElementById('wishlist-close-btn');

	
//	remove the readonly attribute of the input fields and show the image upload area  
	editBtn.addEventListener("click", () => {
		event.preventDefault();
	    let inputs = document.querySelectorAll('.toggle-readonly');
	    inputs.forEach(function(input) {
	      if (input.hasAttribute('readonly')) {
	        input.removeAttribute('readonly');
			imgUpArea.classList.remove("hidden");
			editBtn.classList.add("hidden");
			saveBtn.classList.remove("hidden");
	      } else {
	        input.setAttribute('readonly', true);
			imgUpArea.classList.add("hidden");
			editBtn.classList.remove("hidden");
			saveBtn.classList.add("hidden");
	      }
	    });
  	});

//	add the readonly attribute of the input fields and hide the image upload area  
	saveBtn.addEventListener("click", () => {
		let inputs = document.querySelectorAll('.toggle-readonly');
		inputs.forEach(function(input) {
		
			if (input.hasAttribute('readonly')) {
				input.removeAttribute('readonly');
		  		imgUpArea.classList.remove("hidden");
		  		editBtn.classList.add("hidden");
		  		saveBtn.classList.remove("hidden");
			} else {
		        input.setAttribute('readonly', true);
		  		imgUpArea.classList.add("hidden");
		  		editBtn.classList.remove("hidden");
		  		saveBtn.classList.add("hidden");
		     }
		});
	});
	
// 	Close popup (click on outside)
	window.addEventListener('click', (e) => {
        if (!chngePwModal.contains(e.target) && !changePwBtn.contains(e.target)) {
			chngePwModal.classList.add('hidden');
			if (wishlistModal.classList.contains('hidden')) {
				bgOverlay.classList.add('hidden');
		   	}
		}

		if (!wishlistModal.contains(e.target) && !wishlistOpenBtn.contains(e.target)) {
		    wishlistModal.classList.add('hidden');
		    if (chngePwModal.classList.contains('hidden')) {
		        bgOverlay.classList.add('hidden');
		    }
		}
	});
	
//	show change password modal
	changePwBtn.addEventListener('click', function() {
		event.preventDefault();
		chngePwModal.classList.remove('hidden');
		bgOverlay.classList.remove('hidden');
	});
// 	hide change password modal
	chPWModalCloseBtn.addEventListener('click', function() {
		chngePwModal.classList.add('hidden');
		bgOverlay.classList.add('hidden');
	});
	
// 	method to check whether new passwords are matching
	formUpdatepwBtn.addEventListener("click",function() {
		if(document.getElementById("chpw-password").value != document.getElementById("chpw-cnfrm-pwd").value){
			alert("Pasword mismatch!");
			return false;
		}else{
			return true;
		}
	});
		
// 	show wishlist modal
	wishlistOpenBtn.addEventListener('click', function() {
		wishlistModal.classList.remove('hidden');
		bgOverlay.classList.remove('hidden');
	});
// 	hide wishlist modal
	wishlistCloseBtn.addEventListener('click', function() {
		wishlistModal.classList.add('hidden');
		bgOverlay.classList.add('hidden');
	});

//	modal behaviors according to url
	const userProfileModalPopup = () =>{
		const urlParams = new URLSearchParams(window.location.search);
		if (urlParams.has('wlupdate') && urlParams.get('wlupdate') === 'completed') {
			wishlistModal.classList.toggle('hidden');
			bgOverlay.classList.toggle('hidden');    
		}
	};
	userProfileModalPopup();
});
