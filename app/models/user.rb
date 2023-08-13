class User < ApplicationRecord
  before_save :set_account
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,:omniauthable, omniauth_providers: [:google_oauth2]

  enum role: { job_seeker: 0, employer: 1, admin: 2 }

  # 找到user的話就登入，找不到就create新的user
  def self.create_from_provider_data(provider_data)
    where(email: provider_data.info.email).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = provider_data.info.last_name
      user.provider = provider_data.provider
      user.uid = provider_data.uid
    end
  end
  def set_account
    self.account = email.split('@').first if email.present?
  end

  has_one :company
end
