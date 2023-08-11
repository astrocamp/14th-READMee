class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
    def show
        @company = Company.find(params[:id])
    end

    def new
        @company = Company.new
    end

    def create
      @company = Company.new(params_company)
      if @company.save
          redirect_to company_path(@company), notice: "新增成功"
      else
          render :new
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
      @company = Company.find(params[:id])
    end
end
