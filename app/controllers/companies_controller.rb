class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update]
  def show
  end

  def new
    if current_user.company.present?
      redirect_to current_user.company, alert: "您已經創建了公司"
    else
      @company = Company.new
    end
  end

  def create
    if current_user.company.present?
      redirect_to root_path, alert: "您已經創建了公司"
    else
      @company = Company.new(params_company)
      @company.user = current_user
        
      if @company.save
        redirect_to company_path, notice: "公司創建成功"
      else
        render :new
      end
    end
  end

  def edit
  end
  
  def update
    if @company.update(params_company)
      redirect_to company_path(@account), notice: "編輯成功"
    else
      render :edit
    end
  end
    
  
  private
  def params_company
    params.require(:company).permit(:name, :address, :phone, :address, :about, :population)
  end

  def set_company
    @company = current_user.company
  end
  def set_account
    @account = current_user.account
  end
end
