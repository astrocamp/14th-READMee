class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_company, only: [:show]
  before_action :find_company, only: [:edit, :update]

  def show
    if current_user.employer?
      @company = Company.find(current_user.company.id)
    else
      @company = Company.find(params[:id])
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
    @company = Company.new(params_company.merge(user_id: current_user.id))
    if @company.save
      redirect_to company_show_path(@company), notice: '公司建立成功!'
    else
      flash.now[:alert] = I18n.t('activerecord.errors')
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
    params.require(:company).permit(:logo, :name, :address, :phone, :about, :population)
  end

  def set_user_company
    @company = current_user.company
  end

  def find_company
    @company = Company.find(current_user.company.id)
  end
end