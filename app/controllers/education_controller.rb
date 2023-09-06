class EducationController < ApplicationController
  before_action :set_education, only: [:edit, :update, :destroy]

  def show
  end

  def new
    if current_user.profile.present?
      @education = Education.new
    else
      redirect_to dashboard_path, notice: "請先建立個人檔案"
    end
  end

  def create
    @profile = current_user.profile
    @education = Education.new(education_params)
    @education.profile_id = current_user.profile.id
    if @education.save
      redirect_to dashboard_path
    else
      render "educaiton/new"
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      redirect_to dashboard_path
    else
      render :edit
      flash.now[:alert] = "請檢察欄位!"
    end
  end

  def destroy
    if @education.destroy
      redirect_to dashboard_path
    end
  end  

  private

  def set_education
    @education = Education.find(params[:id])
  end

  def education_params
    params.require(:education).permit(:title, :start_date, :end_date)
  end
end
