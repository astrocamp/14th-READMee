import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  
  updatePublish() {
    var result = confirm("確定要發佈嗎");

      if (result) {
        const { account, serial } = this.element.dataset;
        const token = document.querySelector("meta[name=csrf-token]").content;
        const url = `/@${account}/resumes/${serial}`;

        fetch(url, {
          method: 'PATCH',
          headers: {
            'X-CSRF-Token': token,
            'content-type': 'application/json'
          },
          body: JSON.stringify({
            resume: {
              publish: true
            }
          })
        })
        .then(data => {
          window.location.href = `/resumes`;
        })
        .catch(error => {
          console.error('Error:', error);
        });
    }
  }
}