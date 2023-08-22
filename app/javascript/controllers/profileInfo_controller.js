import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["updateContent", "fullName", "jobTitle", "email", "phone", "address", "education", "linkedin", "facebook", "github", "website", "aboutMe", "skills", "workExperience", "languages"];

  saveProfileToResume(event) {
    event.preventDefault();
    const { account, serial } = this.updateContentTarget.dataset;
    const token = document.querySelector("meta[name=csrf-token]").content;
    const url = `/@${account}/resumes/${serial}`;
     
    const basicInfo = `${this.fullNameTarget.textContent}\n${this.emailTarget.textContent}\n${this.phoneTarget.textContent}\n${this.addressTarget.textContent}\n學歷: ${this.educationTarget.textContent}\n${this.jobTitleTarget.textContent}`;
    const socialLinks = `linkedin: ${this.linkedinTarget.textContent}\nfacebook: ${this.facebookTarget.textContent}\ngithub: ${this.githubTarget.textContent}\nwebsite: ${this.websiteTarget.textContent}`;
    const aboutMe = this.aboutMeTarget.textContent.trim();
    const skills_arr = this.skillsTarget.textContent.replace(/ /g, "").trim().split('\n'); 
    const skills_content = JSON.stringify(skills_arr);
    const workExperience = this.workExperienceTarget.textContent.trim();
    const languages_arr = this.languagesTarget.textContent.replace(/ /g, "").trim().split('\n'); 
    const languages_content = JSON.stringify(languages_arr);

    fetch(url, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': token,
        'content-type': 'application/json'
      },
      body: JSON.stringify({
        resume: { 
          basic_info: basicInfo,
          social_links: socialLinks,
          about_me: aboutMe,
          about_me_title: `個人簡介`,
          skills: skills_content,
          work_experience: workExperience,
          work_experience_title: `工作經驗`,
          language: languages_content
        }
      })
    })
    .then(response => response.json())
    .then(data => {
      window.location.href = `http://127.0.0.1:3000/@${account}/resumes/${serial}/edit`;
    })
    .catch(error => {
      console.error('Error:', error);
    });
  }
}