class JobsController < ApplicationController
  before_action :set_company, :set_account, only: [:index, :new, :create, :edit, :update]
  before_action :find_job, only: [:edit, :update, :show, :destroy]

  def index
    if current_user && current_user.role == "employer"
      @jobs = @company.jobs.order(id: :desc)
      @job_list = Job.order(id: :desc)
    else
      redirect_to root_path
    end
  end

  def new
    @job = @company.jobs.new
  end

  def show
    @job_match = current_user.job_matchings
  end

  def create
    @job = @company.jobs.new(params_job)
    if @job.save
      redirect_to company_jobs_path, notice: '新增成功'
    else
      render :new
    end
  end

  def edit
  end

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

  def jobs_list
    @choose = Job.ransack(params[:q])
    @jobs_list = @choose.result.includes(:company).order(id: :desc)
  end

  def receive_applicant
    job_id_number = params[:id].to_i
    @job_matchings_record = JobMatching.includes(user: [:resumes, :profile]).where(job_id: job_id_number).order(id: :desc)
  
    if @job_matchings_record.present?
      render :receive_applicant
    else
      flash[:alert] = "尚無應徵者"
      redirect_to company_jobs_path(current_user.account)
    end
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
