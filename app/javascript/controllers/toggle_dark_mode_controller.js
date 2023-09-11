import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['html', 'dark_mode_img'];

  toggleDarkMode() {
    const htmlTag = this.htmlTarget;
    const img = this.dark_mode_imgTarget;
    console.log(img);
    if (htmlTag.classList.contains('dark')) {
      this.dark_mode_imgTarget.src = '/assets/night-mode.png';
      htmlTag.classList.remove('dark');
    } else {
      this.dark_mode_imgTarget.src = '/assets/light-mode.png';
      htmlTag.classList.add('dark');
    }
  }
}
