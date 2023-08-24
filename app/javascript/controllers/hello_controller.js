import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["please"];
  connect() {
    console.log(9876)    
  }

  setting(e){
   this.pleaseTarget.showModal();
  }

  close(e){
    this.pleaseTarget.close();
    console.log(this.pleaseTarget);
  }  
}




