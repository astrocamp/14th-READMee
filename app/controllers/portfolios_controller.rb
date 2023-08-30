class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :find_portfolio, only: [:edit, :destroy]

  def index
    @portfolio_new = Portfolio.new
    @portfolios = Portfolio.order(id: :desc)
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to edit_portfolio_path(id: @portfolio), notice: "新增作品集成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path
  end

  private

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:id, :name)
  end
end
