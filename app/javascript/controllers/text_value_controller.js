import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="text-value"
export default class extends Controller {
  static targets = ['input'];
  clean() {
    setTimeout(() => {
      this.inputTarget.value = '';
    }, 1000);
  }
}
