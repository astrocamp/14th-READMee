class ResumesController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update, :second]

  
  def edit
    if @resume.basic_info.present?
      @formatted_basic_info = sanitize(@resume.basic_info).gsub("\n", '<br>').html_safe
    else
      @formatted_basic_info = ""
    end
  
    if @resume.social_links.present?
      @formatted_social_links = sanitize(@resume.social_links).gsub("\n", '<br>').html_safe
    else
      @formatted_social_links = ""
    end
  
    if @resume.work_experience.present?
      @formatted_work_experience = sanitize(@resume.work_experience).gsub("\n", '<br>').html_safe
    else
      @formatted_work_experience = ""
    end

    
    if JSON.parse(@resume.skills) == [""]
      ["請寫入內容"]
    else
      @skills = JSON.parse(@resume.skills)
    end

    if JSON.parse(@resume.languages) == [""]
      ["請寫入內容"]
    else
     @languages = JSON.parse(@resume.languages)    
    end

  
  end

  def update
    if @resume.update(resume_params)
      respond_to do |format|
        format.json { 
          render json: { 
            message: {
              basic_info: @resume.basic_info,
              social_links: @resume.social_links,
              about_me: @resume.about_me,
              skills: @resume.skills,
              work_experience: @resume.work_experience,
              about_me_title: @resume.about_me_title,
              work_experience_title: @resume.work_experience_title,
              languages: @resume.languages
            }
          }
        }
      end
    else
      render :edit
    end
  end

  def find_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:id, :block, :information, :basic_info, :social_links, :about_me, :skills, :work_experience, :about_me_title, :work_experience_title, :component_name, :languages)
  end
end
