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
      redirect_to dashboard_path(account: current_user.account)
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
    redirect_to jobs_list_path, notice: "已應徵，請至應徵紀錄查看"
  end
  
  def apply_job
    if current_user.role == "job_seeker"
      @job_matchings = current_user.job_matchings.where(user_id: current_user)
    else
      redirect_to root_path, notice: "沒有權限觀看"
    end
  end

  def dashboard
    @profile = current_user.profile
    if @profile.present?
      @projects = Project.where(profile_id: @profile.id)
      @education = Education.where(profile_id: @profile.id)
      @social_link = SocialLink.where(profile_id: @profile.id)
    end
  end
end
