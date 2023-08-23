import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["switchRole"];

  switch(event) {
    event.preventDefault();
    console.log("OK");
    const currentUserRole = this.data.get("role");
    if (currentUserRole === "employer") {
      currentUserRole = "job_seeker"
      return
    }
    if( currentUserRole === "job_seeker"){
      currentUserRole = "employer"
    }
  }
}
