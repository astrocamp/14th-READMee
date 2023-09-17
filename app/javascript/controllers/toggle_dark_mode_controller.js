import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['html'];
  darkModeEnabled = false;

  connect() {
    const savedDarkMode = localStorage.getItem('darkMode');
    if (savedDarkMode === 'true') {
      this.darkModeEnabled = true;
      this.applyDarkMode();
    }
  }

  toggleDarkMode() {
    this.darkModeEnabled = !this.darkModeEnabled;
    this.applyDarkMode();
    localStorage.setItem('darkMode', this.darkModeEnabled);
  }

  applyDarkMode() {
    const htmlTag = this.htmlTarget;
    if (this.darkModeEnabled) {
      htmlTag.classList.add('dark');
    } else {
      htmlTag.classList.remove('dark');
    }
  }
}
