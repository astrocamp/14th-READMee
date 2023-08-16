# frozen_string_literal: true

# 自訂的用戶註冊控制器
class Users::RegistrationsController < Devise::RegistrationsController
  # 在創建用戶時，調用父類的方法，並在保存後調用自定義方法設定帳號
  def create
    super do |resource|
      resource.set_account
    end
  end

  # 設定允許的註冊參數
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account])
  end
end
