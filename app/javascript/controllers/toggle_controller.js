import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"];
  connect() {
    console.log(543)
  }

  toggle(){
    this.contentTarget.classList.toggle("hidden")
  }
 }