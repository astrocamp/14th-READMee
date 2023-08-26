class Resume < ApplicationRecord
  belongs_to :user

  def self.create_with_basic_info(profile)
    new_resume = self.new
    new_resume.basic_info = "#{profile.full_name}\n#{profile.phone}\n#{profile.address}"
    new_resume.social_links = "#{profile.linkedin}\n#{profile.facebook}\n#{profile.github}\n#{profile.website}"
    new_resume.work_experience = "#{profile.work_experience}"
    new_resume.work_experience_title = "工作經驗"
    new_resume.skills = "#{profile.skills}"
    new_resume.about_me_title = "個人簡介"
    new_resume.about_me = "#{profile.about_me}"
    new_resume.save
    new_resume
  end
end
