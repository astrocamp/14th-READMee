# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController  
  def create
    # 在这里编写处理登录成功后的逻辑，例如创建或更新用户数据
    auth_info = request.env['omniauth.auth']
    # 假设你已经获得了用户对象
    @current_user = User.find_by(email: auth_info.info.email)
    session[:user_id] = @current_user.id if @current_user
    redirect_to root_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
