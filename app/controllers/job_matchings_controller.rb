class JobMatchingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_matched_jobs, only: [:update, :edit]

  def edit
  end

  def update
    if @job_matching.update(job_matching_params)
      redirect_to receive_applicant_path(current_user.company), notice: '已發送面試通知！'
    else
      render :edit
    end
  end

  private

  def find_matched_jobs
    @job_matching = current_user.job_matchings.find(params[:id])
  end

  def job_matching_params
    params.require(:job_matching)
          .permit(:job_id,
                  :company_id,
                  :interview_date,
                  :interview_time,
                  :interview_message)
          .merge({ user_id: current_user.id, notified: true })
  end
end
