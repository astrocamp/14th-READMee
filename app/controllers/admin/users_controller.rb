# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin
    def index
      @users = User.all
    end

    def switch_role
      if current_user
        if current_user.job_seeker?
          current_user.update(role: 'employer')
        elsif current_user.employer?
          current_user.update(role: 'job_seeker')
        end
        head :ok
      else
        head :forbidden
      end
    end

    private

    def authorize_admin
      current_user.role == 'admin'
    end
  end
end
