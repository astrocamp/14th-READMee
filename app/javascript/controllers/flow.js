const stepContainers = document.querySelectorAll(".step-container");
const nextButtons = document.querySelectorAll(".next-button");
const backButtons = document.querySelectorAll(".back-button");
const inputFields = document.querySelectorAll(".input");
const nestedFormWrapper = document.querySelector("#skillScope");
const addSkillBtn = document.querySelector("#addSkill");
let currentStepIndex = 0;

nextButtons.forEach((button) => {
  button.addEventListener("click", function() {
    stepContainers[currentStepIndex].style.display = "none";
    currentStepIndex = Math.min(currentStepIndex + 1, stepContainers.length - 1);
    stepContainers[currentStepIndex].style.display = "block";
    inputFields[4].focus
    console.log(inputFields[4]);
  });
});

backButtons.forEach((button, index) => {
  button.addEventListener("click", function() {
    stepContainers[currentStepIndex].style.display = "none";
    currentStepIndex = Math.max(currentStepIndex - 1, 0);
    stepContainers[currentStepIndex].style.display = "block";
  });
});

inputFields.forEach((input, index) => {
  input.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
      event.preventDefault();
      
      if (index < inputFields.length - 1) {
        inputFields[index + 1].focus();
      }
      
      if (input.id === 'profile_address') {
        nextButtons[0].click();
      }
      
      if (input.id === 'profile_about_me') {
        nextButtons[1].click();
      }
    }
  });
});

nestedFormWrapper.addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
    addSkillBtn.click();
    setTimeout(function() {
      const newSkill = document.querySelectorAll(".skillInput");
      if (newSkill) {
        newSkill[newSkill.length - 1].focus();
      }
    }, 10);
  }
});
