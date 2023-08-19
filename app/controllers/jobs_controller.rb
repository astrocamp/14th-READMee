class JobsController < ApplicationController
  before_action :set_company, :set_account, only: %i[index new create edit update]
  before_action :find_job, only: %i[edit update show destroy]

  def index
    @jobs = @company.jobs
    @jobList = Job.where(deleted_at: nil).order(id: :desc)
  end

  def new
    @job = @company.jobs.new
  end

  def show; end

  def create
    @job = @company.jobs.new(params_job)
    if @job.save
      redirect_to company_jobs_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(params_job)
      redirect_to company_jobs_path, notice: '編輯成功'
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to company_jobs_path, notice: '刪除成功'
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
