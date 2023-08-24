import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["please"];
  connect() {
    console.log(5)    
  }

  setting(e){
   this.pleaseTarget.showModal();
  }

  close(e){
    this.pleaseTarget.close();
    console.log(this.pleaseTarget);
  }  
}

