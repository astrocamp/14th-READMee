# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit::Authorization
  protect_from_forgery with: :exception
  def set_locale
    I18n.locale = :'zh-TW'
  end

  def after_sign_in_path_for(resource)
    case resource.role
    when 'job_seeker'
      profile_path(account: resource.account)
    when 'employer'
      company_path(account: resource.account)
    else
      root_path
    end
  end
end