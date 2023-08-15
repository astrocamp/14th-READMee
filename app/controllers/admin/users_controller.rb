class Admin::UsersController < ApplicationController
    before_action :authorize_admin

    def index
      # 顯示所有用戶
      @users = User.all
    end
  
    # 其他控制器動作...
    
    private
  
    def authorize_admin
      # 使用 Pundit 策略檢查用戶是否是 admin
      authorize :admin, :access?
    end
end
