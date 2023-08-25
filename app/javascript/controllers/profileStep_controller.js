import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['part1', 'part2', 'part3'];

  connect() {
    this.currentPage = 1;

    document.addEventListener('keydown', (event) => {
      const activeElement = document.activeElement;
      if (
        event.key === 'Enter' &&
        activeElement.matches("input[type='text'], input[type='input']")
      ) {
        event.preventDefault();
      }
    });
  }
  nextBtn(event) {
    event.preventDefault();
    if (this.currentPage === 1) {
      this.part1Target.style.display = 'none';
      this.part2Target.style.display = 'block';
      this.currentPage++;
      return;
    }
    if (this.currentPage === 2) {
      this.part2Target.style.display = 'none';
      this.part3Target.style.display = 'block';
      this.currentPage++;
      return;
    }
  }
  backBtn(event) {
    event.preventDefault();
    if (this.currentPage === 2) {
      this.part2Target.style.display = 'none';
      this.part1Target.style.display = 'block';
      this.currentPage--;
      return;
    }
    if (this.currentPage === 3) {
      this.part3Target.style.display = 'none';
      this.part2Target.style.display = 'block';
      this.currentPage--;
      return;
    }
  }
}
