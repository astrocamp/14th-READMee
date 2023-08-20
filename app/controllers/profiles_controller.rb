class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show
    if current_user.job_seeker? && current_user.profile.present?
      # 顯示個人資料頁面
    else
      redirect_to new_profile_path(account: current_user.account)
    end
  end

  def new
    @profile = current_user.build_profile
    @profile.skills.build
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      current_user.update(role: params[:user][:role].to_i) # 將選擇的角色轉換為整數並更新使用者的角色
      p '成功'
      # redirect_to profile_path(@profile), notice: '恭喜完成第一步！建立個人檔案成功！'
    else
      p '錯誤'
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
    params.require(:profile).permit(
      :avatar, :full_name, :phone, :address, :job_title, :education,
      :about_me, :work_experience, :projects, :linkedin, :facebook, :github, :website,
      languages: {}, skills_attributes: %i[id tag _destroy]
    ).merge(user_attributes: { role: params[:user][:role] }) # 將選擇的角色合併到 user_attributes 中
  end
  
end
