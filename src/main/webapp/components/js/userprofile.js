document.addEventListener("DOMContentLoaded", () => {

  const imgUpArea = document.getElementById("profile-pic-up");
  const editBtn = document.getElementById("edit-profile-btn");
  const saveBtn = document.getElementById("save-changes-btn");
  
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

});
