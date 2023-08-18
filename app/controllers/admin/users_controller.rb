# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :authorize_admin
    def index
      @users = User.all
    end

    private

    def authorize_admin
      authorize :admin, :access?
    end
  end
end
