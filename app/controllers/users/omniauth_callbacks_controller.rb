class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # 新增此段第三方登入的方法
  def google_oauth2
    @user = User.create_from_provider_data(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  # 及這段第三方登入失敗的處理方法
  def failure 
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.faile'
    redirect_to root_path
  end
end