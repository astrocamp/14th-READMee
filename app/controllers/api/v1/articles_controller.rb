class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def like
    article = Article.find(params[:id])
    if current_user.liked?(article)
      current_user.unlike!(article)
      render json: { liked: false }
    else
      current_user.like!(article)
      render json: { liked: true }
    end
  end
end
