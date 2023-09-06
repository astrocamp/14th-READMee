class ProjectsController < ApplicationController
  def show
    @projects = Project.where(profile_id: @profile.id)
  end

  def new
    @project = Project.new
  end

  def create
    @profile = current_user.profile
    @project = Project.new(project_params)
    @project.profile_id = @profile.id
    if @project.save
      redirect_to dashboard_path
    else
      flash.now[:alert] = "請檢查欄位!"
      render :new  
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def project_params
    params.require(:projects).permit(:title, :use_skill, :content)
  end
end
