class Resume < ApplicationRecord
  belongs_to :user
  
  def self.create_content(profile, resume, email)
    resume.basic_info = "#{profile.full_name}\n#{profile.address}"
    resume.skills = profile.skills.pluck(:tag)
    resume.about_me_title = "個人簡介"
    resume.about_me = "#{profile.about_me}\nlinkedin: #{profile.linkedin}\nfacebook: #{profile.facebook}\ngithub: #{profile.github}\n電話: #{profile.phone}\nemail: #{email}"
    resume.work_experience_title = "工作經驗"
    resume.work_experience = profile.work_experience
    resume.languages = "#{profile.languages}"
    resume.project_title = "專案"
    resume.project = "#{profile.projects}"
    resume.education_title = "學歷"
    resume.education = "#{profile.education}"
    resume.publish = false
    resume.save
  end
end
