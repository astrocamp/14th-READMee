import { Controller } from "@hotwired/stimulus"
// import { document } from "postcss";

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ['likebtn']
  
  connect(){
    const { id, liked } = this.element.dataset;
    this.id = id;

    if (liked == "true") {
      this.likebtnTarget.textContent = "已讚"
    } else {
      this.likebtnTarget.textContent = "未讚"
    }
  }

  toggle(e){
    e.preventDefault();

    const url = `/api/v1/articles/${this.id}/like`
    const token = document.querySelector("meta[name=csrf-token]").content;
    console.log(token);
    fetch(url, { 
      method: "PATCH", 
      headers: {
        'X-CSRF-Token': token,
      }
    })
      .then((resp) => {
        return resp.json();
      })
      .then(({liked}) => {
        console.log(liked);
        if (liked) {
          this.likebtnTarget.textContent = "已讚"
        } else {
          this.likebtnTarget.textContent = "未讚"
        }
      })
      .catch((err) => {
        console.log(err);
      })
  }
}
