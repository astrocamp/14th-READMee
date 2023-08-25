class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    if current_user && current_user.profile.present?
      @resume_id = Resume.first.id
      @resume_basic_info = Resume.first.basic_info
      @profile = Profile.find(current_user.profile.id)
    else
      redirect_to new_profile_path(current_user.account)
    end
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    @resume = current_user.resumes.build
    if @profile.save
      @resume.save
      redirect_to profile_path(current_user.account), notice: '恭喜完成第一步！建立個人檔案成功！'
    else
      flash[:alert] = '個人檔案建立失敗，請檢查表單內容。'
      render :new, alert: "請檢查表單必填欄位。"
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user.account), notice: '更新個人檔案成功！'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:avatar, :full_name, :phone, :address, :job_title, :education,
                                    :about_me, :work_experience, :projects, :linkedin, :facebook, :github, :website, languages: {}, skill_ids: [])
  end
end
