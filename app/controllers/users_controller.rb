class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:apply_job]

  def toggle
    if current_user.employer?
      current_user.update(role: :job_seeker)
    elsif current_user.job_seeker?
      current_user.update(role: :employer)
    end
    redirect_to root_path, notice: "角色已切换"
  end

  def select_role
  end

  def job_seeker
    current_user.role = 'job_seeker'
    current_user.save
    if current_user.save
      flash[:notice] = '您是求職者了！請填寫基本資料'
      redirect_to profile_path(account: current_user.account)
    end
  end

  def employer
    current_user.role = 'employer'
    current_user.save
    if current_user.save
      flash[:notice] = '您是雇主了！請填寫基本資料'
      redirect_to new_company_path(account: current_user.account)
    end
  end

  def job_application
    @job_matching = JobMatching.new
    JobMatching.create_matching(current_user.id, params[:job].to_i, params[:company].to_i, @job_matching)
    redirect_to jobs_list_path, notice: "您已應徵該工作，請至個人頁查看"
  end
  
  def apply_job
    if current_user.role == "job_seeker"
      @job_matchings = current_user.job_matchings.distinct.pluck(:job_id)
      @job_matchings_time = current_user.job_matchings.where(user_id: current_user)
      @jobs = Job.where(id: @job_matchings)
    else
      redirect_to root_path, notice: "沒有權限觀看"
    end
  end
end