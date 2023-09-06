class JobMatchingsController < ApplicationController
  before_action :find_job_matchings, only: [:update, :edit]

  def edit
  end

  def update
    if @job_matching.update(job_matching_params) && @job_matching.update(notified: true)
      redirect_to receive_applicant_path(current_user.company.id), notice: '已發送面試通知！'
    else
      render :edit
    end
  end

  private

  def find_job_matchings
    @job_matching = JobMatching.find(params[:id])
  end

  def job_matching_params
    params.require(:job_matching).permit(:user_id, :job_id, :company_id, :interview_date, :interview_time, :interview_message, :notified)
  end
end
