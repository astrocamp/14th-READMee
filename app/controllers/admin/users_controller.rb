# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin
    def index
      @users = User.all
    end

    private

    def access?
      user.admin?
    end

    def authorize_admin
      current_user.role == 'admin'
    end
  end
end
