import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['chat_view'];
  connect() {
    this.status = 0;
  }
  toggle() {
    if (this.status == 0) {
      this.chat_viewTarget.style.display = 'block';
      this.status++;
      return;
    }
    if (this.status == 1) {
      this.chat_viewTarget.style.display = 'none';
      this.status--;
    }
  }
}
