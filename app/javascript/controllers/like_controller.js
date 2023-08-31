import { Controller } from "@hotwired/stimulus"
// import { document } from "postcss";

// Connects to data-controller="like"
export default class extends Controller {  
  connect(){
    const { id } = this.element.dataset;
    this.id = id;
  }

  toggle(e){
    e.preventDefault();

    const url = `/api/v1/articles/${this.id}/like`
    const token = document.querySelector("meta[name=csrf-token]").content;
    console.log(token);
    fetch(url, { 
      method: "PATCH", 
      headers: {
        'X-CSRF_Token': token,
      }
    })
      .then((resp) => {
        return resp.json();
      })
      .then(({liked}) => {
        console.log(liked);
      })
      .catch((err) => {
        console.log(err);
      })
  }
}
