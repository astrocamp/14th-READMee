# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :set_locale
  include Pundit::Authorization
  protect_from_forgery with: :exception
  
  def set_locale
    I18n.locale = :'zh-TW'
  end

  private

  def not_found
    render file: Rails.root.join('public', '404.html'),
                status: 404,
                layout: false
  end
end