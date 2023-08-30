class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update]

  def index
    @users = User.includes(:resumes)
  end

  def show
    @resume = Resume.find(params[:id])
    @skills = JSON.parse(@resume.skills)
  end

  def edit
    if @resume.basic_info.present?
      @resume = Resume.find(params[:id])
      @skills = JSON.parse(@resume.skills)
      @languages = eval(@resume.languages)
    else
      @resume = current_user.resumes.find(params[:id])
      @skills = JSON.parse(@resume.skills)
      @languages = eval(@resume.languages)
    end
  end

  def update
    if params[:published] == "發佈" && params[:publish] == "false"
      @resume.update(publish: true)
      redirect_to resumes_path
    elsif params[:save] == "更新"
      if @resume.update(resume_params)
        redirect_to edit_resume_path(account: current_user.account, id: @resume)
      else
        render :edit
      end
    end
  end

  def find_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:id, :block, :information, :basic_info, :social_links, :about_me, :skills, :work_experience, :about_me_title, :work_experience_title, :component_name, :languages, :project, :project_title, :education, :education_title, :published, :publish)
  end
end