class EducationController < ApplicationController
  before_action :set_education, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:show, :create, :update, :destroy]

  def _show
    find_educaiton
  end

  def new
    if current_user.profile.present?
      @education = Education.new
    else
      render "users/dashboard"
    end
  end

  def create
    @education = Education.new(education_params)
    @education.profile_id = @profile.id
    if @education.save
      find_educaiton
      render "_show"
    else
      flash.now[:alert] = "請檢察欄位!"
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      find_educaiton
      render "_show"  
    else
      flash.now[:alert] = "請檢察欄位!"
    end
  end

  def destroy
    if @education.destroy
      @profile = current_user.profile
      find_educaiton
      render "_show"
    end
  end  

  private

  def set_education
    @education = Education.find(params[:id])
  end

  def set_profile
    @profile = current_user.profile
  end

  def find_educaiton
    @education = Education.where(profile_id: @profile.id)
  end

  def education_params
    params.require(:education).permit(:title, :start_date, :end_date)
  end
end
