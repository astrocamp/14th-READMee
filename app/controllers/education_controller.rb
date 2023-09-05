class EducationController < ApplicationController
  include Pundit
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
      flash.now[:alert]="成功"
    else
      render "educaiton/new"
      flash.now[:alert]="錯誤"  
    end
  end

  def edit
    @education = Education.find(params[:id])
  end

  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      redirect_to dashboard_path
    else
      render :edit
      flash.now[:alert]="請檢察欄位!"
    end
  end

  private
  def education_params
    params.require(:education).permit(:title, :start_date, :end_date)
  end
end
