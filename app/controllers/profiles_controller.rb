class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      render "users/dashboard"
    else
      render "profile/new"
      flash.now[:alert] = "請檢查表單必填欄位。" 
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      render "users/dashboard"
    else
      flash.now[:alert] = "請檢查表單必填欄位。" 
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
