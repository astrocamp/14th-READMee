import { Controller } from "stimulus"

export default class extends Controller {
 
  
  connect() {
    console.log("123456", this.element)
  }
 
}