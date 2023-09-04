class JobsController < ApplicationController
  before_action :set_company, :set_account, only: [:index, :new, :create, :edit, :update, :jobs_list]
  before_action :find_job, only: [:edit, :update, :show, :destroy]

  def index
    if current_user && current_user.role == "employer"
      @jobs = @company.jobs
      @job_list = Job.order(id: :desc)
    else 
      redirect_to root_path
    end
  end

  def new
    @job = @company.jobs.new
  end

  def show
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

  def receive_application 
    job_id_number = params[:id].to_i   
    @job_matchings_record = JobMatching.includes(user: [:resumes, :profile]).where(job_id: job_id_number) 

    if @job_matchings_record.empty?
      redirect_to company_jobs_path(:account), notice: "尚未有求職者應徵該工作"
    elsif current_user && current_user.role == "employer"
      render :receive_application
    else
      redirect_to root_path, notice: "沒有權限觀看" 
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
