class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :set_account, only: [:edit, :update, :destroy]  

  def index
    @articles = Article.page(params[:page]).per(6)
    @liked_counts = LikeLog.group(:article_id).count
  end

  def new
    @article = current_user.articles.build
  end 

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, notice: '新增文章成功' 
    else  
    render :new
    end
  end

  def show 
    @liked_count = LikeLog.where(article_id: @article.id).count
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
    params.require(:article).permit(:title, :content, :id)
  end

  def set_account
    @account = current_user.account
  end
end