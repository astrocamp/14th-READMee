class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update]
  before_action :set_company, only: [:show, :edit, :update]

  def show
    if user_has_company?
      @company = Company.find(params[:id])
      authorize @company
    else
      redirect_to new_company_path
    end
  end

  def new
    @company = Company.new
    authorize @company
  end

  def create
    @company = Company.new(params_company)
    @company.user = current_user
    authorize @company

    if @company.save
      redirect_to company_path, notice: '公司建立成功!'
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
    authorize @company
  end

  def update
    @company = Company.find(params[:id])
    authorize @company

    if @company.update(params_company)
      redirect_to company_path, notice: '公司資訊已更新!'
    else
      render :edit
    end
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
