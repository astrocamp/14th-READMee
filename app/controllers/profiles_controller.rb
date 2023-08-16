# frozen_string_literal: true

# 使用者個人資料控制器
class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show; end
end
