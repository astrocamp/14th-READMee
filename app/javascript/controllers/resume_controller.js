import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["basicInfo", "socialLinks", "basicInfoContent", "socialLinksContent", "aboutMeContent", "workExperienceContent", "updateContent", "aboutMeTitle", "aboutMeTitleForm", "workExperienceTitle", "workExperienceTitleForm", "basicInfoForm", "socialLinksForm", "aboutMeForm", "skillsForm", "workExperienceForm"];
  
  connect() {
    this.basicInfoTarget.addEventListener("click", this.showBasicInfoForm.bind(this));
    this.socialLinksTarget.addEventListener("click", this.showSocialLinksForm.bind(this));
    this.aboutMeContentTarget.addEventListener("click", this.showAboutMeContentForm.bind(this));
    this.workExperienceContentTarget.addEventListener("click", this.showWorkExperienceContentForm.bind(this));
    this.aboutMeTitleTarget.addEventListener("click", this.showAboutMeTitleForm.bind(this));
    this.workExperienceTitleTarget.addEventListener("click", this.showWorkExperienceTitleForm.bind(this));
  }

  showBasicInfoForm(event) {
    event.preventDefault();
    this.basicInfoContentTarget.style.display = 'none';
    this.basicInfoFormTarget.style.display = 'block';
  }

  showSocialLinksForm(event) {
    event.preventDefault();
    this.socialLinksContentTarget.style.display = 'none';
    this.socialLinksFormTarget.style.display = 'block';
  }
  
  showAboutMeContentForm(event) {
    event.preventDefault();
    this.aboutMeContentTarget.style.display = 'none';
    this.aboutMeFormTarget.style.display = 'block';
  }
  
  showWorkExperienceContentForm(event) {
    event.preventDefault();
    this.workExperienceContentTarget.style.display = 'none';
    this.workExperienceFormTarget.style.display = 'block';
  }  
  
  showAboutMeTitleForm(event) {
    event.preventDefault();
    this.aboutMeTitleTarget.style.display = 'none';
    this.aboutMeTitleFormTarget.style.display = 'block';
  }
  
  showWorkExperienceTitleForm(event) {
    event.preventDefault();
    this.workExperienceTitleTarget.style.display = 'none';
    this.workExperienceTitleFormTarget.style.display = 'block';
  }

  saveContent(event){
    event.preventDefault();
    const { account, serial } = this.updateContentTarget.dataset;
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
          basic_info: this.basicInfoFormTarget.value,
          social_links: this.socialLinksFormTarget.value,
          about_me: this.aboutMeFormTarget.value,
          work_experience: this.workExperienceFormTarget.value,
          about_me_title: this.aboutMeTitleFormTarget.value,
          work_experience_title: this.workExperienceTitleFormTarget.value,
        }
      })
    })
    .then(response => response.json())
    .then(data => {      
      this.basicInfoContentTarget.innerText = data.message.basic_info;
      this.basicInfoContentTarget.style.display = 'block';
      this.basicInfoFormTarget.style.display = 'none';

      this.socialLinksContentTarget.innerText = data.message.social_links;
      this.socialLinksContentTarget.style.display = 'block';
      this.socialLinksFormTarget.style.display = 'none';

      this.aboutMeContentTarget.innerText = data.message.about_me;
      this.aboutMeContentTarget.style.display = 'block';
      this.aboutMeFormTarget.style.display = 'none';

      this.workExperienceContentTarget.innerText = data.message.work_experience;
      this.workExperienceContentTarget.style.display = 'block';
      this.workExperienceFormTarget.style.display = 'none';

      this.aboutMeTitleTarget.innerText = data.message.about_me_title;
      this.aboutMeTitleTarget.style.display = 'block';
      this.aboutMeTitleFormTarget.style.display = 'none';

      this.workExperienceTitleTarget.innerText = data.message.work_experience_title;
      this.workExperienceTitleTarget.style.display = 'block';
      this.workExperienceTitleFormTarget.style.display = 'none';
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}