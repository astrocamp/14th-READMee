import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["aboutMeForm","workExperienceForm"];
  
  connect() {
    this.aboutMeFormTarget.addEventListener("input", this.inputAboutMeTextareaHeight.bind(this));
    this.workExperienceFormTarget.addEventListener("input", this.inputWorkExperienceTextareaHeight.bind(this));
  }
  
  inputAboutMeTextareaHeight(e){
    this.aboutMeFormTarget.style.height = e.target.scrollHeight + 'px';
  }

  inputWorkExperienceTextareaHeight(e){
    this.workExperienceFormTarget.style.height = e.target.scrollHeight + 'px';
  }
}