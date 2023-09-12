# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :set_locale
  include Pundit::Authorization

  def set_locale
    I18n.locale = :'zh-TW'
  end

  private

  def not_found
    render file: Rails.root.join('public', '404.html'),
           status: 404,
           layout: false
  end
  
  def after_sign_in_path_for(resource)
    if current_user.role.nil?
      flash[:notice] = "請選擇身分"
      select_role_path
    else
      root_path
    end
  end  
end
