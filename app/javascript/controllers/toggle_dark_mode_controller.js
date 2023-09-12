import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['html'];
  darkModeEnabled = false;

  connect() {
    const savedDarkMode = localStorage.getItem('darkModeEnabled');
    if (savedDarkMode) {
      this.darkModeEnabled = savedDarkMode === 'true';
      this.applyDarkMode();
    }
  }

  toggleDarkMode() {
    this.darkModeEnabled = !this.darkModeEnabled;
    this.applyDarkMode();
    localStorage.setItem('darkModeEnabled', this.darkModeEnabled);
  }

  applyDarkMode() {
    console.log('set dark');
    const htmlTag = this.htmlTarget;
    if (this.darkModeEnabled) {
      htmlTag.classList.remove('dark');
      htmlTag.classList.add('light');
    } else {
      htmlTag.classList.add('dark');
      htmlTag.classList.remove('light');
    }
  }
}
