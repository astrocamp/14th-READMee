class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @profile = current_user.profile
    @projects = Project.new(project_params)
    @projects.profile_id = @profile.id
    if @projects.save
      find_projects
      render "users/dashboard"
    else
      flash.now[:alert] = "請檢查欄位!"
      render :new  
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @projects = Project.find(params[:id])
    if @projects.update(project_params)
      render "users/dashboard"
    else
      flash.now[:alert] = "請檢查欄位"
      render :edit
    end
  end

  def destroy
    @profile = current_user.profile
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to dashboard_path
    end
  end

  private

  def project_params
    params.require(:projects).permit(:title, :use_skill, :content)
  end

  def find_projects
    @projects = Project.where(profile_id: @profile.id)
  end
end
