import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = []
  
  saveComponent(event){
    const area1 = event.currentTarget.dataset.area1;
    const area2 = event.currentTarget.dataset.area2;
    const area3 = event.currentTarget.dataset.area3;
    const area4 = event.currentTarget.dataset.area4;
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
          area_1: area1,
          area_2: area2,
          area_3: area3,
          area_4: area4,
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