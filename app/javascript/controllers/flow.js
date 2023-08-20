const part1 = document.getElementById("part1");
const part2 = document.getElementById("part2");
const part3 = document.getElementById("part3");
const nextButtons = document.querySelectorAll(".next-button");
const backButtons = document.querySelectorAll(".back-button");
const inputFields = document.querySelectorAll(".input");
const nestedFormWrapper = document.querySelector("#skilScop");
const addSkillBtn = document.querySelector("#addSkill")


Array.from(nextButtons).forEach(button => {
  button.addEventListener("click", function() {
    if (part1.style.display !== "none") {
      part1.style.display = "none";
      part2.style.display = "block";
    } else if (part2.style.display !== "none") {
      part2.style.display = "none";
      part3.style.display = "block";
    }
  });
});

Array.from(backButtons).forEach(button => {
  button.addEventListener("click", function() {
    if (part3.style.display !== "none") {
      part3.style.display = "none";
      part2.style.display = "block";
    } else if (part2.style.display !== "none") {
      part2.style.display = "none";
      part1.style.display = "block";
    }
  });
});

inputFields.forEach((input, index) => {
  input.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        console.log(input);
      
      event.preventDefault();
      if (index < inputFields.length - 1) {
        inputFields[index + 1].focus();
      }
      if (input.id ==='profile_address') {
        nextButtons[0].click();
        inputFields[index + 1].focus();
      }
      if (input.id === 'profile_about_me'){
        nextButtons[1].click();
      }
    }
  });
});

// 阻止按下 Enter 後誤刪的行為，並且新增 skill 表單、Fucos 在 input 上
nestedFormWrapper.addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
    addSkillBtn.click()
    setTimeout(function() {
      const newSkill = document.querySelectorAll(".skillInput");
      if (newSkill) {
        newSkill[newSkill.length-1].focus();
      }
    }, 10);
  }
});
