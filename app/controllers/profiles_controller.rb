class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path, notice: "Profile was successfully saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private
  
  def set_profile
    @profile = current_user
  end

  def profile_params
    params.require(:profile).permit(:avatar, :full_name, :phone, :address, :education, :about_me, :work_experience, :projects, :linkedin, :facebook, :github, :website, languages: {})
  end
end
