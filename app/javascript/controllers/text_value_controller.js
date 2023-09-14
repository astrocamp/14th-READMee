import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['input'];
  clean() {
    setTimeout(() => {
      this.inputTarget.value = '';
    }, 1000);
  }
}
