class JobMatchingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_matched_jobs, only: [:update, :edit]

  def edit
    flash[:notice] = "請填寫日期與時間"
  end

  def update
    if @job_matching.update(job_matching_params)
      redirect_to company_jobs_path(current_user.account), notice: '已發送面試通知！'
    else
      render :edit
    end
  end

  private

  def find_matched_jobs
    @job_matching = JobMatching.find(params[:id])
  end

  def job_matching_params
    params.require(:job_matching)
          .permit(:job_id,
                  :company_id,
                  :notified,
                  :interview_date,
                  :interview_time,
                  :interview_message)
  end
end
