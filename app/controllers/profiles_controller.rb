class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = current_user.build_profile
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("new-profile-frame", partial: 'profiles/new') }
      format.html
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      render "users/dashboard"
    else
      flash.now[:alert]= "請檢查表單必填欄位。" 
   end
  end

  def edit
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("edit-profile-frame", partial: 'profiles/edit') }
      format.html
    end
  end

  def update
    if @profile.update(profile_params)
      render "users/dashboard"
    else
      flash.now[:alert]= "請檢查表單必填欄位。" 
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
