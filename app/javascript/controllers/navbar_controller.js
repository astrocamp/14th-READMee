import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tinylink"]
  
  toggle(e) {
    e.preventDefault();
    this.tinylinkTarget.classList.toggle("show");
  } 
}