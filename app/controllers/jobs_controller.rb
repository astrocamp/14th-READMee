class JobsController < ApplicationController
    before_action :find_job, only: [:edit, :update, :show, :destroy]

    def index
        @jobList = Job.where(deleted_at: nil).order(id: :desc)
    end

    def new
        @job = Job.new
    end

    def show
        
    end

    def create
        @job = Job.new(params_job)
        if @job.save
            redirect_to root_path, notice: "新增成功"
        else
            render :new, alert: "請填寫完整"
        end
    end

    def edit
        
    end

    def update
        
        if @job.update(params_job)
            redirect_to root_path, notice: "編輯成功"
        else
            render :new, alert: "請填寫完整"
        end
    end

    def destroy
        
        # @job.destroy
        @job.update(deleted_at: Time.current)
        redirect_to root_path, notice: "刪除成功"
        
    end

    private
    def params_job
        params.require(:job).permit(:title, :content, :num_of_people, :seniority, :salary)
        
    end
    def find_job
        @job = Job.find(params[:id])
    end

end
