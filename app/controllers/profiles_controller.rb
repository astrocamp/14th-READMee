class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    @profile = current_user.profile
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to dashboard_path
    else
      flash.now[:alert] = "請檢查表單必填欄位。" 
      render :new
    end
  end

  def edit
  end

  def update
    @works = WorkExperience.where(profile_id: @profile.id)
    if @profile.update(profile_params)
      render "users/dashboard"
    else
      flash.now[:alert] = "請檢查表單必填欄位。" 
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:avatar, :full_name, :phone, :address, :about_me, :languages, :job_hunting, :social_link, skill_ids: [], languages: {})
  end
end
