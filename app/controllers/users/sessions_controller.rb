# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    auth_info = request.env["omniauth.auth"]
    @current_user = User.find_by(email: auth_info.info.email)
    session[:user_id] = @current_user.id if @current_user
    redirect_to root_path
  end
end
