class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:create]
  
  def create
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to article_path(@article), notice: '留言成功'
    else
      redirect_to article_path(@comment.article), alert: '留言不能空白'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
  
    if @comment.destroy
      redirect_to article_path(@comment.article), notice: '留言删除成功'
    else
      redirect_to article_path(@comment.article), alert: '無法删除留言'
    end
  end
  
  private

  def find_article
    @article = Article.find(params[:article_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end  
end
