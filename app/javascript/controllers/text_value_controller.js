import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="text-value"
export default class extends Controller {
  static targets = ['input'];

  connect() {
    console.log('in');
  }
  clean() {
    this.inputTarget.value = '';
  }
}
