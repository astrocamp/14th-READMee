class ResumesController < ApplicationController
  include ActionView::Helpers::SanitizeHelper

  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update, :second]

  def edit
    @skills = JSON.parse(@resume.skills)
    @formatted_basic_info = sanitize(@resume.basic_info).gsub("\n", '<br>').html_safe
    @formatted_social_links = sanitize(@resume.social_links).gsub("\n", '<br>').html_safe
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
              work_experience_title: @resume.work_experience_title
            } 
          } 
        }
      end
    else
      render :edit
    end
  end

  def second
    @component_name = params[:component_name]
    @component_integer = params[:component_name].to_i
    if @resume.update(component_name: @component_integer)
      flash[:notice] = '更新組件成功'
    else
      flash[:alert] = '更新組件失敗'
    end
  end

  def find_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:id, :block, :information, :basic_info, :social_links, :about_me, :skills, :work_experience, :about_me_title, :work_experience_title, :component_name)
  end
end
