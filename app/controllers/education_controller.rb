class EducationController < ApplicationController
  before_action :set_education, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:show, :create, :update, :destroy]

  def new
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.profile_id = @profile.id
    if @education.save
      find_educaiton
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_education', partial: 'education/show') }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @education.update(education_params)
      find_educaiton
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_education', partial: 'education/show') }
      end
    else
      render :edit
    end
  end

  def destroy
    if @education.destroy
      @profile = current_user.profile
      find_educaiton
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_education', partial: 'education/show') }
      end
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
    @education = Education.where(profile_id: @profile.id).order(id: :asc)
  end

  def education_params
    params.require(:education).permit(:title, :start_date, :end_date)
  end
end
