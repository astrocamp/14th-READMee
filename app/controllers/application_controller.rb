# frozen_string_literal: true

# 基礎的應用控制器
class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit::Authorization
  # 避免 CSRF 攻擊
  protect_from_forgery with: :exception

  # 設定語言環境為繁體中文
  def set_locale
    I18n.locale = :'zh-TW'
  end

  # 登入之後跳轉的路徑
  def after_sign_in_path_for(_resource)
    user_profile_path(account: current_user.account)
  end
end
