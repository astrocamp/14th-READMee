class JobMatchingsController < ApplicationController
  before_action :find_job_matchings

  def edit
  end

  def update
    if @job_matching.update(job_matching_params)
      redirect_to job_matchings_path(current_user.account), notice: '更新個人檔案成功！'
    else
      render :edit
    end
  end

  private

  def find_job_matchings
    @job_matching = JobMatching.find(params[:id])
  end

  def job_matching_params
    params.require(:job_matching).permit(:interview_date, :interview_time, :interview_message, :notified)
  end
end
