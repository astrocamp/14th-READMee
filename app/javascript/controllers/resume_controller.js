import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["aboutMeForm", "workExperienceForm", "basicInfo", "basicInfoForm", "aboutMe", "workExperienceTitle", "workExperienceTitleInput", "workExperience", "projectTitle", "projectTitleInput", "project", "projectForm", "educationTitle", "educationTitleInput", "education", "educationForm"];
  
  connect() {
    this.aboutMeTarget.addEventListener("click", this.clickAboutMeTextareaHeight.bind(this));
    this.aboutMeFormTarget.addEventListener("input", this.inputAboutMeTextareaHeight.bind(this));
    this.workExperienceTarget.addEventListener("click", this.clickWorkExperienceTextareaHeight.bind(this));
    this.workExperienceFormTarget.addEventListener("input", this.inputWorkExperienceTextareaHeight.bind(this));
  }
  
  clickAboutMeTextareaHeight(){
    this.aboutMeTarget.style.display = "none";
    this.aboutMeFormTarget.style.display = "block";
    this.aboutMeFormTarget.focus();
    this.aboutMeFormTarget.style.height = this.aboutMeFormTarget.scrollHeight + 'px';
  }
  
  inputAboutMeTextareaHeight(e){
    this.aboutMeFormTarget.style.height = e.target.scrollHeight + 'px';
  }

  showBasicInfoForm(){
    this.basicInfoTarget.style.display = "none";
    this.basicInfoFormTarget.style.display = "block";
    this.basicInfoFormTarget.focus();
  }

  showAboutMeForm(){
    this.aboutMeTarget.style.display = "none";
    this.aboutMeFormTarget.style.display = "block";
    this.aboutMeFormTarget.focus();
  }

  showWorkExperienceTitleInput(){
    this.workExperienceTitleTarget.style.display = "none";
    this.workExperienceTitleInputTarget.style.display = "block";
    this.workExperienceTitleInputTarget.focus();
  }

  showProjectTitleInput(){
    this.projectTitleTarget.style.display = "none";
    this.projectTitleInputTarget.style.display = "block";
    this.projectTitleInputTarget.focus();
  }

  showProjectForm(){
    this.projectTarget.style.display = "none";
    this.projectFormTarget.style.display = "block";
    this.projectFormTarget.focus();
  }

  showEducationTitleInput(){
    this.educationTitleTarget.style.display = "none";
    this.educationTitleInputTarget.style.display = "block";
    this.educationTitleInputTarget.focus();
  }

  showEducationForm(){
    this.educationTarget.style.display = "none";
    this.educationFormTarget.style.display = "block";
    this.educationFormTarget.focus();
  }
  
  clickWorkExperienceTextareaHeight(){
    this.workExperienceTarget.style.display = "none";
    this.workExperienceFormTarget.style.display = "block";
    this.workExperienceFormTarget.focus();
    this.workExperienceFormTarget.style.height = this.workExperienceFormTarget.scrollHeight + 'px';
  }

  inputWorkExperienceTextareaHeight(e){
    this.workExperienceFormTarget.style.height = e.target.scrollHeight + 'px';
  }
}