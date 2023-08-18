class JobsController < ApplicationController
  before_action :find_job, only: %i[edit update show destroy]
  before_action :set_company
  before_action :set_account, only: [:edit, :update, :create]
  def index
    @account = current_user.account
    @jobs = @company.jobs
    @jobList = Job.where(deleted_at: nil).order(id: :desc)
  end

  def new
    @account = current_user.account
    @company = current_user.company
    @job = @company.jobs.new
  end

  def show
  end

  def create
    @company = current_user.company
    @job = @company.jobs.new(params_job)
    if @job.save
        redirect_to jobs_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(params_job)
      redirect_to jobs_path(@company), notice: '編輯成功'
    else
      render :edit
    end
  end

  def destroy 
    @job.destroy
    redirect_to jobs_path(@company), notice: '刪除成功' 
  end

  private
  def params_job
    params.require(:job).permit(:title, :content, :num_of_people, :seniority, :salary)
  end

  def find_job
    @job = Job.find(params[:id])
  end

  def set_company
    @company = current_user.company
  end
  def set_account
    @account = current_user.account
  end
end
