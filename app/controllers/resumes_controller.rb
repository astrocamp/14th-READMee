class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update]

  def new
    @resume = Resume.new
    @profile = current_user.profile
  end

  def index
    @users = User.includes(:resumes)
  end

  def show
    @resume = Resume.find
  end

  def edit
    @profile = current_user.profile
  end

  def update
    if @resume.update(resume_params)
      redirect_to edit_resume_path(account: current_user.account, id: @resume.id)
    else
      render :edit, notice: "請輸入內容"
    end
  end

  def find_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:social_links, :about_me, :languages, :publish, :full_name, :phone, :address, :job_hunting, :work_exp_name_1, :work_exp_content_1, :work_exp_start_date_1, :work_exp_end_date_1, :work_exp_name_2, :work_exp_content_2, :work_exp_start_date_2, :work_exp_end_date_2, :project_name_1, :project_name_2, :project_content_1, :project_content_2, :education_name_1, :education_start_date_1, :education_end_date_1, :education_name_2, :education_start_date_2, :education_end_date_2, :area_1, :area_2, :area_3, :area_4)
  end
  
  
end
 