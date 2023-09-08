# frozen_string_literal: true

class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  def confirmation_instructions(record, token, opt = {})
    headers['Custom-header'] = 'Bar'
    opt[:subject] = '請驗證您的Email信箱'
    opt[:from] = 'postmaster@mg.readmee.org'
    opt[:reply_to] = 'support@readmee.org'
    super
  end

  def reset_password_instructions(record, token, opt = {})
    headers['Custom-header'] = 'Bar'
    opt[:subject] = '密碼重設步驟'
    opt[:from] = 'postmaster@mg.readmee.org'
    opt[:reply_to] = 'support@readmee.org'
    super
  end
end