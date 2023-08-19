class CompaniesController < ApplicationController
  # before_action :set_company, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update]
  def show
    if current_user.employer? && current_user.company.present?
      @company = current_user.company
    else
      redirect_to new_company_path(account: current_user.account)
    end
  end

  def new
      @company = Company.new
  end

  def create
      @company = Company.new(params_company)
      @company.user = current_user
        
      if @company.save
        redirect_to company_path, notice: "公司建立成功!"
      else
        render :new
      end
  end

  def edit
    @company = current_user.company
    if @company.save
      redirect_to company_path, notice: '修改成功!'
    else
      render edit
    end
  end
  
  def update
    @company = current_user.company
  end
    
  
  private
  def params_company
    params.require(:company).permit(:name, :address, :phone, :about, :population)
  end

  def set_company
    @company = current_user.company
  end

  def set_account
    @account = current_user.account
  end
end
