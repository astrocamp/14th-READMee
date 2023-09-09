class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update]

  def new
    @resume = Resume.new
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("new-resume-frame", partial: 'resumes/new') }
      format.html
    end
  end

  def index
    @users = User.includes(:resumes)
  end

  def show
    @resume = Resume.find
    @skills = JSON.parse(@resume.skills)
    @languages = eval(@resume.languages)
  end

  def edit
    @profile = current_user.profile
    @skills = current_user.profile.skills
    @languages = current_user.profile.languages
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
    params.require(:resume).permit(:id, :social_links, :skills, :user_id, :about_me, :about_me_title, :work_experience_title, :languages, :project_title, :education_title, :publish, :full_name, :phone, :address, :job_hunting, :work_experience_name, :work_start_date, :work_end_date, :project_name_1, :project_name_2, :project_content_1, :project_content_2, :education_name, :education_start_date, :education_end_date)
  end
end
