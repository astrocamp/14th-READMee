# frozen_string_literal: true

# 自訂的用戶登入控制器
class Users::SessionsController < Devise::SessionsController
  # 處理使用 Google OAuth2 登入的方法
  def create
    auth_info = request.env["omniauth.auth"]
    @current_user = User.find_by(email: auth_info.info.email)
    session[:user_id] = @current_user.id if @current_user
    redirect_to root_path
  end
end
