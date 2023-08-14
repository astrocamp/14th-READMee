class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
    def show
        @company = Company.find(params[:id])
    end

    def new
      # 检查当前用户是否已经有关联的 Company 记录
      if current_user.company.present?
        redirect_to current_user.company, alert: "您已經創建了公司"
      else
        @company = Company.new
      end
    end

    def create
      # 检查当前用户是否已经有关联的 Company 记录
      if current_user.company.present?
        redirect_to current_user.company, alert: "您已經創建了公司"
      else
        @company = Company.new(params_company)
        @company.user = current_user
        
        if @company.save
          redirect_to @company, notice: "公司創建成功"
        else
          render :new
        end
      end
    end

    def edit
      @company = Company.find(params[:id])
    end
    
    def update
      if @company.update(params_company)
        redirect_to company_path(@company), notice: "編輯成功"
      else
        render :new
      end
    end
      
    
    private
    def params_company
        params.require(:company).permit(:name, :address, :phone, :address, :about, :population)
    end

    def set_company
      @company = current_user.company
    end
end
