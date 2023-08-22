import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["main", "part1", "part2", "part3"];
  
  connect() {
  
    this.mainTarget.innerHTML = this.part1Target.innerHTML;
    this.inputs = this.element.querySelectorAll('input');
    this.inputs[1].focus();

    this.inputs.forEach(input => {
      input.addEventListener("keydown", event => {
        if (event.key === "Enter") {
          event.preventDefault();
        }
      });
    });
  }

  nextPage2(event) {
    this.mainTarget.innerHTML = this.part2Target.innerHTML;
  }
  

  nextPage3(event) {
    this.mainTarget.innerHTML = this.part3Target.innerHTML;
  }

  backPage1(event) {
    if (document.activeElement.tagName === "INPUT") {
      event.preventDefault();
    }else{
    this.mainTarget.innerHTML = this.part1Target.innerHTML;
    }
  }

  backPage2(event) {
    if (document.activeElement.tagName === "INPUT") {
      event.preventDefault();
    }else{
    this.mainTarget.innerHTML = this.part2Target.innerHTML;
    }
  }
}
