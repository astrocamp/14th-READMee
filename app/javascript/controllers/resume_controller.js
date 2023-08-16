import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["basicInfo", "content", "updateContent"];
  
  connect() {
    this.basicInfoTarget.addEventListener("click", this.showForm.bind(this));
  }

  showForm(event) {
    event.preventDefault();
    const contentElement = this.basicInfoTarget;
    let stateFocus = false; // 初始狀態沒有焦點在 textarea

    if (!stateFocus) {
      contentElement.innerHTML = `
        <textarea class="w-full resize-y h-20 p-2 border rounded-md" data-resume-target="content">${contentElement.textContent.trim()}</textarea>
      `;

      const textarea = contentElement.querySelector("textarea[data-resume-target='content']");
      textarea.focus();
      stateFocus = true;
    }
  }

  saveContent(event) {
    event.preventDefault();
    const { account, serial } = this.updateContentTarget.dataset;
    const newContent = this.contentTarget.value;
    const token = document.querySelector("meta[name=csrf-token]").content;
    const url = `/@${account}/resumes/${serial}`;

    fetch(url, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': token,
        'content-type': 'application/json'
      },
      body: JSON.stringify({
        resume: { basic_info: newContent }
      })
    })
    .then(response => response.json())
    .then(data => {
      console.log(data.message);
      const contentElement = this.basicInfoTarget;
      contentElement.innerHTML = `<p class="text-2xl">${data.message}</p>`
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}