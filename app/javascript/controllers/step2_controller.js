import { Controller } from "@hotwired/stimulus";

export default class extends Controller {  
  connect() {
    const nextBtns = document.querySelectorAll(".next-button");
    const backBtns = document.querySelectorAll(".back-button");
    const part1 = document.querySelector(".part1");
    const part2 = document.querySelector(".part2");
    const part3 = document.querySelector(".part3");
    let currentPage = 1;

    nextBtns.forEach(nextBtn => {
      nextBtn.addEventListener("click", (event) => {
        event.preventDefault();
        if (currentPage === 1) {
          part1.style.display = "none";
          part2.style.display = "block";
          currentPage++;
          return;
        }
        if (currentPage === 2) {
          part2.style.display = "none";
          part3.style.display = "block";
          currentPage++;
          return;
        }
      }); 
    });

    backBtns.forEach(backBtn => {
      backBtn.addEventListener("click", (event) => {
        event.preventDefault();
        if (currentPage === 2) {
          part2.style.display = "none";
          part1.style.display = "block";
          currentPage--;
          return;
        }
        if (currentPage === 3) {
          part3.style.display = "none";
          part2.style.display = "block";
          currentPage--;
          return;
        }
      });
    });

    document.addEventListener("keydown", (event) => {
      const activeElement = document.activeElement;
      if (event.key === "Enter" && activeElement.matches("input[type='text'], input[type='input']")) {
        event.preventDefault();
      }
    });
  }
}
