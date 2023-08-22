class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @resume_id = Resume.first.id
    @resume_basic_info = Resume.first.basic_info
  end

  def new
    @profile = current_user.build_profile
    @profile.skills.build
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @resume = current_user.resumes.build
    if @profile.save
      @resume.save
      redirect_to profile_path(account: current_user), notice: "恭喜完成第一步！建立個人檔案成功！"
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: '更新個人檔案成功！'
    else
      render :edit
    end
  end

  private
  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:avatar, :full_name, :phone, :address, :job_title, :education, :about_me, :work_experience, :projects, :linkedin, :facebook, :github, :website, languages: {}, skill_ids: [])
  end
end
