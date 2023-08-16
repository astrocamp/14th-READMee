# frozen_string_literal: true

# 處理用戶的Omniauth回調
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # 從Google數據創建用戶
    @user = User.create_from_provider_data(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: "Google")
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:notice] = I18n.t("devise.omniauth_callbacks.faile")
    redirect_to root_path
  end
end
