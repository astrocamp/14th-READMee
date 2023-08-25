class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:edit, :update, :destroy]  

  def index
    @articles = Article.order(id: :desc)      
  end

  def new
    @article = Article.new
  end 

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: '新增文章成功' 
    else
      render :new
    end
  end

  def show 
  end

  def edit    
  end

  def update  
    if @article.update(article_params)
      redirect_to articles_path, notice: '更新文章成功'
    else
      render :edit
    end    
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: '文章刪除成功'
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end 

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_account
    @account = current_user.account
  end
end