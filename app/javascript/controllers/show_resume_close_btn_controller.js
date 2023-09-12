import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="show-resume-close-btn"
export default class extends Controller {
  static = ['closeBtn'];
  connect() {
    console.log(this.closeBtnTagert);
  }
  close() {
    console.log('click');
  }
}
