import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(this.element)
    console.log(this.element.dataset.publish)
  }
  
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
              publish: result
            }
          })
        })
        .then(data => {
          window.location.href = `/@${account}/resumes/${serial}/edit`;
        })
        .catch(error => {
          console.error('Error:', error);
        });
    }
  }
}