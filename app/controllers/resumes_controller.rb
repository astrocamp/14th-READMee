class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update]

  def edit
    @resume = current_user.resumes.find(params[:id])
    @resume_id = @resume.id
    if @resume.basic_info.present?
    else
      @profile = current_user.profile
      @resume = Resume.create_with_basic_info(current_user.profile)
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to edit_resume_path(account: current_user.account, id: @resume)
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
