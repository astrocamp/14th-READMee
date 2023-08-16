class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_resume, only: [:edit, :update, :second]

  def edit
  end

  def update
    if @resume.update(resume_params)
      respond_to do |format|
        format.json { render json: { message: @resume.basic_info } }
      end
    else
      render :edit
    end
  end

  def second
    @component_name = params[:component_name]
    @component_integer = params[:component_name].to_i
    if @resume.update(component_name: @component_integer)
    flash[:notice] = '更新組件成功'
    else
    flash[:alert] = '更新組件失敗'
    end
  end

  def find_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:id, :block, :information, :basic_info, :component_name)
  end
end
