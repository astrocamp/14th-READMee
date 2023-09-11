class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_company, only: [:show]
  before_action :find_company, only: [:edit, :update]

  def show
    if current_user.company.present?
      @company = Company.find(current_user.company.id)
    else
      redirect_to new_company_path, alert: '您尚未建立公司!'
    end
  end

  def new
    if current_user.company.present?
      redirect_to company_show_path(current_user.company.id)
    else
      @company = Company.new
    end
  end

  def create
    @company = current_user.build_company(params_company)
    if @company.save
      redirect_to company_show_path(@company), notice: '公司建立成功!'
    else
      flash.now[:alert] = @company.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(params_company)
      redirect_to company_show_path(current_user.company.id), notice: '更新成功!'
    else
      render :edit
    end
  end

  
  private

  def params_company
    params.require(:company).permit(:avatar, :name, :address, :phone, :about, :population)
  end

  def set_user_company
    @company = current_user.company
  end

  def find_company
    @company = Company.find(current_user.company.id)
  end
end