# frozen_string_literal: true

# 使用者模型
class User < ApplicationRecord
  before_save :set_account

  # 包含 Devise 預設的模組，其他可用的模組有:
  # :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_one :profile

  enum role: { job_seeker: 0, employer: 1, admin: 2 }

  # 如果找到 user，則登入，否則創建一個新的 user
  def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.provider = provider_data.provider
      user.uid = provider_data.uid
    end
  end

  def set_account
    self.account = email.split('@').first if email.present?
  end

  def admin?
    role == 'admin'
  end
end
