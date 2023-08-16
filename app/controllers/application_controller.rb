# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit::Authorization
  def set_locale
    I18n.locale = 'zh-TW'
  end
end
