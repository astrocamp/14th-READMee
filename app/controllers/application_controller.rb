# frozen_string_literal: true

# 基礎的應用控制器
class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit::Authorization

  # 設定語言環境為繁體中文
  def set_locale
    I18n.locale = :'zh-TW'
  end
end
