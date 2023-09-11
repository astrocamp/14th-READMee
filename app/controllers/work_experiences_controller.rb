class WorkExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_work, only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:create, :update, :destroy]

  def new
    @works = WorkExperience.new
  end

  def create
    @works = WorkExperience.new(work_params)
    @works.profile_id = @profile.id
    if @works.save
      find_work_experience
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_workexp', partial: 'work_experiences/show') }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @works.update(work_params)
      find_work_experience
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_workexp', partial: 'work_experiences/show') }
      end
    else
      render :eidt
    end
  end
  
  def destroy
    if @works.destroy
      find_work_experience
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('show_workexp', partial: 'work_experiences/show') }
      end
    end
  end

  private

  def work_params
    params.require(:work_experience).permit(:title, :start_date, :end_date)
  end

  def set_work
    @works = WorkExperience.find(params[:id])
  end

  def set_profile
    @profile = current_user.profile
  end

  def find_work_experience 
    @works = WorkExperience.where(profile_id: @profile.id).order(id: :asc)
  end
end
