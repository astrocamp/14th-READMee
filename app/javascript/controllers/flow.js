const part1 = document.getElementById("part1");
const part2 = document.getElementById("part2");
const part3 = document.getElementById("part3");
const backButtons = document.getElementsByClassName("back-button");
const nextButtons = document.getElementsByClassName("next-button");

Array.from(nextButtons).forEach(button => {
  button.addEventListener("click", function() {
    console.log('click!');
    part1.style.display = "none";
    part2.style.display = "block";
  });
});

Array.from(backButtons).forEach(button => {
  button.addEventListener("click", function() {
    console.log('back');
    part2.style.display = "none";
    part1.style.display = "block";
  });
});
