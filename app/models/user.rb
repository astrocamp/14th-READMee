# frozen_string_literal: true

class User < ApplicationRecord
  before_save :set_account

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_one :profile
  has_one :company
  has_many :resumes
  has_many :articles
  has_many :job_matchings
  has_many :jobs, through: :job_matchings
  enum role: { job_seeker: 0, employer: 1, admin: 2 }

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

  def role_unset?
    role == 'nil'
  end
  
  def admin?
    role == 'admin'
  end

  def employer?
    role == 'employer'
  end

  def job_seeker?
    role == 'job_seeker'
  end

  def company?
    company.present?
  end
end
