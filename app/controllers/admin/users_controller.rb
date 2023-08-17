# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin

    # 顯示所有用戶
    def index
      @users = User.all
    end

    private

    # 使用 Pundit 檢查用戶是否是 admin
    def authorize_admin
      authorize :admin, :access?
    end
  end
end
