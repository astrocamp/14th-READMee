class Api::V1::ArticlesController < ApplicationController
  def like
    render json: {liked: true, id: params[:id]}
  end
  
end
